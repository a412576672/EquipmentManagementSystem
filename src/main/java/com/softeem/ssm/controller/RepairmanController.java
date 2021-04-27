package com.softeem.ssm.controller;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Repairman;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.service.RepairmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RepairmanController {
    @Autowired
    RepairmanService repairmanService;

    @RequestMapping("/repairmanLimit")
    @ResponseBody
    public Map<String, Object> repairmanLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<Repairman> repairmanLimit = repairmanService.getRepairmanLimit(pageNo, pageSize);

        int count = repairmanService.getCount();
        System.out.println("输出的维修人员为" + repairmanLimit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", repairmanLimit);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/insertRepairman")
    @ResponseBody
    public boolean insertRepairman(Repairman Repairman) {

        boolean b = false;
        b = repairmanService.insertRepairman(Repairman);
        System.out.println("添加员工结果为" + b);
        return b;
    }

    @RequestMapping("/editRepairman")
    public String editRepairman(int id, Map<String, Object> map) {
        Repairman repairman = repairmanService.selectRepairmanById(id);
        map.put("repairman",repairman);
        return "repairman-edit";
    }
    @RequestMapping("/updateRepairman")
    @ResponseBody
    public boolean updateRepairman(Repairman repairman) {
        System.out.println(repairman);
        boolean b = repairmanService.updateRepairman(repairman);
        System.out.println("员工更新结果为：" + b);
        return b;
    }

//    deleteRepairman
    @RequestMapping("/deleteRepairman")
    @ResponseBody
    public boolean deleteEquipment(int id) {
        boolean b = repairmanService.deleteRepairman(id);
        System.out.println("删除员工结果为" + b);
        return b;
    }
}
