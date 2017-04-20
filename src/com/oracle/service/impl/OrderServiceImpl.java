package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.AdminDao;
import com.oracle.dao.OrderDao;
import com.oracle.model.Order;
import com.oracle.model.OrderItem;
import com.oracle.model.OrderStatus;
import com.oracle.service.OrderService;
import com.oracle.util.PageModel;


@Component(value="orderService")
public class OrderServiceImpl implements OrderService{
	@Resource
	private OrderDao orderDao;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	

	@Override
	public PageModel getAllOrders(String hql, int offset, int pagesize) {
		return orderDao.getAllOrders(hql,offset,pagesize);
	}

	@Override
	public int delOrder(Order order) {
		return orderDao.delOrder(order);
	}

	@Override
	public int modifyOrder(Order order) {
		return orderDao.modifyOrder(order);
		
	}

	@Override
	public PageModel getOrderbyid(String hql, int offset, int pagesize) {
		return orderDao.getOrderbyid(hql,offset,pagesize);
	}

	@Override
	public Order getOrderById(Order order) {
		return orderDao.getOrderById(order);
	}

	@Override
	public List<OrderStatus> getAllOrderStatus(int id) {
		return orderDao.getAllOrderStatus(id);
	}

	@Override
	public OrderStatus getOrderStatusById(int i) {
		
		return orderDao.getOrderStatusById(i);
	}
	@Override
	public OrderStatus getStatusById() {
		return orderDao.getStatusById();
	}

	@Override
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	@Override
	public Order getOrderById(int id) {
		return orderDao.getOrderById(id);
	}

	@Override
	public List<OrderItem> getOrderItemByOid(int startpage, int pagesizeno,
			int id) {
		return orderDao.getOrderItemByOid(startpage,pagesizeno,id);
	}

	@Override
	public int getCount(int id) {
		return orderDao.getCount(id);
	}

	@Override
	public int updateOrder(Order order) {
		return orderDao.updateOrder(order);
		
	}

	

}
