package com.oracle.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.AdStatus;
import com.oracle.model.AdType;
import com.oracle.model.Advert;
import com.oracle.model.Notice;
import com.oracle.service.AdService;
import com.oracle.util.PageModel;
@ParentPackage(value="json-default")
@Controller
public class AdAction extends ActionSupport implements RequestAware{
	
	private int id; 
	private String picture;
	private Map<String, Object> request;
	private Advert advert;
	private AdStatus adStatus;
	private AdType adType;
	private File upload;//获取上传文件
	private String uploadFileName;//获取上传文件的文件名
	private String uploadContentType;//获取上传文件的文件类型
	private String result;

	@Resource
	private AdService adService;
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public AdService getAdService() {
		return adService;
	}
	public void setAdService(AdService adService) {
		this.adService = adService;
	}
	public Advert getAdvert() {
		return advert;
	}
	public void setAdvert(Advert advert) {
		this.advert = advert;
	}
	public AdStatus getAdStatus() {
		return adStatus;
	}
	public void setAdStatus(AdStatus adStatus) {
		this.adStatus = adStatus;
	}
	public AdType getAdType() {
		return adType;
	}
	public void setAdType(AdType adType) {
		this.adType = adType;
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
	@Action(value="/loadindex",results=@Result(name="success",location="/index.jsp"))
	public String loadIndex(){
		return "success";
	}
	//获取广告
	@Action(value="ad_list",results={@Result(name="success",location="advert/ad_list.jsp"),
			@Result(name="input",location="error.jsp")})
	public String ad_list(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = null;
		if(advert != null ){
			if(advert.getAdType().getId()==3){
				hql = "from Advert a where a.description like '%"+advert.getDescription()+"%'";
			}else{
				hql = "from Advert a where a.adType.id = "+advert.getAdType().getId()+" and a.description like '%"+advert.getDescription()+"%'";
			}
			request.put("adtype", this.advert.getAdType().getId());
		}else{
			hql = "from Advert";
		}
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {
		}
		PageModel pm  = adService.getAllAd(hql, offset, pagesize);
		request.put("pm", pm);
		return SUCCESS;
	}
		
	//main.jsp转到ad_add.jsp
	@Action(value="ad_preadd",results={@Result(name="success",location="advert/ad_add.jsp")})
	public String ad_preadd(){
		return SUCCESS;
	}
	//添加广告
	@Action(value="ad_add",results={@Result(name="success",location="ad_list",type="redirect")})
	public String ad_add(){
		//获取上传的图片
		String upaddr = ServletActionContext.getServletContext().getRealPath("/")+"upfile/";
		String filename = this.uploadFileName;
		if(filename == null){
			advert.setPicture("unkown");
		}else{
			String realname = UUID.randomUUID().toString()+filename.substring(filename.indexOf("."));
			advert.setPicture(realname);
			File file = new File(upaddr,realname);
			try {
				FileUtils.copyFile(upload, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		advert.setAdStatus(adStatus);
		advert.setAdType(adType);
		adService.adAdd(advert);
		return SUCCESS;
	}
	//修改广告预处理
	@Action(value="ad_premodify",results={@Result(name="success",location="advert/ad_modify.jsp")})
	public String ad_premodify(){
		Advert ad = adService.getAdById(id);
		request.put("advert", ad);
		return SUCCESS;
	}
	//修改广告
	@Action(value="ad_modify",results={@Result(name="success",location="ad_list",type="redirect"),
			@Result(name="input",location="error.jsp")})
	public String ad_modify(){
		//获取上传的图片
		String upaddr = ServletActionContext.getServletContext().getRealPath("/")+"upfile/";
		String filename = this.uploadFileName;
		if(filename == null || "".equals(filename)){
			filename = this.picture;
			advert.setPicture(filename);
		}else{
			String realname = UUID.randomUUID().toString()+filename.substring(filename.indexOf("."));
			advert.setPicture(realname);
			File file = new File(upaddr,realname);
			try {
				FileUtils.copyFile(upload, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		advert.setAdStatus(adStatus);
		advert.setAdType(adType);
		adService.adModify(advert);
		return SUCCESS;
	}
	//删除广告
	@Action(value="ad_delete",results={@Result(name="success",location="ad_list",type="redirect")})
	public String ad_delete(){
		Advert ad = adService.getAdById(id);
		adService.deleteAd(ad);
		return SUCCESS;
	}
	
	//前台调用广告
	@Action(value="getNewAd",results={@Result(name="success",type="json",params={"root","result"})})
	public String getNewAd(){
		List<Advert> ads = adService.getNewAd();
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setExcludes(new String[]{"adStatus","adType"});
		JSONArray jarray = JSONArray.fromObject(ads,jsonconfig);
		System.out.println("==============="+jarray.toString());
		this.result = jarray.toString();
		return SUCCESS;
	}
	
	
	
}
