package com.problemstatement.Team11.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

@Service
public class EmailSenderService {
    @Autowired
    private JavaMailSender mailSender;
    public void sendSimpleEmail(String toEmail,String body,String subject){
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try{
            MimeMessageHelper mimeMessageHelper=new MimeMessageHelper(mimeMessage,true);
            mimeMessageHelper.setFrom("ajavinash63@gmail.com");
            mimeMessageHelper.setTo(toEmail);
            mimeMessageHelper.setText(body,true);
            mimeMessageHelper.setSubject(subject);
            mailSender.send(mimeMessage);
        }catch (MessagingException e){
            System.out.println(e);
        }

        System.out.println("Mail sent....");
    }

//    public void sendEmailWithAttachment(String toEmail,String body,String subject,String attachment)throws MessagingException{
//        MimeMessage mimeMessage=new MimeMessage();
//        MimeMessageHelper mimeMessageHelper=new MimeMessageHelper(mimeMessage,true);
//        mimeMessageHelper.setFrom("ajavinash63@gmail.com");
//        mimeMessageHelper.setTo(toEmail);
//        mimeMessageHelper.setText(body);
//        mimeMessageHelper.setSubject(subject);
//
//        FileSystemResource fileSystem=new FileSystemResource(new File(attachment));
//        mimeMessageHelper.addAttachment(fileSystem.getFilename(),fileSystem);
//
//
//        mailSender.send(mimeMessage);
//        System.out.println("Mail sent....");
//    }

}
