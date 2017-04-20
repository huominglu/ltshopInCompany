package com.oracle.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="orderitem")
@Entity
public class OrderItem extends BaseEntity {
	//��������Ͷ����Ĺ�ϵΪ���һ
	@ManyToOne
	@JoinColumn(name="orderid",nullable=false)
	private Order order;
	
	//��Ʒ���
	@Column(nullable=false)
	private Integer productid;
	
	//��Ʒ����
	@Column(length=20,nullable=false)
	private String productname;
	
	//��Ʒ�۸�
	@Column(nullable=false)
	private double price;
	
	//��Ʒ����
	@Column(nullable=false)
	private Integer productnum;
	
	//��Ʒ״̬(��û������)
	@Column(length=20,nullable=false)
	private String otStatus;

	public String getOtStatus() {
		return otStatus;
	}

	public void setOtStatus(String otStatus) {
		this.otStatus = otStatus;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getProductnum() {
		return productnum;
	}

	public void setProductnum(Integer productnum) {
		this.productnum = productnum;
	}
	
	
	
	
	
}
