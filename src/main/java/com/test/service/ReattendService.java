package com.test.service;

import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryReattend;
import com.test.entity.Reattend;

import java.util.List;

public interface ReattendService {
    void addreattend(Reattend reattend);
    Reattend findbyattendid(Integer attendid);
    List<Reattend> findbyuserid(Integer userid);

    PageQueryBean reattendList(PageQueryReattend pageQueryReattend);

    Reattend findbyid(Integer id);

    void updatereattend(Reattend newReattend1);
}
