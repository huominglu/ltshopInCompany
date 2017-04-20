package com.oracle.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Table(name="t_comment")
@Entity
public class Comment extends BaseEntity {
	
	//���۵��û�����
	@Column(length=20,nullable=false)
	private String username;
	
	//���۱���  ���в���
	@Column(length=20)
	private String ctitle;
	//��������Ʒ�Ĺ�ϵΪ���һ
	@ManyToOne()
	@JoinColumn(nullable=false,name="productid")
	private Product product;
	
	//��������
	@Column(length=200)
	private String content;
	
	//����ʱ��
	private Date cdate;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	
	
}
