package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Repairman;
import com.softeem.ssm.entity.RepairmanExample;
import com.softeem.ssm.mapper.RepairmanMapper;
import com.softeem.ssm.service.RepairmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepairmanServiceImpl implements RepairmanService {
    @Autowired
    private RepairmanMapper repairmanMapper;

    @Override
    public List<Repairman> getRepairmanLimit(int index, int len) {
        RepairmanExample repairmanExample = new RepairmanExample();
        repairmanExample.setLimitIndex((index-1)*len);
        repairmanExample.setLimitLen(len);
        return repairmanMapper.selectByExample(repairmanExample);
    }

    @Override
    public int getCount() {
        return (int) repairmanMapper.countByExample(null);
    }

    @Override
    public boolean insertRepairman(Repairman repairman) {
        return repairmanMapper.insertSelective(repairman)>0;
    }

    @Override
    public Repairman selectRepairmanById(int id) {
        return repairmanMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateRepairman(Repairman repairman) {
        return repairmanMapper.updateByPrimaryKeySelective(repairman)>0;
    }

    @Override
    public boolean deleteRepairman(int rid) {
        try {
            repairmanMapper.deleteByPrimaryKey(rid);
            return true;
        }catch (Exception e){
         return false;
        }
    }

    @Override
    public List<Repairman> getRepairmanByStatus() {
        RepairmanExample repairmanExample = new RepairmanExample();
        RepairmanExample.Criteria criteria = repairmanExample.createCriteria();
        criteria.andStatusEqualTo("空闲");

        return repairmanMapper.selectByExample(repairmanExample);
    }
}
