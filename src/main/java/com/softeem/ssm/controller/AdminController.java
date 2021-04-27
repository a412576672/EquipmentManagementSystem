package com.softeem.ssm.controller;

import com.softeem.ssm.entity.Admin;
import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.service.AdminService;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminLogin")
    public String login(String username, String password,HttpSession session){
        if (adminService.login(username,password,session)){
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }
        return "redirect:/index1.handler";
    }

    @RequestMapping("/index1")
    public String index1(){
        return "index";
    }

    @RequestMapping("/adminLimit")
    @ResponseBody
    public Map<String, Object> workshopLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<Admin> admins = adminService.selectAdminLimit(pageNo, pageSize);

        int count = adminService.getCount();
        System.out.println("输出的管理员为" + admins);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", admins);
        map.put("count", count);
        return map;
    }


    @RequestMapping("/addAdmin")
    public String addAdmin() {
        return "admin-add";
    }



    @RequestMapping("/insertAdmin")
    @ResponseBody
    public boolean insertAdmin(Admin admin) {
        boolean b = false;
        if (adminService.insertAdmin(admin)){
            b=true;
        }
        System.out.println("添加管理员结果为" + b);
        return b;
    }
    @RequestMapping("/deleteAdmin")
    @ResponseBody
    public boolean deleteAdmin(int id) {
        boolean b = false;
        if (adminService.deleteAdmin(id)){
            b=true;
        }
        System.out.println("删除管理员结果为" + b);
        return b;
    }
    @RequestMapping("/editAdmin")
    public String editAdmin(int id, Map<String, Object> map) {
        Admin admin = adminService.selectAdminById(id);
        map.put("adminItem", admin);
        System.out.println("要修改的admin为：" + admin);
        return "admin-edit";
    }

    @RequestMapping("/updateAdmin")
    @ResponseBody
    public boolean updateAdmin(Admin admin) {
        boolean b = false;
        if (adminService.updateAdmin(admin)){
            b=true;
        }
        System.out.println("更新管理员结果为" + b);
        return b;
    }
    @RequestMapping("/test")
    @ResponseBody
    public String gitAdd(){
        return "hello test world git";
    }
}
