package com.oracle.dao;

import java.util.List;

import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.util.PageModel;

public interface AdminDao {
	public int addAdmin(Admin admin);
	public int delAdmin(Admin admin);
	public int modifyAdmin(Admin admin);
	
	//��̨�û���½
	public Admin adminLogin(Admin admin);

	public PageModel getAdminsbyname(String hql, int offset, int pagesize);
	
	public PageModel getAllAdmins(String hql,int offset,int pagesize);

	public Admin chekAdminName(String name);
	/**
	 * @param admin
	 * @return
	 */
	public Admin getAdminById(Admin admin);
	/**
	 * @return
	 */
	public List<Role> getAllRoles();









	
}
