package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="adstatus")
public class AdStatus extends BaseEntity {

	//广告状态名称长度20，唯一
	@Column(length=20,unique=true)
	private String adstatusname;
	
	//广告状态与广告的关系是一对多
	@OneToMany(mappedBy="adStatus")
	private List<Advert> ads = new ArrayList<Advert>();
	
	public String getAdstatusname() {
		return adstatusname;
	}
	
	

	public List<Advert> getAds() {
		return ads;
	}



	public void setAds(List<Advert> ads) {
		this.ads = ads;
	}



	public void setAdstatusname(String adstatusname) {
		this.adstatusname = adstatusname;
	}
	
	
	
}
