package com.softeem.ssm.controller;

import com.softeem.ssm.entity.*;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.EquipmentModel1;
import com.softeem.ssm.model.MaintainModel;
import com.softeem.ssm.model.ScrapModel;
import com.softeem.ssm.service.*;
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
public class ScrapController {
    @Autowired
    private ScrapService scrapService;
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private MaintainService maintainService;
    @Autowired
    private RepairmanService repairmanService;
    @Autowired
    private FaultService faultService;

    @RequestMapping("/scrapLimit")
    @ResponseBody
    public Map<String, Object> scrapLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<ScrapModel> scrapModels = scrapService.selectScrapModelLimit(pageNo, pageSize);
        int count = scrapService.getCount();
        System.out.println("输出的报废设备台账为" + scrapModels);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", scrapModels);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/GoAddScrap")
    public String GoAddScrap(Map<String, Object> map) {
        List<Equipment> equipments = equipmentService.selectEquipmentByScrapState();
        map.put("equipments", equipments);
        return "scrap-add";
    }
    @RequestMapping("/insertScrap")
    @ResponseBody
    @Transactional
    public boolean insertScrap(Scrap scrap) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = format.format(date);
        scrap.setStime(date1);
        System.err.println(scrap);
        if (scrapService.insertScrap(scrap)) {
            //找到报废的设备
            Equipment equipment = equipmentService.getEquipmentById(scrap.getEid());
            equipment.setState("报废");
            boolean b1 = equipmentService.updateEquipment(equipment);
            System.out.println("修改设备状态结果为" + b1);
            //找到维修中的所有维修记录
            List<MaintainModel> maintainModels = maintainService.selectMaintainModelStatus("维修中");
            EquipmentModel1 equipmentModel1 = equipmentService.selectByEid(equipment.getEid());
            if (maintainModels.size()>0){
                for (MaintainModel maintainModel : maintainModels) {
                    //找到所有正在维修中的设备
                    Equipment equipment1 = maintainModel.getFaultModel().getEquipment();
                    System.out.println("第一个"+equipment1);
                    System.out.println("第二个"+equipment);
                    if (equipment.getEid()==equipment1.getEid() || maintainModel.getFaultModel().getEid()==equipment.getEid()){
                        Repairman repairman = maintainModel.getRepairman();
                        repairman.setStatus("空闲");
                        repairmanService.updateRepairman(repairman);
                        faultService.deleteFault(maintainModel.getFaultModel().getFid());
                    }
                }
                return true;
            }else {
                List<Fault> faults = equipmentModel1.getFaults();
                System.out.println("要删除的故障记录为"+faults);
                if (faults.size()>0){
                    for (Fault fault : faults) {
                        faultService.deleteFault(fault.getFid());
                    }
                    return true;
                }
            }
        }
        return false;
    }
}
