package com.softeem.ssm.controller;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClassifyController {
    @Autowired
    private ClassifyService classifyService;

    @RequestMapping("/classifyLimit")
    @ResponseBody
    public Map<String, Object> classifyLimit(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNo = Integer.parseInt(page);
        // 得到每页显示的条数
        String pageSizes = request.getParameter("limit");
        int pageSize = Integer.parseInt(pageSizes);
        List<Classify> classifyLimit = classifyService.getClassifyLimit(pageNo, pageSize);
        int count = classifyService.getCount();
        System.out.println("输出的设备类型为" + classifyLimit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", classifyLimit);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/editClassify")
    public String editClassify(int id,Map<String,Object> map) {
        map.put("classifyItem",classifyService.getClassifyById(id));
        System.out.println("要修改的class为："+classifyService.getClassifyById(id));
        return "classify-edit";
    }
    @RequestMapping("/updateClassify")
    @ResponseBody
    public boolean updateClassify(Classify classify) {
        System.out.println(classify);
        boolean b = classifyService.updateClassify(classify);
        System.out.println("设备类型更新结果为：" + b);
        return b;
    }
    @RequestMapping("/addClassify")
    @ResponseBody
    public boolean addClassify(Classify classify) {
        return classifyService.addClassify(classify);
    }

}
