package com.oracle.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.NoticeDao;
import com.oracle.model.Notice;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;
@Component(value="noticeDao")
public class NoticeDaoImpl extends PageSuport implements NoticeDao {
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void addNotice(Notice notice) {
		getSession().save(notice);
	}

	@Transactional(readOnly=true)
	public PageModel getAllNotice(String hql, int offset, int pagesize) {
		return getRecordsByPage(hql, offset, pagesize);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int delNotice(int id) {
		Query q = getSession().createQuery("delete from Notice where id = ?");
		q.setInteger(0, id);
		int count = q.executeUpdate();
		return count;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int modifyNotice(Notice notice) {
		Query q = getSession().createQuery("update Notice n set n.noticetitle=?,n.noticecontent=? where n.id=?");
		q.setString(0, notice.getNoticetitle());
		q.setString(1, notice.getNoticecontent());
		q.setInteger(2, notice.getId());
		int count = q.executeUpdate();
		return count;
	}

	@Transactional(readOnly=true)
	public List<Notice> getNewNotice() {
		Query q = getSession().createQuery("from Notice order by id desc");
		q.setMaxResults(6);
		List<Notice> notices = q.list();
		return notices;
	}
}
