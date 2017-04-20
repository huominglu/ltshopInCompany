package com.oracle.dao;

import java.util.List;

import com.oracle.model.Notice;
import com.oracle.util.PageModel;

public interface NoticeDao {

	void addNotice(Notice notice);

	PageModel getAllNotice(String hql, int offset, int pagesize);

	int delNotice(int id);

	int modifyNotice(Notice notice);

	List<Notice> getNewNotice();

}
