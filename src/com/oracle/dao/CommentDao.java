package com.oracle.dao;

import java.util.List;

import com.oracle.model.Comment;
import com.oracle.model.SubType;

public interface CommentDao {

	List<Comment> getCommentByProductId(int startpage, int pagesizeno, int id);

	int getCount(int id);

	List<Comment> getAllComment(int startpage, int pagesizeno);

	int getAllCount();

	void addComment(Comment comment);

	List<Comment> getCommentByProductId(int id);

	Comment getCommentById(int id);

	void deleteComment(Comment ct);

	void modifyPStatus(int id);

}
