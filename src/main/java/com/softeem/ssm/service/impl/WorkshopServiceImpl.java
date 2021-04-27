package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.entity.WorkshopExample;
import com.softeem.ssm.mapper.WorkshopMapper;
import com.softeem.ssm.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WorkshopServiceImpl implements WorkshopService {
    @Autowired
    private WorkshopMapper workshopMapper;
    @Override
    public List<Workshop> getWorkshopLimit(int index, int len) {
        WorkshopExample workshopExample = new WorkshopExample();
        workshopExample.setLimitIndex((index-1)*len);
        workshopExample.setLimitLen(len);
        return workshopMapper.selectByExample(workshopExample);
    }

    @Override
    public List<Workshop> getWorkshopAll() {
        return workshopMapper.selectByExample(null);
    }

    @Override
    public int getCount() {
        return (int) workshopMapper.countByExample(null);
    }

    @Override
    public boolean addWorkshop(Workshop workshop) {
        return workshopMapper.insertSelective(workshop)>0;
    }

    @Override
    public Workshop getWorkshopById(int id) {
        return workshopMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateWorkshop(Workshop workshop) {
        return workshopMapper.updateByPrimaryKeySelective(workshop)>0;
    }

    @Override
    public boolean deleteWorkshop(int id) {
        return workshopMapper.deleteByPrimaryKey(id)>0;
    }
}
