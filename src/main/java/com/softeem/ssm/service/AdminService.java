package com.softeem.ssm.service;

import com.softeem.ssm.entity.Admin;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AdminService {
    public boolean login(String username, String password, HttpSession session);

    List<Admin> selectAdminLimit(int index,int len);

    int getCount();

    boolean updateAdmin(Admin admin);

    boolean deleteAdmin(int id);

    boolean insertAdmin(Admin admin);

    Admin selectAdminById(int id);
}
