package com.oracle.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.Notice;
import com.oracle.service.NoticeService;
import com.oracle.util.PageModel;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;
@ParentPackage("json-default")
@Controller
public class NoticeAction extends ActionSupport implements RequestAware{
	private int id;
	private Notice notice;
	private Map<String, Object> request;
	private String[] groupCheckbox;
	private String result;
	private String ids;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	@Resource
	private NoticeService noticeService;
	public String[] getGroupCheckbox() {
		return groupCheckbox;
	}
	public void setGroupCheckbox(String[] groupCheckbox) {
		this.groupCheckbox = groupCheckbox;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public NoticeService getNoticeService() {
		return noticeService;
	}
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	//获取公告
	@Action(value="notice_list",results={@Result(name="success",location="notice/notice_list.jsp")})
	public String noticelist(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = null;
		if(notice!= null ){
			if("全部".equals(notice.getNoticetitle())){
				hql = "from Notice n where n.noticecontent like '%"+notice.getNoticecontent()+"%'";
			}else{
				hql = "from Notice n where n.noticetitle = '"+notice.getNoticetitle()+"' and n.noticecontent like '%"+notice.getNoticecontent()+"%'";
			}
			request.put("title", this.notice.getNoticetitle());
		}else{
			hql = "from Notice";
		}
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {
		}
		
		PageModel pm  = noticeService.getAllNotice(hql, offset, pagesize);
		
		request.put("pm", pm);
		
		return SUCCESS;
	}
	//main.jsp跳转到notice_add.jsp页面
	@Action(value="noticeAdd",results={@Result(name="success",location="notice/notice_add.jsp")})
	public String noticeAdd(){
		return SUCCESS;
	}
	//添加公告
	@Action(value="notice_add",results={@Result(name="success",location="notice_list",type="redirect")})
	public String notice_add(){
		this.notice.setNoticetime(new Date());
		noticeService.addNotice(notice);
		return SUCCESS;
	}
	//删除公告 input
	@Action(value="notice_delete",results={@Result(name="success",location="notice_list",type="redirect"),
			@Result(name="input",location="notice_list",type="redirect")})
	public String notice_delete(){
		int count = noticeService.delNotice(id);
		return SUCCESS;
	}
	//修改公告预处理
	@Action(value="notice_premodify",results={@Result(name="success",location="notice/notice_modify.jsp")})
	public String notice_premodify(){
		request.put("notice", notice);
		return SUCCESS;
	}
	//修改公告
	@Action(value="notice_modify",results={@Result(name="success",location="notice_list",type="redirect")})
	public String notice_modify(){
		int count = noticeService.modifyNotice(notice);
		return SUCCESS;
	}
	
	//前台调用公告
	@Action(value="getNewNotice",results={@Result(name="success",type="json",params={"root","result"})})
	public String getNewNotice(){
		List<Notice> notices = noticeService.getNewNotice();
		JsonConfig jsonconfig = new JsonConfig();
		JSONArray jarray = JSONArray.fromObject(notices,jsonconfig);
		this.result = jarray.toString();
		return SUCCESS;
	}
	//批量删除公告
	@Action(value="delSelectNotice",results={@Result(name="success",location="notice_list",type="redirect")})
	public String delSelectNotice(){
		String[] idss = ids.split(",");
		for (String str : idss) {
			int tid = Integer.parseInt(str);
			System.out.println("tid:"+tid+"++++++++++++++++++++++++++++++++++++++++++++++");
			noticeService.delNotice(tid);
		}
		return SUCCESS;
	}

	
	
	
	
}
