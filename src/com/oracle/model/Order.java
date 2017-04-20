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
	//�����û�����
	@Column(nullable=false,length=20)
	private String username;
	
	//�����û���ʵ����
	@Column(length=20,nullable=false)
	private String realname;
	
	//�����û���ַ
	@Column(length=100,nullable=false)
	private String address;
	
	//�����û��ʱ�
	@Column(length=20,nullable=false)
	private String postcode;
	
	//�����û��ƶ��绰
	@Column(length=20,nullable=false)
	private String mobil;
	
	//��������
	@Column(nullable=false)
	private Date orderdate;
	
	//�����Ͷ���״̬��ϵ�Ƕ��һ
	@ManyToOne
	@JoinColumn(name="orderstatusid",nullable=false)
	private OrderStatus orderStaus;
	
	//�����Ͷ�������Ĺ�ϵΪһ�Զ�
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

