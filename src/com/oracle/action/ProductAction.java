package com.oracle.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.oracle.model.Comment;
import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.service.CommentService;
import com.oracle.service.ProductService;
import com.oracle.service.SubTypeService;
import com.oracle.service.SuperTypeService;
import com.oracle.util.PageModel;

@ParentPackage(value="json-default")
@Controller
public class ProductAction implements RequestAware,SessionAware{
	@Resource
	private ProductService productService;
	@Resource
	private SubTypeService subTypeService;
	@Resource
	private SuperTypeService superTypeService;
	@Resource
	private CommentService commentService;
	
	private Product product;
	
	private SubType subType;
	
	private String result;
	
	private String currentpageno;
	
	private String pagesize;
	
	private Map<String,Object> request;
	
	private Map<String,Object> session;
	
	private SuperType superType;
	
	private File upload;//获取上传文件
	
	private String uploadFileName;//获取上传文件的文件名
	
	private String uploadContentType;//获取上传文件的文件类型

	private int id;
	
	private String ids;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public SuperTypeService getSuperTypeService() {
		return superTypeService;
	}

	public void setSuperTypeService(SuperTypeService superTypeService) {
		this.superTypeService = superTypeService;
	}

	public SuperType getSuperType() {
		return superType;
	}

	public void setSuperType(SuperType superType) {
		this.superType = superType;
	}

	public SubTypeService getSubTypeService() {
		return subTypeService;
	}

	public void setSubTypeService(SubTypeService subTypeService) {
		this.subTypeService = subTypeService;
	}

	public SubType getSubType() {
		return subType;
	}

