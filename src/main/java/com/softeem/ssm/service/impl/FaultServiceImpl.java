package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.entity.FaultExample;
import com.softeem.ssm.mapper.FaultMapper;
import com.softeem.ssm.model.FaultModel;
import com.softeem.ssm.service.FaultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaultServiceImpl implements FaultService {
    @Autowired
    private FaultMapper faultMapper;

    @Override
    public List<FaultModel> getFaultAllLimit(int index, int len) {
        FaultExample faultExample = new FaultExample();
        faultExample.setLimitIndex((index-1)*len);
        faultExample.setLimitLen(len);
        List<FaultModel> faultModels = faultMapper.selectByFaultModelLimit(faultExample);

        return faultModels;
    }

    @Override
    public int getCount() {
        return (int) faultMapper.countByExample(null);
    }

    @Override
    public boolean insertFault(Fault fault) {
        return faultMapper.insertSelective(fault)>0;
    }

    @Override
    public FaultModel selectFaultModelById(int id) {
        return faultMapper.selectByFaultId(id);
    }

    @Override
    public List<FaultModel> getFaultAll() {
        return faultMapper.selectByFaultModelLimit(null);
    }

    @Override
    public boolean deleteFault(int id) {
        return faultMapper.deleteByPrimaryKey(id)>0;
    }
}
