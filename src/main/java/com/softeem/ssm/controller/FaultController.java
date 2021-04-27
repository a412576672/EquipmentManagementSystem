package com.softeem.ssm.controller;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.FaultModel;
import com.softeem.ssm.service.EquipmentService;
import com.softeem.ssm.service.FaultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FaultController {
    @Autowired
    private FaultService faultService;
    @Autowired
    private EquipmentService equipmentService;

    @RequestMapping("/faultLimit")
    @ResponseBody
    public Map<String, Object> faultLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<FaultModel> faultAllLimit = faultService.getFaultAllLimit(pageNo, pageSize);

        int count = faultService.getCount();
        System.out.println("输出的故障台账为" + faultAllLimit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", faultAllLimit);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/GoAddFault")
    public String GoAddFault(Map<String, Object> map) {
        List<Equipment> equipments = equipmentService.selectEquipmentByState();
        map.put("equipments", equipments);
        return "fault-add";
    }

    //    insertFault
    @RequestMapping("/insertFault")
    @ResponseBody
    @Transactional
    public boolean insertFault(Fault fault) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = format.format(date);
        fault.setFaultTime(date1);
        System.err.println(fault);
        boolean b = faultService.insertFault(fault);
        if (b) {
            Equipment equipment = equipmentService.getEquipmentById(fault.getEid());
            equipment.setState("故障");
            boolean b1 = equipmentService.updateEquipment(equipment);
            System.out.println("修改设备状态结果为" + b1);
        }
        System.out.println("添加故障结果为" + b);
        return b;
    }

    //    lookFault
    @RequestMapping("/lookFault")
    public String lookFault(Map<String, Object> map,int id) {
        FaultModel faultModel = faultService.selectFaultModelById(id);
        map.put("faultModel", faultModel);
        System.out.println("要查看的故障信息为"+faultModel);
        return "fault-look";
    }
}
