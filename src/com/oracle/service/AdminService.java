package com.oracle.service;

import java.util.List;

import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.util.PageModel;

public interface AdminService {
	//��̨�û���½ by ����·
	Admin adminLogin(Admin admin);
		//���ҵ�� ��Ӻ�̨�û�
		public int addAdmin(Admin admin);
		int delAdmin(Admin admin);
		int modifyAdmin(Admin admin);
		


		PageModel getAllAdmins(String hql, int offset, int pagesize);
		PageModel getAdminsbyname(String hql, int offset, int pagesize);

		
		Admin checkAdminName(String name);
//		String checkAdminPassword(String password);
		/**
		 * ���ݹ���Աid��ȡ����Ա����
		 * @param admin
		 * @return
		 */
		Admin getAdminById(Admin admin);
		
		List<Role> getAllRoles();






}
