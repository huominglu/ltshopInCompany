package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.CommentDao;
import com.oracle.model.Comment;
import com.oracle.model.SubType;
import com.oracle.service.CommentService;
@Component(value="commentService")
public class CommentServiceImpl implements CommentService {
	@Resource
	private CommentDao commentDao;

	@Override
	public List<Comment> getCommentByProductId(int startpage, int pagesizeno,
			int id) {
		return commentDao.getCommentByProductId(startpage, pagesizeno,id);
	}

	@Override
	public int getCount(int id) {
		return commentDao.getCount(id);
	}

	@Override
	public List<Comment> getAllComment(int startpage, int pagesizeno) {
		return commentDao.getAllComment(startpage, pagesizeno);
	}

	@Override
	public int getAllCount() {
		return commentDao.getAllCount();
	}

	@Override
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}

	@Override
	public List<Comment> getCommentByProductId(int id) {
		return commentDao.getCommentByProductId(id);
	}

	@Override
	public Comment getCommentById(int id) {
		return commentDao.getCommentById(id);
	}

	@Override
	public void deleteComment(Comment ct) {
		commentDao.deleteComment(ct);
	}

	@Override
	public void modifyPStatus(int id) {
		commentDao.modifyPStatus(id);
	}
}
