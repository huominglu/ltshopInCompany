package com.oracle.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.UserDao;
import com.oracle.model.User;
import com.oracle.service.UserService;
import com.oracle.util.PageModel;
@Component(value="userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void registerUser(User user) {
		userDao.registerUser(user);
		
	}

	@Override
	public User checkRegister(String info) {
		return userDao.checkRegister(info);
	}

	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	@Override
	public void modifyUser(User user) {
		userDao.modifyUser(user);
		
	}

	@Override
	public PageModel getAllUser(String hql, int offset, int pagesize) {
		return userDao.getAllUser(hql,offset,pagesize);
	}

	@Override
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Override
	public void deleteUser(User user) {
		userDao.deleteUser(user);
	}
}
