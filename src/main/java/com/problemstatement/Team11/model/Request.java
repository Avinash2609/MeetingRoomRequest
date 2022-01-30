package com.problemstatement.Team11.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

@Entity
public class Request {
    @Id
    @GeneratedValue
    private int rid;

    private int empid;
    private String email;
    private String location;


    private int persons;
    private String fname;
    private String lname;
    private String contact;
    private int dd,mm,yy;
    private int stimehh,stimemm;
    private int etimehh,etimemm;


    private int cost;
    private Timestamp subtime;
    private String paymentstatus;
    private String status;
    private String allotment;
    private int room;

    private String purpose;
    private String food;


    public Request(){

    }

    @Override
    public String toString() {
        return "Request{" +
                "rid=" + rid +
                ", empid=" + empid +
                ", email='" + email + '\'' +
                ", location='" + location + '\'' +
                ", purpose='" + purpose + '\'' +
                ", persons=" + persons +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", contact='" + contact + '\'' +
                ", food='" + food + '\'' +
                ", dd=" + dd +
                ", mm=" + mm +
                ", yy=" + yy +
                ", stimehh=" + stimehh +
                ", stimemm=" + stimemm +
                ", etimehh=" + etimehh +
                ", etimemm=" + etimemm +
                ", cost=" + cost +
                ", subtime=" + subtime +
                ", paymentstatus='" + paymentstatus + '\'' +
                ", status='" + status + '\'' +
                ", allotment='" + allotment + '\'' +
                ", room=" + room +
                '}';
    }

    public Request(int rid, int empid, String email, String location, String purpose, int persons, String fname, String lname, String contact, String food, int dd, int mm, int yy, int stimehh, int stimemm, int etimehh, int etimemm, int cost, Timestamp subtime, String paymentstatus, String status, String allotment, int room) {
        this.rid = rid;
        this.empid = empid;
        this.email = email;
        this.location = location;
        this.purpose = purpose;
        this.persons = persons;
        this.fname = fname;
        this.lname = lname;
        this.contact = contact;
        this.food = food;
        this.dd = dd;
        this.mm = mm;
        this.yy = yy;
        this.stimehh = stimehh;
        this.stimemm = stimemm;
        this.etimehh = etimehh;
        this.etimemm = etimemm;
        this.cost = cost;
        this.subtime = subtime;
        this.paymentstatus = paymentstatus;
        this.status = status;
        this.allotment = allotment;
        this.room = room;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public int getPersons() {
        return persons;
    }

    public void setPersons(int persons) {
        this.persons = persons;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public int getDd() {
        return dd;
    }

    public void setDd(int dd) {
        this.dd = dd;
    }

    public int getMm() {
        return mm;
    }

    public void setMm(int mm) {
        this.mm = mm;
    }

    public int getYy() {
        return yy;
    }

    public void setYy(int yy) {
        this.yy = yy;
    }

    public int getStimehh() {
        return stimehh;
    }

    public void setStimehh(int stimehh) {
        this.stimehh = stimehh;
    }

    public int getStimemm() {
        return stimemm;
    }

    public void setStimemm(int stimemm) {
        this.stimemm = stimemm;
    }

    public int getEtimehh() {
        return etimehh;
    }

    public void setEtimehh(int etimehh) {
        this.etimehh = etimehh;
    }

    public int getEtimemm() {
        return etimemm;
    }

    public void setEtimemm(int etimemm) {
        this.etimemm = etimemm;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public Timestamp getSubtime() {
        return subtime;
    }

    public void setSubtime(Timestamp subtime) {
        this.subtime = subtime;
    }

    public String getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(String paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAllotment() {
        return allotment;
    }

    public void setAllotment(String allotment) {
        this.allotment = allotment;
    }



    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }
}
