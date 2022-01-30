package com.problemstatement.Team11.controller;

import com.problemstatement.Team11.model.EmailSenderService;
import com.problemstatement.Team11.model.Request;
import com.problemstatement.Team11.repository.RequestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

//import com.sun.org.apache.xpath.internal.operations.Mod;
//import sun.text.normalizer.NormalizerBase;


class SortByTime implements Comparator<Request> {
    // Used for sorting in ascending order of ID
    public int compare(Request a, Request b)
    {
        long f=Date.UTC(a.getYy(),a.getMm(),a.getDd(),a.getStimehh(),a.getStimemm(),0);
        long s=Date.UTC(b.getYy(),b.getMm(),b.getDd(),b.getStimehh(),b.getStimemm(),0);
        return f>s?1:(s>f?-1:0);

    }
}

@RestController
public class main {
    @Autowired
    RequestRepo repo;

    @Autowired
    private EmailSenderService service;


    @GetMapping("/")
    public ModelAndView landing(){
        ModelAndView mv=new ModelAndView("landing");
        return mv;
    }

    @RequestMapping("/exit")
    public ModelAndView exit(HttpServletRequest request){
        new SecurityContextLogoutHandler().logout(request, null, null);
        ModelAndView mv=new ModelAndView("landing");
        return mv;
    }

    @GetMapping("/login/userpage")
    public ModelAndView userPage(@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv;

        String usermail=principal.getAttribute("email");
        String domain=principal.getAttribute("hd");
        System.out.println(domain.length());

        if(domain.equals("sabre.com")==true){

            mv = new ModelAndView("user");

            mv.addObject("mailid",usermail);

            List<Request> userreqs=repo.findByEmail(usermail);
            mv.addObject("res",userreqs);

        }else{

            String reason="You are not from an organisation domain";
            mv = new ModelAndView("failure");
            mv.addObject("cause",reason);
        }

        return mv;
    }

    @GetMapping("/login/request")
    public ModelAndView request(@AuthenticationPrincipal OAuth2User principal){

        ModelAndView mv=new ModelAndView("request");
        String usermail=principal.getAttribute("email");
        mv.addObject("mailid",usermail);
        return mv;
    }

    @GetMapping("/login/adminpage")
    public ModelAndView adminPage(@AuthenticationPrincipal OAuth2User principal,HttpServletRequest request){
        ModelAndView mv;
        String usermail=principal.getAttribute("email");

        if(usermail.toLowerCase().equals("ajavinash63@gmail.com")==true){
            mv = new ModelAndView("adminloc");
            mv.addObject("mailid",usermail);
        }else{
            String reason="Not an Admin";
            new SecurityContextLogoutHandler().logout(request, null, null);
            mv = new ModelAndView("failure");
            mv.addObject("cause",reason);
        }

        return mv;
    }

    @GetMapping("/login/{id}")
    public ModelAndView trackStatus(@PathVariable("id") int id,@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv;
        Request res=repo.findById(id).orElse(new Request());
        String usermail=principal.getAttribute("email");

        if(res.getRid()==0){
            mv=new ModelAndView("failure");
        }
        else{
            Timestamp t=Timestamp.from(Instant.now());
            long temp=Date.UTC(res.getYy(),res.getMm(),res.getDd(),res.getEtimehh(),res.getEtimemm(),0);
            //if current time is more and current - event time less than a day
            if(t.getTime() - temp<=86400000){
                mv=new ModelAndView("success");
                System.out.println("success");
                mv.addObject("r",res);
            }else{
                mv=new ModelAndView("failure");
                String reason="Time expired!!";
                mv.addObject("cause",reason);
                System.out.println("failure");
            }

        }
        mv.addObject("mailid",usermail);
        return mv;
    }


    @GetMapping("/login/info/{id}")
    public ModelAndView fullInfo(@PathVariable("id") int id,@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv;
        String usermail=principal.getAttribute("email");

        Request res=repo.findById(id).orElse(new Request());

        if(res.getRid()==0){
            mv=new ModelAndView("failure");
        }
        else{
            mv=new ModelAndView("info");
            mv.addObject("r",res);
        }
        mv.addObject("mailid",usermail);
        return mv;
    }


    @PostMapping("/login/adminorder/{id}")
    public ModelAndView adminOrder(@PathVariable("id") int id,@RequestParam int cost,@RequestParam String status
    ,@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv;

        Request res=repo.findById(id).orElse(new Request());
        res.setCost(cost);
        res.setStatus(status);
        repo.save(res);
        String usermail=principal.getAttribute("email");

/////////////////////////////mail sending
        String temp="https://sincere-bongo-339717.an.r.appspot.com/login/"+String.valueOf(res.getRid());
        String Htmlbody="<h3>Dear "+ principal.getAttribute("name").toString() +"</h3></br>"
                + "<p>Your meeting room request status: <h4> "+ status +"</h4><br>"
                + "<strong>Team11.org </strong>.</p>" + "</br></br>"
                + "<p>For more detail click on this : <a href=\"" + temp + "\">Link</a> </p>";

        service.sendSimpleEmail(res.getEmail(),Htmlbody,"Status updated for the meeting room request");
/////////////////////////////////////

        if(res.getRid()==0){
            mv=new ModelAndView("failure");
        }
        else{
            mv=new ModelAndView("permi");
            String location=res.getLocation();
            List<Request> pendingreqs=repo.findByLocationStatus(location,"Pending");
            Collections.sort(pendingreqs,new SortByTime());

            List<Request> approvedreqs=repo.findByLocationStatus(location,"Approved");
            Collections.sort(approvedreqs,new SortByTime());


            mv.addObject("res",pendingreqs);
            mv.addObject("res1",approvedreqs);
        }
        mv.addObject("mailid",usermail);
        return mv;
    }


    @PostMapping("/login/getrequest")
    public ModelAndView getRequest(Request requestcreated,@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv=new ModelAndView("submit");
        String usermail=principal.getAttribute("email");
        Timestamp t=Timestamp.from(Instant.now());
        requestcreated.setEmail(usermail);
        requestcreated.setSubtime(t);
        requestcreated.setCost(0);
        requestcreated.setPaymentstatus("Pending");
        requestcreated.setStatus("Pending");
        requestcreated.setAllotment("Pending");
        requestcreated.setRoom(-1);
        repo.save(requestcreated);


        String temp="https://sincere-bongo-339717.an.r.appspot.com/login/"+String.valueOf(requestcreated.getRid());
        //////////////////
        String Htmlbody="<h3>Dear "+ principal.getAttribute("name").toString() +"</h3></br>"
                + "<p>We have received your application. <br>"
                + "<strong>Team11.org </strong>.</p>" + "</br></br>"
                + "<p>To track click on this : <a href=\"" + temp + "\">Link</a> </p>";

        //sending mail
        service.sendSimpleEmail(usermail,Htmlbody,"Meeting room application submitted");
        mv.addObject("mailid",usermail);
        return mv;
    }


    @PostMapping("/login/getadminloc")
    public ModelAndView getAdminloc(@RequestParam String location,@AuthenticationPrincipal OAuth2User principal){
        ModelAndView mv=new ModelAndView("permi");
        List<Request> pendingreqs=repo.findByLocationStatus(location,"Pending");
        Collections.sort(pendingreqs,new SortByTime());

        List<Request> approvedreqs=repo.findByLocationStatus(location,"Approved");
        Collections.sort(approvedreqs,new SortByTime());


        mv.addObject("res",pendingreqs);
        mv.addObject("res1",approvedreqs);
        String usermail=principal.getAttribute("email");
        mv.addObject("mailid",usermail);
        return mv;
    }

}
