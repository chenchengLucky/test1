package com.test.service;

import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryCondition;
import com.test.entity.Attend;

public interface AttendService {
    void attendrRcord(Attend attend);

    PageQueryBean attendList(PageQueryCondition condition);

    void checkAttend();
}
