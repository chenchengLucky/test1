package com.test.entity;

import java.util.Date;

public class Attend {
    private Integer id;

    private Integer userid;

    private Date attendDate;

    private Byte attendWeek;

    private Date attendMorming;

    private Date attendEvening;

    private Integer absence;

    private Byte attendStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getAttendDate() {
        return attendDate;
    }

    public void setAttendDate(Date attendDate) {
        this.attendDate = attendDate;
    }

    public Byte getAttendWeek() {
        return attendWeek;
    }

    public void setAttendWeek(Byte attendWeek) {
        this.attendWeek = attendWeek;
    }

    public Date getAttendMorming() {
        return attendMorming;
    }

    public void setAttendMorming(Date attendMorming) {
        this.attendMorming = attendMorming;
    }

    public Date getAttendEvening() {
        return attendEvening;
    }

    public void setAttendEvening(Date attendEvening) {
        this.attendEvening = attendEvening;
    }

    public Integer getAbsence() {
        return absence;
    }

    public void setAbsence(Integer absence) {
        this.absence = absence;
    }

    public Byte getAttendStatus() {
        return attendStatus;
    }

    public void setAttendStatus(Byte attendStatus) {
        this.attendStatus = attendStatus;
    }
}