package com.oracle.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="advert")
@Entity
public class Advert extends BaseEntity {
	//广告与广告类型的关系是多对一
	@ManyToOne
	@JoinColumn(name="adtypeid",nullable=false)
	private AdType adType;
	
	//商品小类编号
	private Integer subtypeid;
	
	//商品编号
	private Integer productid;
	
	//商品描述(长度100)
	@Column(length=100)
	private String description;
	
	//广告开始时间
	@Column(nullable=false,length=30)
	private String begintime;
	
	//广告结束时间
	@Column(nullable=false,length=30)
	private String endtime;
	
	//广告图片
	@Column(nullable=false,length=50)
	private String picture;
	
	//广告与广告状态的关系是多对一
	@ManyToOne
	@JoinColumn(name="adstatusid",nullable=false)
	private AdStatus adStatus;

	public AdType getAdType() {
		return adType;
	}

	public void setAdType(AdType adType) {
		this.adType = adType;
	}

	public Integer getSubtypeid() {
		return subtypeid;
	}

	public void setSubtypeid(Integer subtypeid) {
		this.subtypeid = subtypeid;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public AdStatus getAdStatus() {
		return adStatus;
	}

	public void setAdStatus(AdStatus adStatus) {
		this.adStatus = adStatus;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	
}
