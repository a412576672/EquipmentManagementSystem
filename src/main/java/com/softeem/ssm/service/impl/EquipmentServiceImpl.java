package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.EquipmentExample;
import com.softeem.ssm.mapper.EquipmentMapper;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.EquipmentModel1;
import com.softeem.ssm.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {
    @Autowired
    private EquipmentMapper equipmentMapper;
    @Override
    public List<EquipmentModel> getEquipmentModelLimit(int index, int len) {
        EquipmentExample equipmentExample = new EquipmentExample();
        equipmentExample.setLimitIndex((index-1)*len);
        equipmentExample.setLimitLen(len);
        return equipmentMapper.selectEquipmentModelByIdLimit(equipmentExample);
    }

    @Override
    public int getCount() {
        return (int) equipmentMapper.countByExample(null);
    }

    @Override
    public Equipment getEquipmentById(int id) {
        return equipmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateEquipment(Equipment equipment) {
        return equipmentMapper.updateByPrimaryKeySelective(equipment)>0;
    }

    @Override
    public boolean insertEquipment(Equipment equipment) {
        return equipmentMapper.insertSelective(equipment)>0;
    }

    @Override
    public boolean deleteEquipment(int id) {
        return equipmentMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public List<Equipment> selectEquipmentByState() {
        EquipmentExample equipmentExample = new EquipmentExample();
        EquipmentExample.Criteria criteria = equipmentExample.createCriteria();
        criteria.andStateEqualTo("正常");
        return equipmentMapper.selectByExample(equipmentExample);
    }

    @Override
    public List<Equipment> selectEquipmentByScrapState() {
        EquipmentExample equipmentExample = new EquipmentExample();
        EquipmentExample.Criteria criteria = equipmentExample.createCriteria();
        criteria.andStateEqualTo("正常");
        EquipmentExample.Criteria criteria1 = equipmentExample.createCriteria();
        criteria1.andStateEqualTo("故障");
        equipmentExample.or(criteria1);
        return equipmentMapper.selectByExample(equipmentExample);
    }

    @Override
    public EquipmentModel1 selectByEid(int id) {
        return equipmentMapper.selectByEid(id);
    }
}
