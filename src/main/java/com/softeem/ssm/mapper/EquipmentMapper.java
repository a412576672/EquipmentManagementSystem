package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.EquipmentExample;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.EquipmentModel1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EquipmentMapper {
    long countByExample(EquipmentExample example);

    int deleteByExample(EquipmentExample example);

    int deleteByPrimaryKey(Integer eid);

    int insert(Equipment record);

    int insertSelective(Equipment record);

    List<Equipment> selectByExample(EquipmentExample example);

    Equipment selectByPrimaryKey(Integer eid);

    int updateByExampleSelective(@Param("record") Equipment record, @Param("example") EquipmentExample example);

    int updateByExample(@Param("record") Equipment record, @Param("example") EquipmentExample example);

    int updateByPrimaryKeySelective(Equipment record);

    int updateByPrimaryKey(Equipment record);

    List<EquipmentModel> selectEquipmentModelByIdLimit(EquipmentExample example);

    EquipmentModel1 selectByEid(int eid);
}