package com.test.common.quartz;

import com.test.service.AttendService;
import org.springframework.beans.factory.annotation.Autowired;

public class AttendCheck {
    @Autowired
    private AttendService attendService;
    public void check(){
        attendService.checkAttend();
    }
}
