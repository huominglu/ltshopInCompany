package com.oracle.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.dao.ProductDao;
import com.oracle.model.Comment;
import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.service.CommentService;
@ParentPackage("json-default")
@Controller
public class CommentAction extends ActionSupport implements RequestAware{
	private Map<String, Object> request;
	private Comment comment;
	private String result;
	private int id;
	//��ǰҳ��
	private String currentpageno;
	//ÿҳ��ʾ��¼��
	private String pagesize;
	private String level;
	@Resource
	private CommentService commentService;
	@Resource
	private ProductDao productDao;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getCurrentpageno() {
		return currentpageno;
	}
	public void setCurrentpageno(String currentpageno) {
		this.currentpageno = currentpageno;
	}
	public String getPagesize() {
		return pagesize;
	}
	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	//��ȡ�����б�
	@Action(value="commentList",results={@Result(name="success",location="comment/comment_list.jsp")})
	public String commentList(){
		if(this.currentpageno == null){
			currentpageno = "0";
		}
		if(this.pagesize == null){
			pagesize ="5";
		}
		int startpage = 0;// ��ʼҳ
		int totalpage = 0;// ��ҳ��
		int pagesizeno = 5;// ÿҳ��ʾ����
		int totalnum = 0;// �ܼ�¼��
//		/* ��ʼ������ */
		if (currentpageno != null) {
			startpage = Integer.parseInt(currentpageno);
		}
		if (pagesize != null) {
			pagesizeno = Integer.parseInt(pagesize);
		}
		List<Comment> comments = null;
		if(this.comment == null){
			comments = commentService.getAllComment(startpage,pagesizeno);
			totalnum = commentService.getAllCount();
		}else{
			comments = commentService.getCommentByProductId(startpage,pagesizeno,this.comment.getProduct().getId());
			totalnum = commentService.getCount(this.comment.getProduct().getId());//6
		}
		
		
		/* ��ҳ�����㷨 */
		if (totalnum % pagesizeno != 0) {
			totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
		} else {
			totalpage = totalnum / pagesizeno;
		}
		
		request.put("currentpageno", currentpageno);// ���ݼ���õ���ǰҳ�� 
		request.put("pagesize", pagesizeno);// �õ�ÿҳ��ʾ��¼�� 5
		request.put("totalpage", totalpage);// �õ���ҳ��
		request.put("comments", comments);
		return SUCCESS;
	}
	//�û���������
	@Action(value="addComment",results={@Result(name="success",location="/com_success.jsp")})
	public String addComment(){
		if(this.level.equals("1��") || this.level.equals("2��")){
			comment.setCtitle("����");
		}else if(this.level.equals("3��")){
			comment.setCtitle("����");
		}else{
			comment.setCtitle("����");
		}
		comment.setCdate(new Date());
		commentService.addComment(comment);
		
		commentService.modifyPStatus(id);
		
		return SUCCESS;
	}
	//ǰ̨������������ƷID��ѯ����
	@Action(value="getCommentsByProductId",results={@Result(name="success",location="/view.jsp")})
	public String getCommentsByProductId(){
		Product p = productDao.getProductById(id);
		List<Comment> comments = commentService.getCommentByProductId(this.id);
		List<Comment> goodComments = new ArrayList<Comment>();
		List<Comment> midComments = new ArrayList<Comment>();
		List<Comment> badComments = new ArrayList<Comment>();
		for (Comment comment : comments) {
			if(comment.getCtitle().equals("����")){
				goodComments.add(comment);
			}else if(comment.getCtitle().equals("����")){
				midComments.add(comment);
			}else{
				badComments.add(comment);
			}
		}
		request.put("goodComments", goodComments);
		request.put("midComments", midComments);
		request.put("badComments", badComments);
		request.put("prod", p);
		return SUCCESS;
	}
	//ɾ������
	@Action(value="deleteComment",results={@Result(name="success",location="commentList",type="redirect")})
	public String deleteComment(){
		Comment ct = commentService.getCommentById(id);
		commentService.deleteComment(ct);
		return SUCCESS;
	}
	
	
	
}
