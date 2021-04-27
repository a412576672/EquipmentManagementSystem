package com.softeem.ssm.service;

import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.EquipmentModel1;

import java.util.List;

public interface EquipmentService {
    List<EquipmentModel> getEquipmentModelLimit(int index, int len);

    int getCount();

    Equipment getEquipmentById(int id);

    boolean updateEquipment(Equipment equipment);

    boolean insertEquipment(Equipment equipment);

    boolean deleteEquipment(int id);

    List<Equipment> selectEquipmentByState();

    List<Equipment> selectEquipmentByScrapState();

    EquipmentModel1 selectByEid(int id);
}
