package com.softeem.ssm.controller;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Repairman;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.service.WorkshopService;
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
public class WorkshopController {
    @Autowired
    private WorkshopService workshopService;

    @RequestMapping("/workshopLimit")
    @ResponseBody
    public Map<String, Object> workshopLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<Workshop> workshopLimit = workshopService.getWorkshopLimit(pageNo, pageSize);

        int count = workshopService.getCount();
        System.out.println("输出的设备类型为" + workshopLimit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", workshopLimit);
        map.put("count", count);
        return map;
    }


    @RequestMapping("/addWorkshop")
    @ResponseBody
    public boolean addWorkshop(Workshop workshop) {
        return workshopService.addWorkshop(workshop);
    }

    @RequestMapping("/editWorkshop")
    public String editClassify(int id,Map<String,Object> map) {
        map.put("workshopItem",workshopService.getWorkshopById(id));
        System.out.println("要修改的workshop为："+workshopService.getWorkshopById(id));
        return "workshop-edit";
    }

    @RequestMapping("/updateWorkshop")
    @ResponseBody
    public boolean updateWorkshop(Workshop workshop) {
        System.out.println(workshop);
        boolean b = workshopService.updateWorkshop(workshop);
        System.out.println("工厂更新结果为：" + b);
        return b;
    }
    @RequestMapping("/deleteWorkshop")
    @ResponseBody
    public boolean deleteWorkshop(int id) {
        boolean b = workshopService.deleteWorkshop(id);
        System.out.println("工厂删除结果为："+b);
        return b;
    }
}
