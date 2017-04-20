package com.oracle.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="t_order")
@Entity
public class Order extends BaseEntity {
	//订单用户名称
	@Column(nullable=false,length=20)
	private String username;
	
	//订单用户真实姓名
	@Column(length=20,nullable=false)
	private String realname;
	
	//订单用户地址
	@Column(length=100,nullable=false)
	private String address;
	
	//订单用户邮编
	@Column(length=20,nullable=false)
	private String postcode;
	
	//订单用户移动电话
	@Column(length=20,nullable=false)
	private String mobil;
	
	//订单日期
	@Column(nullable=false)
	private Date orderdate;
	
	//订单和订单状态关系是多对一
	@ManyToOne
	@JoinColumn(name="orderstatusid",nullable=false)
	private OrderStatus orderStaus;
	
	//订单和订单详情的关系为一对多
	@OneToMany(mappedBy="order")
	private List<OrderItem> ois = new ArrayList<OrderItem>();

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getMobil() {
		return mobil;
	}

	public void setMobil(String mobil) {
		this.mobil = mobil;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public OrderStatus getOrderStaus() {
		return orderStaus;
	}

	public void setOrderStaus(OrderStatus orderStaus) {
		this.orderStaus = orderStaus;
	}

	public List<OrderItem> getOis() {
		return ois;
	}

	public void setOis(List<OrderItem> ois) {
		this.ois = ois;
	}

	
	
}

