package com.oracle.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="product")
@Entity
public class Product extends BaseEntity{
	//商品与商品大类为多对一关系
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="supertypeid")
	private SuperType superType;
	
	//商品与商品小类为多对一关系
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="subtypeid")
	private SubType subType;
	
//	@ManyToMany
//	@JoinTable(
//			name="product_attr",
//			joinColumns=@JoinColumn(name="productid"),
//			inverseJoinColumns=@JoinColumn(name="attrid")
//			)
//	private List<Attr> attrs = new ArrayList<Attr>();
	
	
	//商品名称不能为空，且唯一
	@Column(nullable=false,unique=true,length=30)
	private String productname;
	
	//商品介绍，长度为100
	@Column(length=100)
	private String introduce;
	
	//商品价格
	@Column(nullable=false)
	private double price;
	//商品现价
	@Column(nullable=false)
	private double nowprice;
	
	//商品图片
	@Column(length=50,nullable=false)
	private String picture;
	
	//商品上架时间
	@Column(nullable=false)
	private Date intime;
	
	//是否新品
	private Integer isnew;
	
	//是否特价
	private Integer issale;
	
	//是否热销
	private Integer ishost;
	
	//是否特别推荐
	private Integer isspecial;
	
	//商品数量
	private Integer productnum;
	
	//商品来源
	@Column(length=30)
	private String origin;
	
	//商品与评论的关系为一对多
	@OneToMany(mappedBy="product")
	private List<Comment> coms = new ArrayList<Comment>();

	public SuperType getSuperType() {
		return superType;
	}

	public void setSuperType(SuperType superType) {
		this.superType = superType;
	}

	public SubType getSubType() {
		return subType;
	}

	public void setSubType(SubType subType) {
		this.subType = subType;
	}

	
//	public List<Attr> getAttrs() {
//		return attrs;
//	}
//
//	public void setAttrs(List<Attr> attrs) {
//		this.attrs = attrs;
//	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getNowprice() {
		return nowprice;
	}

	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public Integer getIsnew() {
		return isnew;
	}

	public void setIsnew(Integer isnew) {
		this.isnew = isnew;
	}

	public Integer getIssale() {
		return issale;
	}

	public void setIssale(Integer issale) {
		this.issale = issale;
	}

	public Integer getIshost() {
		return ishost;
	}

	public void setIshost(Integer ishost) {
		this.ishost = ishost;
	}

	public Integer getIsspecial() {
		return isspecial;
	}

	public void setIsspecial(Integer isspecial) {
		this.isspecial = isspecial;
	}

	public Integer getProductnum() {
		return productnum;
	}

	public void setProductnum(Integer productnum) {
		this.productnum = productnum;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public List<Comment> getComs() {
		return coms;
	}

	public void setComs(List<Comment> coms) {
		this.coms = coms;
	}
	
	
}
