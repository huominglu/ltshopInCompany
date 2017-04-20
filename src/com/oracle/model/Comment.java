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
	
	//评论的用户名称
	@Column(length=20,nullable=false)
	private String username;
	
	//评论标题  好中差评
	@Column(length=20)
	private String ctitle;
	//评论与商品的关系为多对一
	@ManyToOne()
	@JoinColumn(nullable=false,name="productid")
	private Product product;
	
	//评论内容
	@Column(length=200)
	private String content;
	
	//评论时间
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
