package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="orderstatus")
@Entity
public class OrderStatus extends BaseEntity {

	//订单状态类型和订单的关系为一对多
	@OneToMany(mappedBy="orderStaus")
	private List<Order> ords = new ArrayList<Order>();
	
	//订单状态名称长度20，不能为空唯一
	@Column(length=20,nullable=false,unique=true)
	private String orderStatusName;

	public String getOrderStatusName() {
		return orderStatusName;
	}

	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}

	public List<Order> getOrds() {
		return ords;
	}

	public void setOrds(List<Order> ords) {
		this.ords = ords;
	}



	
	
}
