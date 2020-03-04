package com.test.service;

import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryReattend;
import com.test.dao.ReattendMapper;
import com.test.entity.Reattend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reattendServiceimpl")
public class ReattendServiceimpl implements ReattendService {
    @Autowired
    private ReattendMapper reattendMapper;
    public void addreattend(Reattend reattend) {
        reattendMapper.insertSelective(reattend);
    }

    public Reattend findbyattendid(Integer attendid) {
        return reattendMapper.selectByAttendid(attendid);
    }

    public List<Reattend> findbyuserid(Integer userid) {
        return reattendMapper.selectByUserid(userid);
    }

    public PageQueryBean reattendList(PageQueryReattend pageQueryReattend) {
        PageQueryBean pageQueryBean=new PageQueryBean();
        int count=reattendMapper.reattendCount(pageQueryReattend);
        if (count>0){
            pageQueryBean.setTotalRows(count);
            pageQueryBean.setCurrentPage(pageQueryReattend.getCurrentPage());
            pageQueryBean.setPageSize(pageQueryReattend.getPageSize());
            List<Reattend> reattendList=reattendMapper.selectListByStatus(pageQueryReattend);
            pageQueryBean.setItems(reattendList);
        }
        return pageQueryBean;
    }

    public Reattend findbyid(Integer id) {
        return reattendMapper.selectByPrimaryKey(id);
    }

    public void updatereattend(Reattend newReattend1) {
        reattendMapper.updateByPrimaryKeySelective(newReattend1);
    }


}
