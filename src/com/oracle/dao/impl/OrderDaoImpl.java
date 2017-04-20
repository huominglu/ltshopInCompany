package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.OrderDao;
import com.oracle.model.Admin;
import com.oracle.model.Order;
import com.oracle.model.OrderItem;
import com.oracle.model.OrderStatus;
import com.oracle.model.Role;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;


@Component(value="orderDao")
public class OrderDaoImpl extends PageSuport implements OrderDao{

	@Transactional(readOnly=true)
	public PageModel getAllOrders(String hql, int offset, int pagesize) {
		return this.getRecordsByPage(hql, offset, pagesize);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int delOrder(Order order) {
		this.getSession().delete(order);
		return 1;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int modifyOrder(Order order) {
		this.getSession().update(order);
//		Query q = this.getSession().createQuery("update Order set orderStaus.id=2 where id=?");
//		q.setInteger(0, order.getId());
//		q.executeUpdate();
		return 1;
	}

	@Transactional(readOnly=true)
	public PageModel getOrderbyid(String hql, int offset, int pagesize) {
		return this.getRecordsByPage(hql, offset, pagesize);
	}

	@Transactional(readOnly=true)
	public Order getOrderById(Order order) {
		Order o = null;
		String hql = "from Order o where o.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, order.getId());
		List<Order> ors = q.list();
		if (ors.size() > 0) {
			o = ors.get(0);
		}
		return o;
	}

	@Transactional(readOnly=true)
	public List<OrderStatus> getAllOrderStatus(int id) {
		String hql = "from OrderStatus o where o.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<OrderStatus> status = q.list();
		return status;
	}

	@Transactional(readOnly=true)
	public OrderStatus getOrderStatusById(int i) {
		OrderStatus os = null;
		String hql = "from OrderStatus o where o.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, 2);
//		OrderStatus status = (OrderStatus) q.uniqueResult();
//		return status;
//	}
		List<OrderStatus> oss = q.list();
		if (oss.size() > 0) {
			os = oss.get(0);
		}
		return os;
	}

	@Transactional(readOnly=true)
	public OrderStatus getStatusById() {
		OrderStatus os = null;
		String hql = "from OrderStatus os where os.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, 1);
		List<OrderStatus> oss = q.list();
		if (oss.size() > 0) {
			os = oss.get(0);
		}
		return os;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public void addOrder(Order order) {
		this.getSession().save(order);
		List<OrderItem> ots = order.getOis();
		for (int i = 0; i < ots.size(); i++) {
			OrderItem ot = ots.get(i);
			ot.setOrder(order);
			
			this.getSession().save(ot);
		}
	}

	@Transactional(readOnly=true)
	public Order getOrderById(int id) {
		Order or = null;
		String hql = "from Order o where o.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<Order> ors = q.list();
		if (ors.size() > 0) {
			or = ors.get(0);
		}
		return or;
	}

	@Override
	public List<OrderItem> getOrderItemByOid(int startpage, int pagesizeno,
			int id) {
		String hql = "from OrderItem ot where ot.order.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		q.setFirstResult(startpage*pagesizeno);//0 ,1
		q.setMaxResults(pagesizeno);//5
		List<OrderItem> ots = q.list();
		return ots;
	}

	@Override
	public int getCount(int id) {
		String hql = "from OrderItem ot where ot.order.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<OrderItem> ots = q.list();
		int count = ots.size();
		return count;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int updateOrder(Order order) {
		Query q = this.getSession().createQuery("update Order set orderStaus.id=2 where id=?");
		q.setInteger(0, order.getId());
		q.executeUpdate();
		return 1;
	}

	
}
