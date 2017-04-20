package com.oracle.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.CommentDao;
import com.oracle.model.Comment;
import com.oracle.model.Notice;
import com.oracle.model.SubType;
@Component(value="commentDao")
public class CommentDaoImpl implements CommentDao {
	@Resource
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly=true)
	public List<Comment> getCommentByProductId(int startpage, int pagesizeno,
			int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("from Comment where product.id=?");
		q.setInteger(0, id);
		q.setFirstResult(startpage*pagesizeno);
		q.setMaxResults(pagesizeno);
		List<Comment> comments = q.list();
		return comments;
	}
	@Transactional(readOnly=true)
	public int getCount(int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("select count(*) from Comment where product.id=?");
		q.setInteger(0, id);
		int count = Integer.parseInt(q.uniqueResult().toString());
		return count;
	}
	@Transactional(readOnly=true)
	public List<Comment> getAllComment(int startpage, int pagesizeno) {
		Query q = sessionFactory.getCurrentSession().createQuery("from Comment");
		q.setFirstResult(startpage*pagesizeno);
		q.setMaxResults(pagesizeno);
		List<Comment> comments = q.list();
		return comments;
	}
	@Transactional(readOnly=true)
	public int getAllCount() {
		Query q = sessionFactory.getCurrentSession().createQuery("select count(*) from Comment ");
		int count = Integer.parseInt(q.uniqueResult().toString());
		return count;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void addComment(Comment comment) {
		sessionFactory.getCurrentSession().save(comment);
	}
	@Transactional(readOnly=true)
	public List<Comment> getCommentByProductId(int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("from Comment where product.id=?");
		q.setInteger(0, id);
		List<Comment> comments = q.list();
		return comments;
	}
	@Transactional(readOnly=true)
	public Comment getCommentById(int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("from Comment where id=?");
		q.setInteger(0, id);
		Comment ct = (Comment) q.uniqueResult();
		return ct;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteComment(Comment ct) {
		sessionFactory.getCurrentSession().delete(ct);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifyPStatus(int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("update OrderItem set otStatus= 'ÒÑÆÀÂÛ' where id = ?");
		q.setInteger(0,id);
		q.executeUpdate();
	}

	
	
}
