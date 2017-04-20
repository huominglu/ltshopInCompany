package com.oracle.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.AdminDao;
import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;

@Component(value="adminDao")
public class AdminDaoImpl extends PageSuport implements AdminDao {
	

	//添加管理员
	@Transactional(propagation=Propagation.REQUIRED)
	public int addAdmin(Admin admin) {
		int count = (Integer) this.getSession().save(admin);
		return count;
	}
	//删除管理员
	@Transactional(propagation=Propagation.REQUIRED)
	public int delAdmin(Admin admin) {
		this.getSession().delete(admin);
		return 1;
	}


	//后台用户登陆
	@Transactional(readOnly=true)
	public Admin adminLogin(Admin admin) {
		Admin reAdmin = null;
		Query q = this.getSession().createQuery("from Admin a where a.name=? and a.password=?");
		q.setString(0, admin.getName());
		q.setString(1, admin.getPassword());
		List<Admin> admins = q.list();
		if(admins.size()>0){
			reAdmin = admins.get(0);
		}
		return reAdmin;
	}
	//修改后台登录用户信息
	@Transactional(propagation=Propagation.REQUIRED)
	public int modifyAdmin(Admin admin) {
		this.getSession().update(admin);
		return 1;
	}

	@Transactional(readOnly=true)
	public PageModel getAllAdmins(String hql,int offset,int pagesize) {
		return this.getRecordsByPage(hql, offset, pagesize);
	}
	
	@Override
	public PageModel getAdminsbyname(String hql,int offset,int pagesize) {
		return this.getRecordsByPage(hql, offset, pagesize);
	}
	//检测管理员重名
	@Transactional(readOnly=true)
	public Admin chekAdminName(String name) {
		Admin a = null;
		Query q = this.getSession().createQuery("from Admin a where a.name = ?");
		q.setString(0, name);
		List<Admin> as = q.list();
		if(as.size()>0){
			a = as.get(0);
		}
		return a;
	}
	
	@Transactional(readOnly=true)
	public Admin getAdminById(Admin admin) {
		Admin ad = null;
		String hql = "from Admin a where a.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, admin.getId());
		List<Admin> ads = q.list();
		if (ads.size() > 0) {
			ad = ads.get(0);
		}
		return ad;
	}
	@Transactional(readOnly=true)
	public List<Role> getAllRoles() {
		String hql = "from Role";
		List<Role> roles = this.getSession().createQuery(hql).list();
		return roles;
	}
//	//注册密码规范
//	@Override
//	public String checkAdminPassword(String password) {
//		if(password.length()>=8){
//			String[] array = password.split(null);
//			for (int i=0;i<array.length;i++){
//				if(array[i] equals("a"||"b"||"c"||"d"||"e"||"f"||"g"||"h"||"i"||"j"||"k")){
//					return "ture";
//				}
//		}
//		}
//		return null;
//	}







}
