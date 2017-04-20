package com.oracle.service;

import java.util.List;

import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.util.PageModel;

public interface AdminService {
	//后台用户登陆 by 霍明路
	Admin adminLogin(Admin admin);
		//设计业务 添加后台用户
		public int addAdmin(Admin admin);
		int delAdmin(Admin admin);
		int modifyAdmin(Admin admin);
		


		PageModel getAllAdmins(String hql, int offset, int pagesize);
		PageModel getAdminsbyname(String hql, int offset, int pagesize);

		
		Admin checkAdminName(String name);
//		String checkAdminPassword(String password);
		/**
		 * 根据管理员id获取管理员对象
		 * @param admin
		 * @return
		 */
		Admin getAdminById(Admin admin);
		
		List<Role> getAllRoles();






}
