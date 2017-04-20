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

	//���״̬���Ƴ���20��Ψһ
	@Column(length=20,unique=true)
	private String adstatusname;
	
	//���״̬����Ĺ�ϵ��һ�Զ�
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
