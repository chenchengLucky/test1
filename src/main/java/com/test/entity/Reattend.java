package com.test.entity;

import java.util.Date;

public class Reattend {
    private Integer id;

    private Integer attendId;

    private String stringdate;

    private Date attendDate;

    private Integer reattendUserid;

    private String reattendChinesename;

    private String stringmorning;

    private String stringevening;

    private Date reattendMorning;

    private Date reattendEvening;

    private String reason;

    private String handler;

    private Byte status;

    public String getStringdate() {
        return stringdate;
    }

    public void setStringdate(String stringdate) {
        this.stringdate = stringdate;
    }

    public String getStringmorning() {
        return stringmorning;
    }

    public void setStringmorning(String stringmorning) {
        this.stringmorning = stringmorning;
    }

    public String getStringevening() {
        return stringevening;
    }

    public void setStringevening(String stringevening) {
        this.stringevening = stringevening;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAttendId() {
        return attendId;
    }

    public void setAttendId(Integer attendId) {
        this.attendId = attendId;
    }

    public Date getAttendDate() {
        return attendDate;
    }

    public void setAttendDate(Date attendDate) {
        this.attendDate = attendDate;
    }

    public Integer getReattendUserid() {
        return reattendUserid;
    }

    public void setReattendUserid(Integer reattendUserid) {
        this.reattendUserid = reattendUserid;
    }

    public String getReattendChinesename() {
        return reattendChinesename;
    }

    public void setReattendChinesename(String reattendChinesename) {
        this.reattendChinesename = reattendChinesename == null ? null : reattendChinesename.trim();
    }

    public Date getReattendMorning() {
        return reattendMorning;
    }

    public void setReattendMorning(Date reattendMorning) {
        this.reattendMorning = reattendMorning;
    }

    public Date getReattendEvening() {
        return reattendEvening;
    }

    public void setReattendEvening(Date reattendEvening) {
        this.reattendEvening = reattendEvening;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler == null ? null : handler.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}