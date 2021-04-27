package com.softeem.ssm.controller;

import com.mysql.fabric.xmlrpc.base.Data;
import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.LayuiFileUploadResult;
import com.softeem.ssm.service.ClassifyService;
import com.softeem.ssm.service.EquipmentService;
import com.softeem.ssm.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class EquipmentController {
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private WorkshopService workshopService;

    @RequestMapping("/EquipmentLimit")
    @ResponseBody
    public Map<String, Object> EquipmentLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<EquipmentModel> equipmentModelLimit = equipmentService.getEquipmentModelLimit(pageNo, pageSize);

        int count = equipmentService.getCount();
        System.out.println("输出的设备台账为" + equipmentModelLimit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", equipmentModelLimit);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/editEquipment")
    public String editEquipment(int id, Map<String, Object> map) {
        Equipment equipment = equipmentService.getEquipmentById(id);
        map.put("equipmentItem", equipment);
        List<Classify> classifyAll = classifyService.getClassifyAll();
        List<Workshop> workshopAll = workshopService.getWorkshopAll();
        map.put("classifys", classifyAll);
        map.put("workshops", workshopAll);
        System.out.println("要修改的equipmentItemp为：" + equipmentService.getEquipmentById(id));
        return "equipment-edit";
    }

    @RequestMapping("/updateEquipment")
    @ResponseBody
    public boolean updateEquipment(Equipment equipment) {
        System.out.println(equipment);
        boolean b = equipmentService.updateEquipment(equipment);
        System.out.println("设备更新结果为：" + b);
        return b;
    }

    @RequestMapping("/addEquipment")
    public String addEquipment(Map<String, Object> map) {
        List<Classify> classifyAll = classifyService.getClassifyAll();
        List<Workshop> workshopAll = workshopService.getWorkshopAll();
        map.put("classifys", classifyAll);
        map.put("workshops", workshopAll);
        return "equipment-add";
    }

    @RequestMapping("/insertEquipment")
    @ResponseBody
    public boolean insertEquipment(Equipment equipment) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = format.format(date);
        equipment.setAddTime(date1);
        System.err.println(equipment);
        boolean b = false;
        if (!equipment.getPath().equals("") && equipment.getPath()!=null){
            b=equipmentService.insertEquipment(equipment);
        }
        System.out.println("添加设备结果为" + b);
        return b;
    }

    //    deleteEquipment
    @RequestMapping("/deleteEquipment")
    @ResponseBody
    public boolean deleteEquipment(int id) {
        boolean b = equipmentService.deleteEquipment(id);
        System.out.println("删除设备结果为" + b);
        return b;
    }

    //上传图片
    @RequestMapping("/uploadImg")
    @ResponseBody
    protected LayuiFileUploadResult uploadImg(@RequestParam("file") MultipartFile file) {
        LayuiFileUploadResult result = new LayuiFileUploadResult();
        try {
            if (file != null) {
                //获取文件名
                String fileName = file.getOriginalFilename();
                //截取扩展名
                String extName = fileName.substring(fileName.lastIndexOf("."));
                List list = new ArrayList();
                list.add(".jpg");
                list.add(".png");
                list.add(".jpeg");
                list.add(".gif");
                if (list.contains(extName.toLowerCase())) {

                    //01获取服务器项目部署的路径，并在根目录下创建 myphoto 目录
                    //String realPath = session.getServletContext().getRealPath("myphoto");
                    //02也可以直接定义文件路径
                    String realPath = "D:\\img1";
                    String photoFileName = new Date().getTime() + extName;
                    String descPath = realPath + "\\" + photoFileName;
                    System.err.println(descPath);
                    file.transferTo(new File(realPath, photoFileName));
                    result.setCode(0);
                    result.setMsg("");
                    Map<String, Object> data = new HashMap<>();
                    data.put("uploadFileName", photoFileName);
                    System.out.println(data);
                    result.setData(data);
                    return result;//成功
                } else {
                    return result;
                }
            }
            else {
                return null;//上传文件为空
            }
        } catch (Exception e) {
            e.printStackTrace();
            return result;//上传异常
        }
    }
}