	public void setSubType(SubType subType) {
		this.subType = subType;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	@Action(value="/loadaddprod",results=@Result(name="success",location="product/product_add.jsp"))
	public String loadAddProduct(){
		return "success";
	}
	
	@Action(value="/addprod",results=@Result(name="success",type="redirect",location="/prodpagemodel"))
	public String addProduct(){
		String upaddr = ServletActionContext.getServletContext().getRealPath("/")+"upfile/";
		String filename = this.uploadFileName;
		System.out.println(filename);
		String realname = UUID.randomUUID().toString()+filename.substring(filename.indexOf("."));
		product.setPicture(realname);
		File file = new File(upaddr,realname);
		try {
			FileUtils.copyFile(upload, file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		SuperType supt = superTypeService.getSuperTypeById(this.superType.getId());
		product.setSuperType(supt);
		SubType subt = this.subTypeService.getSubTypeById(this.subType.getId());
		product.setSubType(subt);
		productService.addProduct(product);
		return "success";
	}
	@Action(value="/prodpagemodel",results=@Result(name="success",location="product/product_list.jsp"))
	public String getAllSuperTypePage(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = "from Product";
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) { }
		PageModel stPageModel = new PageModel();
		stPageModel = productService.getAllProductPage(hql,offset,pagesize);
		request.put("pm", stPageModel);
		return "success";
	}
	
	@Action(value="/delproduct",results=@Result(name="success",location="/prodpagemodel",type="redirect"))
	public String deleteProduct(){
		Product prod = productService.getProductById(this.product.getId());
		productService.deleteProduct(prod);
		return "success";
	}
	@Action(value="/detailsproduct",results=@Result(name="success",location="product/product_details.jsp"))
	public String detailsProduct(){
		Product prod = productService.getProductById(this.product.getId());
		request.put("prod", prod);
		return "success";
	}
	
	@Action(value="/getprodbyid",results=@Result(name="success",location="product/product_modify.jsp"))
	public String getProdById(){
		Product prod = productService.getProductById(this.product.getId());
		request.put("prod", prod);
		return "success";
	}
	@Action(value="/modifyprod",results=@Result(name="success",type="redirect",location="prodpagemodel"))
	public String modifyProduct(){
		String upaddr = ServletActionContext.getServletContext().getRealPath("/")+"upfile/";
		String filename = this.uploadFileName;
		if(filename == null || "".equals(filename)){
			filename = this.product.getPicture();
			product.setPicture(filename);
		}else{
			String realname = UUID.randomUUID().toString()+filename.substring(filename.indexOf("."));
			product.setPicture(realname);
			File file = new File(upaddr,realname);
			try {
				FileUtils.copyFile(upload, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		SuperType supt = superTypeService.getSuperTypeByName(this.superType.getSuperTypeName());
		product.setSuperType(supt);
		SubType subt = this.subTypeService.getSubTypeByName(this.subType.getSubtypename());
		product.setSubType(subt);
		productService.modifyProduct(product);
		return "success";
	}
	@Action(value="/getprodbyissale",results=@Result(name="success",type="json",params={"root","result"}))
	public String getProdByIssale(){
		List<Product> prods = productService.getProdByIssale();
		JsonConfig jsonconfig = new JsonConfig();
//		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonconfig.setExcludes(new String[]{"superType","subType","coms"});
		JSONArray jarray = JSONArray.fromObject(prods,jsonconfig);
		this.result = jarray.toString();
		return "success";
	}
	@Action(value="/getprodbyisnew",results=@Result(name="success",type="json",params={"root","result"}))
	public String getProdByIsnew(){
		List<Product> prods = productService.getProdByIsnew();
		JsonConfig jsonconfig = new JsonConfig();
//		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonconfig.setExcludes(new String[]{"superType","subType","coms"});
		JSONArray jarray = JSONArray.fromObject(prods,jsonconfig);
		this.result = jarray.toString();
		return "success";
	}
	@Action(value="/getprodisspecial",results=@Result(name="success",type="json",params={"root","result"}))
	public String getProductIsspecial(){
		List<Product> prods = productService.getProdByIspecial();
		JsonConfig jsonconfig = new JsonConfig();
//		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonconfig.setExcludes(new String[]{"superType","subType","coms"});
		JSONArray jarray = JSONArray.fromObject(prods,jsonconfig);
		this.result = jarray.toString();
		return "success";
	}
	@Action(value="/proddetail",results=@Result(name="success",location="/view.jsp"))
	public String getProdDetail(){
		Product prod = productService.getProductById(this.product.getId());
		request.put("prod", prod);
		List<Comment> comments = commentService.getCommentByProductId(this.product.getId());
		List<Comment> goodComments = new ArrayList<Comment>();
		List<Comment> midComments = new ArrayList<Comment>();
		List<Comment> badComments = new ArrayList<Comment>();
		if(comments != null){
			for (Comment comment : comments) {
				if(comment.getCtitle().equals("好评")){
					goodComments.add(comment);
				}else if(comment.getCtitle().equals("中评")){
					midComments.add(comment);
				}else{
					badComments.add(comment);
				}
			}
			request.put("goodComments", goodComments);
			request.put("midComments", midComments);
			request.put("badComments", badComments);
		}
		return "success";
	}
	
	//评论页面获取商品
	@Action(value="/getprodbyid1",results=@Result(name="success",location="/comment.jsp"))
	public String getProdById1(){
		Product prod = productService.getProductById(this.product.getId());
		request.put("product", prod);
		request.put("otid", id);
		return "success";
	}
	@Action(value="/getprodbysupertype",results=@Result(name="success",location="/category.jsp"))
	public String getProdBySuperType(){
		List<Product> prods = productService.getProdBySuperTypeId(this.superType.getId());
		request.put("prods", prods);
		return "success";
	}
	@Action(value="/getprodbysubtypepage",results=@Result(name="success",location="/prodlistbysubtype.jsp"))
	public String getProdBySubTypePage(){
		if (this.subType != null) {
			SubType supt = subTypeService.getSubTypeById(this.subType.getId());
			session.put("subtype", supt);
		}
		int startpage = 0;// 起始页
		int totalpage = 0;// 总页数
		int pagesizeno = 6;// 每页显示数据
		int totalnum = 0;// 总记录数
		
//		/* 初始化数据 */
		if (currentpageno != null) {
			startpage = Integer.parseInt(currentpageno);
		}
		if (pagesize != null) {
			pagesizeno = Integer.parseInt(pagesize);
		}
		
		
		List<Product> prods = productService.getProdBySubTypeIdPage(startpage,pagesizeno,((SubType)session.get("subtype")).getId());
		totalnum = productService.getCountBySubType(((SubType)session.get("subtype")).getId());//6
		
		/* 分页具体算法 */
		if (totalnum % pagesizeno != 0) {
			totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
		} else {
			totalpage = totalnum / pagesizeno;
		}
		
		request.put("currentpageno", currentpageno);// 根据计算得到当前页码 
		request.put("pagesize", pagesizeno);// 得到每页显示记录数 5
		request.put("totalpage", totalpage);// 得到总页数
		request.put("prods", prods);
		return "success";
	}
	@Action(value="/getprodbysupertypepage",results=@Result(name="success",location="/category.jsp"))
	public String getProdBySuperTypePage(){
		if (this.superType != null) {
			SuperType supt = superTypeService.getSuperTypeById(this.superType.getId());
			session.put("supertype", supt);
		}
		int startpage = 0;// 起始页
		int totalpage = 0;// 总页数
		int pagesizeno = 6;// 每页显示数据
		int totalnum = 0;// 总记录数
		
//		/* 初始化数据 */
		if (currentpageno != null) {
			startpage = Integer.parseInt(currentpageno);
		}
		if (pagesize != null) {
			pagesizeno = Integer.parseInt(pagesize);
		}
		
		
		List<Product> prods = productService.getProdBySuperTypeIdPage(startpage,pagesizeno,((SuperType)session.get("supertype")).getId());
		totalnum = productService.getCount(((SuperType)session.get("supertype")).getId());//6
		
		/* 分页具体算法 */
		if (totalnum % pagesizeno != 0) {
			totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
		} else {
			totalpage = totalnum / pagesizeno;
		}
		
		request.put("currentpageno", currentpageno);// 根据计算得到当前页码 
		request.put("pagesize", pagesizeno);// 得到每页显示记录数 5
		request.put("totalpage", totalpage);// 得到总页数
		request.put("prods", prods);
		return "success";
	}
	@Action(value="/getproductbyisspecial",results=@Result(name="success",location="/index.jsp"))
	public String getProductByIsSpecial(){
		List<Product> prods = productService.getProdByIspecial();
		request.put("prods", prods);
		return "success";
	}
	//批量删除商品
	@Action(value="delSelectProduct",results={@Result(name="success",location="/prodpagemodel",type="redirect")})
	public String delSelectProduct(){
		String[] idss = ids.split(",");
		for (String str : idss) {
			int tid = Integer.parseInt(str);
			Product prod = productService.getProductById(tid);
			productService.deleteProduct(prod);
		}
		return "success";
	}
}
