package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Maintain;
import com.softeem.ssm.entity.MaintainExample;
import com.softeem.ssm.mapper.MaintainMapper;
import com.softeem.ssm.model.MaintainModel;
import com.softeem.ssm.service.MaintainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaintainServiceImpl implements MaintainService {
    @Autowired
    private MaintainMapper maintainMapper;

    @Override
    public List<MaintainModel> selectMaintainLimit(int index, int len) {
        MaintainExample maintainExample = new MaintainExample();
        maintainExample.setLimitIndex((index-1)*len);
        maintainExample.setLimitLen(len);
        return maintainMapper.selectMaintainModelByExample(maintainExample);
    }

    @Override
    public int getCount() {
        return (int) maintainMapper.countByExample(null);
    }

    @Override
    public List<Maintain> selectMaintainAll() {
        return maintainMapper.selectByExample(null);
    }

    @Override
    public List<MaintainModel> selectMaintainModelStatus(String status) {
        MaintainExample maintainExample = new MaintainExample();
        MaintainExample.Criteria criteria = maintainExample.createCriteria();
        criteria.andStatusEqualTo(status);
        return maintainMapper.selectMaintainModelByExample(maintainExample);
    }


    @Override
    public boolean insertMaintain(Maintain maintain) {
        return maintainMapper.insertSelective(maintain)>0;
    }

    @Override
    public MaintainModel selectModelByMId(int id) {
        return maintainMapper.selectMaintainModelByPrimaryKey(id);
    }

    @Override
    public boolean updateById(Maintain maintain) {
        return maintainMapper.updateByPrimaryKeySelective(maintain)>0;
    }

    @Override
    public Maintain selectById(int id) {
        return maintainMapper.selectByPrimaryKey(id);
    }
}
