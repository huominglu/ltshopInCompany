package com.oracle.service;

import com.oracle.model.User;
import com.oracle.util.PageModel;

public interface UserService {

	void registerUser(User user);

	User checkRegister(String info);

	User loginUser(User user);

	void modifyUser(User user);

	PageModel getAllUser(String hql, int offset, int pagesize);

	User getUserById(int id);

	void deleteUser(User user);

}
