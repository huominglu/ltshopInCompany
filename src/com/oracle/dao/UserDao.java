package com.oracle.dao;

import com.oracle.model.User;
import com.oracle.util.PageModel;

public interface UserDao {

	void registerUser(User user);

	User checkRegister(String info);

	User loginUser(User user);

	void modifyUser(User user);

	PageModel getAllUser(String hql, int offset, int pagesize);

	User getUserById(int id);

	void deleteUser(User user);

}
