package com.softeem.ssm;

import com.softeem.ssm.service.EquipmentService;
import com.softeem.ssm.service.impl.EquipmentServiceImpl;
import org.aspectj.lang.annotation.Before;

public class Test {
    public static void main(String[] args) {
        EquipmentService equipmentService = new EquipmentServiceImpl();
        System.out.println(equipmentService.getEquipmentModelLimit(1, 5));
    }
}