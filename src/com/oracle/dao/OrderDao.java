package com.oracle.dao;

import java.util.List;

import com.oracle.model.Order;
import com.oracle.model.OrderItem;
import com.oracle.model.OrderStatus;
import com.oracle.util.PageModel;


public interface OrderDao {

	PageModel getAllOrders(String hql, int offset, int pagesize);

	int delOrder(Order order);

	int modifyOrder(Order order);

	PageModel getOrderbyid(String hql, int offset, int pagesize);

	Order getOrderById(Order order);

//	List<OrderStatus> getAllOrderStatus();

	List<OrderStatus> getAllOrderStatus(int id);

	OrderStatus getOrderStatusById(int i);

	OrderStatus getStatusById();

	void addOrder(Order order);

	Order getOrderById(int id);

	List<OrderItem> getOrderItemByOid(int startpage, int pagesizeno, int id);

	int getCount(int id);

	int updateOrder(Order order);
}
