package com.softeem.ssm.controller;

import com.softeem.ssm.entity.*;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.FaultModel;
import com.softeem.ssm.model.MaintainModel;
import com.softeem.ssm.service.EquipmentService;
import com.softeem.ssm.service.FaultService;
import com.softeem.ssm.service.MaintainService;
import com.softeem.ssm.service.RepairmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MaintainController {
    @Autowired
    private MaintainService maintainService;
    @Autowired
    private FaultService faultService;
    @Autowired
    private RepairmanService repairmanService;
    @Autowired
    private EquipmentService equipmentService;
    @RequestMapping("/maintainLimit")
    @ResponseBody
    public Map<String, Object> maintainLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<MaintainModel> maintainModels = maintainService.selectMaintainLimit(pageNo, pageSize);
        int count = maintainService.getCount();
        System.out.println("输出的维修记录为" + maintainModels);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", maintainModels);
        map.put("count", count);
        return map;
    }

    //得到可维修的故障订单和员工
    @RequestMapping("/addMaintain")
    public String addMaintain(Map<String, Object> map) {
        List<FaultModel> faultAll = faultService.getFaultAll();
        List<Maintain> maintains = maintainService.selectMaintainAll();
        List<Repairman> repairmanList = repairmanService.getRepairmanByStatus();
        List<FaultModel> faults = new ArrayList<>();

        if (maintains.size()>0 && maintains!=null){
            for (FaultModel faultModel : faultAll) {
                boolean isMain = false;
                for (Maintain maintain : maintains) {
                    if (faultModel.getFid()==maintain.getFid()){
                        isMain=true;
                    }
                }
                if (!isMain){
                    faults.add(faultModel);
                }
            }
        }else {
            faults.addAll(faultAll);
        }
        if (repairmanList==null || repairmanList.size()==0) {
            map.put("repairmanNull", true);
            return "maintain-add";
        }
        if (faults==null || faults.size()==0) {
            map.put("faultsNull", true);
            return "maintain-add";
        }
        System.out.println("输出前结果为"+faultAll);
        System.out.println("输出维修单为"+maintains);
        System.out.println("输出结果为"+faults);
        System.out.println("输出员工结果为"+repairmanList);
        map.put("faults", faults);
        map.put("repairmanList", repairmanList);
        return "maintain-add";
    }


    @RequestMapping("/insertMaintain")
    @ResponseBody
    @Transactional
    public boolean insertMaintain(Maintain maintain) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = format.format(date);
        maintain.setStime(date1);
        maintain.setStatus("维修中");
        System.err.println(maintain);
        boolean b = false;
        if (maintainService.insertMaintain(maintain)) {
            b=true;
            Repairman repairman = repairmanService.selectRepairmanById(maintain.getRid());
            repairman.setStatus("工作");
            repairmanService.updateRepairman(repairman);
        }
        System.out.println("派修结果为" + b);
        return b;
    }

    //设置维修完成
    @RequestMapping("/updateMaintain")
    @ResponseBody
    @Transactional
    public boolean updateMaintain(int id) {
        MaintainModel maintainModel = maintainService.selectModelByMId(id);
//        维修订单
        Maintain maintain1 = maintainModel.getFaultModel().getMaintain();
//        设备
        Equipment equipment = maintainModel.getFaultModel().getEquipment();
//        维修人
        Repairman repairman = maintainModel.getRepairman();
        maintain1.setStatus("维修完成");
        System.out.println("修改的维修订单为"+maintain1);
        if (maintainService.updateById(maintain1)) {
            System.out.println("维修订单更新结果为：true");

            equipment.setState("正常");
            equipmentService.updateEquipment(equipment);
            System.out.println("修改的设备为"+equipment);

            repairman.setStatus("空闲");
            repairmanService.updateRepairman(repairman);
            System.out.println("修改的员工为"+repairman);
            return true;
        }

        return false;
    }
}
