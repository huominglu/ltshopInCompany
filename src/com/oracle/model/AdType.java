package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="adtype")
public class AdType extends BaseEntity {
	
	//广告类型名称长度20，唯一
	@Column(unique=true,length=20)
	private String adtypename;
	
	//广告类型与广告的关系是一对多
	@OneToMany(mappedBy="adType")
	private List<Advert> ads = new ArrayList<Advert>();

	public String getAdtypename() {
		return adtypename;
	}

	public void setAdtypename(String adtypename) {
		this.adtypename = adtypename;
	}

	public List<Advert> getAds() {
		return ads;
	}

	public void setAds(List<Advert> ads) {
		this.ads = ads;
	}
	
	
}
