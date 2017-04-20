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
	//��Ʒ����Ʒ����Ϊ���һ��ϵ
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="supertypeid")
	private SuperType superType;
	
	//��Ʒ����ƷС��Ϊ���һ��ϵ
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
	
	
	//��Ʒ���Ʋ���Ϊ�գ���Ψһ
	@Column(nullable=false,unique=true,length=30)
	private String productname;
	
	//��Ʒ���ܣ�����Ϊ100
	@Column(length=100)
	private String introduce;
	
	//��Ʒ�۸�
	@Column(nullable=false)
	private double price;
	//��Ʒ�ּ�
	@Column(nullable=false)
	private double nowprice;
	
	//��ƷͼƬ
	@Column(length=50,nullable=false)
	private String picture;
	
	//��Ʒ�ϼ�ʱ��
	@Column(nullable=false)
	private Date intime;
	
	//�Ƿ���Ʒ
	private Integer isnew;
	
	//�Ƿ��ؼ�
	private Integer issale;
	
	//�Ƿ�����
	private Integer ishost;
	
	//�Ƿ��ر��Ƽ�
	private Integer isspecial;
	
	//��Ʒ����
	private Integer productnum;
	
	//��Ʒ��Դ
	@Column(length=30)
	private String origin;
	
	//��Ʒ�����۵Ĺ�ϵΪһ�Զ�
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
