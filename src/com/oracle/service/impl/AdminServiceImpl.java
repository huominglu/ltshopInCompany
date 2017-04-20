package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.AdminDao;
import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.service.AdminService;
import com.oracle.util.PageModel;

@Component(value="adminService")
public class AdminServiceImpl implements AdminService {

	

	@Resource
	private AdminDao adminDao;


	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
//添加管理员
	@Override
	public int addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}
//删除管理员
	@Override
	public int delAdmin(Admin admin) {

		return adminDao.delAdmin(admin);
	}

	//用户登陆 by hml
	@Override
	public Admin adminLogin(Admin admin) {
		
		return adminDao.adminLogin(admin);
	}
//获得所有管理员信息
	@Override
	public PageModel getAllAdmins(String hql,int offset,int pagesize) {
		
		return adminDao.getAllAdmins(hql,offset,pagesize);
	}

//修改管理员信息
	@Override
	public int modifyAdmin(Admin admin) {
		return adminDao.modifyAdmin(admin);
	}


//根据姓名查找管理员
	@Override
	public PageModel getAdminsbyname(String hql,int offset,int pagesize) {
		return adminDao.getAdminsbyname(hql,offset,pagesize);
	}

//检测管理员名重复
	@Override
	public Admin checkAdminName(String name) {
		return adminDao.chekAdminName(name);
	}

	
	@Override
	public Admin getAdminById(Admin admin) {
		
		return adminDao.getAdminById(admin);
	}

	
	@Override
	public List<Role> getAllRoles() {
		
		return adminDao.getAllRoles();
	}



	
}
