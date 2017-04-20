package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.UserDao;
import com.oracle.model.User;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;
@Component(value="userDao")
public class UserDaoImpl extends PageSuport implements UserDao {
	//注册用户
	@Transactional(propagation=Propagation.REQUIRED)
	public void registerUser(User user) {
		getSession().save(user);
	}
	//检查用户是否存在------注册检查
	@Transactional(readOnly=true)
	public User checkRegister(String info) {
		User user = null;
		Query q = getSession().createQuery("from User where ? in(mobil,email,username)");
		q.setString(0, info);
		List<User> users = q.list();
		if(users.size()>0){
			user = users.get(0);
		}
		return user;
	}
	//用户登陆
	@Transactional(readOnly=true)
	public User loginUser(User user) {
		User reuser = null;
		Query q = getSession().createQuery("from User where username=? and password=?");
		q.setString(0, user.getUsername());
		q.setString(1, user.getPassword());
		List<User> users = q.list();
		if(users.size()>0){
			reuser = users.get(0);
		}
		return reuser;
	}
	//修改用户
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifyUser(User user) {
		getSession().update(user);
	}
	//获取所有用户---分页效果
	@Transactional(readOnly=true)
	public PageModel getAllUser(String hql, int offset, int pagesize) {
		return getRecordsByPage(hql, offset, pagesize);
	}
	//通过id获得用户信息
	@Transactional(readOnly=true)
	public User getUserById(int id) {
		return (User) getSession().get(User.class, id);
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteUser(User user) {
		getSession().delete(user);
	}

}
