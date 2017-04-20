package com.oracle.util;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



public class PageSuport{
	
	@Autowired
//	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;

	public Session getSession() {
		// 事务必须是开启的(Required)，否则获取不
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 根据HQL语句进行分页查询
	 * @param hql HQL语句
	 * @param offset 从第几条记录开始查
	 * @param pagesize 每页显示多少条记录
	 * @return PageModel
	 */

	@Transactional(readOnly=true)
	public PageModel getRecordsByPage(String hql,int offset, int pagesize) {//from User ,0,5
		//获取记录总数
		String countHql = "select count(*) "+hql;//select count(*) from User;//所有的记录数
		Query query = getSession().createQuery(countHql);
		int total = ((Long)query.uniqueResult()).intValue();
		//获取当前页的结果集合
		query = getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(pagesize);
		List datas = query.list();//拿到分页的数据
		//将结果记录总数和当前页的结果封装到PageModel--》pm
		PageModel pm = new PageModel();
		pm.setTotal(total);//将所有的记录数封装到PageMode--total
		pm.setDatas(datas);//将分页的数据封装到PageMode--list
		return pm;
	}
	
	/**
	 * 根据HQL语句进行分页查询
	 * @param hql HQL语句
	 * @param params HQL语句带的多个参数
	 * @param offset 从第几条记录开始查
	 * @param pagesize 每页显示多少条记录
	 * @return PageModel
	 * Object[] params ----Map<String,String> params
	 * 
	 */
	@Transactional(readOnly=true)
	public PageModel getRecordsByPage(String hql,Object[] params, int offset, int pagesize) {
		// from User u where u.username like ?    new Object[]{"%"+uname+"%"}  0, 5
		//获取记录总数和获取当前页的结果
		String countHql = "select count(*) "+hql;
		Query query = getSession().createQuery(countHql);
		if(params != null && params.length > 0){
			for(int i=0; i<params.length; i++){
				query.setParameter(i, params[i]);
			}
		}
		int total = ((Long)query.uniqueResult()).intValue();
		query = getSession().createQuery(hql);
		if(params != null && params.length > 0){
			for(int i=0; i<params.length; i++){
				query.setParameter(i, params[i]);
			}
		}
		query.setFirstResult(offset);
		query.setMaxResults(pagesize);
		List datas = query.list();
		PageModel pm = new PageModel();
		pm.setTotal(total);
		pm.setDatas(datas);
		return pm;
	}
}
