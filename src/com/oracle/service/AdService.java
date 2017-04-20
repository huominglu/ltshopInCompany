package com.oracle.service;

import java.util.List;

import com.oracle.model.Advert;
import com.oracle.model.Notice;
import com.oracle.util.PageModel;

public interface AdService {

	PageModel getAllAd(String hql, int offset, int pagesize);

	void adAdd(Advert advert);

	Advert getAdById(int id);

	void adModify(Advert advert);

	void deleteAd(Advert ad);

	List<Advert> getNewAd();

}
