package com.softeem.ssm.controller;

import com.softeem.ssm.service.EquipmentService;
import com.softeem.ssm.service.MaintainService;
import com.softeem.ssm.service.RepairmanService;
import com.softeem.ssm.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/page")
public class PageController {
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private WorkshopService workshopService;
    @Autowired
    private RepairmanService repairmanService;
    @Autowired
    private MaintainService maintainService;

    @RequestMapping("/welcome")
    public String welcome(Map<String,Object> map) {
        map.put("equipmentCount",equipmentService.getCount());
        map.put("workshopCount",workshopService.getCount());
        map.put("repairmanCount",repairmanService.getCount());
        map.put("maintainCount",maintainService.selectMaintainModelStatus("维修中").size());
        return "welcome";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin-list";
    }

    @RequestMapping("/classify")
    public String classify() {
        return "classify-list";
    }

    @RequestMapping("/classifyAdd")
    public String classifyAdd() {
        return "classify-add";
    }

    @RequestMapping("/workshop")
    public String workshop() {
        return "workshop-list";
    }

    @RequestMapping("/workshopAdd")
    public String workshopAdd() {
        return "workshop-add";
    }

    @RequestMapping("/equipment")
    public String equipment() {
        return "equipment-list";
    }

    @RequestMapping("/fault")
    public String fault() {
        return "fault-list";
    }

    @RequestMapping("/repairman")
    public String repairman() {
        return "repairman-list";
    }
    @RequestMapping("/repairmanAdd")
    public String repairmanAdd() {
        return "repairman-add";
    }

    @RequestMapping("/maintain")
    public String maintain() {
        return "maintain-list";
    }
    @RequestMapping("/scrap")
    public String scrap() {
        return "scrap-list";
    }
}
