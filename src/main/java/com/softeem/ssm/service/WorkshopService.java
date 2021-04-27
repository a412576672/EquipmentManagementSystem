package com.softeem.ssm.service;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Workshop;

import java.util.List;

public interface WorkshopService {
    List<Workshop> getWorkshopLimit(int index, int len);

    List<Workshop> getWorkshopAll();

    int getCount();

    boolean addWorkshop(Workshop workshop);

    Workshop getWorkshopById(int id);

    boolean updateWorkshop(Workshop workshop);

    boolean deleteWorkshop(int id);
}
