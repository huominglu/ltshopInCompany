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
	//ע���û�
	@Transactional(propagation=Propagation.REQUIRED)
	public void registerUser(User user) {
		getSession().save(user);
	}
	//����û��Ƿ����------ע����
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
	//�û���½
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
	//�޸��û�
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifyUser(User user) {
		getSession().update(user);
	}
	//��ȡ�����û�---��ҳЧ��
	@Transactional(readOnly=true)
	public PageModel getAllUser(String hql, int offset, int pagesize) {
		return getRecordsByPage(hql, offset, pagesize);
	}
	//ͨ��id����û���Ϣ
	@Transactional(readOnly=true)
	public User getUserById(int id) {
		return (User) getSession().get(User.class, id);
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteUser(User user) {
		getSession().delete(user);
	}

}
