package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Admin;
import com.softeem.ssm.entity.AdminExample;
import com.softeem.ssm.mapper.AdminMapper;
import com.softeem.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public boolean login(String username, String password, HttpSession session) {
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        Admin admin = null;
        if (adminMapper.selectByExample(adminExample) != null && adminMapper.selectByExample(adminExample).size() > 0) {
            admin = adminMapper.selectByExample(adminExample).get(0);

        }
        if (admin != null && admin.getPassword().equals(password)) {
            admin.setPassword(null);
            session.setAttribute("adminInfo",admin);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Admin> selectAdminLimit(int index, int len) {
        AdminExample adminExample = new AdminExample();
        adminExample.setLimitIndex((index-1)*len);
        adminExample.setLimitLen(len);
        return adminMapper.selectByExample(adminExample);
    }

    @Override
    public int getCount() {
        return (int) adminMapper.countByExample(null);
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        return adminMapper.updateByPrimaryKeySelective(admin)>0;
    }

    @Override
    public boolean deleteAdmin(int id) {
        return adminMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public boolean insertAdmin(Admin admin) {
        return adminMapper.insert(admin)>0;
    }

    @Override
    public Admin selectAdminById(int id) {
        return adminMapper.selectByPrimaryKey(id);
    }
}
