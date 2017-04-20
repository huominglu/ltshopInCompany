package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.NoticeDao;
import com.oracle.model.Notice;
import com.oracle.service.NoticeService;
import com.oracle.util.PageModel;
@Component(value="noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource
	private NoticeDao noticeDao;

	public NoticeDao getNoticeDao() {
		return noticeDao;
	}

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public void addNotice(Notice notice) {
		noticeDao.addNotice(notice);
	}

	@Override
	public PageModel getAllNotice(String hql, int offset, int pagesize) {
		return noticeDao.getAllNotice(hql, offset, pagesize);
	}

	@Override
	public int delNotice(int id) {
		return noticeDao.delNotice(id);
	}

	@Override
	public int modifyNotice(Notice notice) {
		return noticeDao.modifyNotice(notice);
	}

	@Override
	public List<Notice> getNewNotice() {
		return noticeDao.getNewNotice();
	}
}
