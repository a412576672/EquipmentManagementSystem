package com.softeem.ssm.service;

import com.softeem.ssm.entity.Repairman;
import com.softeem.ssm.entity.Workshop;

import java.util.List;

public interface RepairmanService {
    List<Repairman> getRepairmanLimit(int index, int len);

    int getCount();

    boolean insertRepairman(Repairman repairman);

    Repairman selectRepairmanById(int id);

    boolean updateRepairman(Repairman repairman);

    boolean deleteRepairman(int rid);

    List<Repairman> getRepairmanByStatus();
}
