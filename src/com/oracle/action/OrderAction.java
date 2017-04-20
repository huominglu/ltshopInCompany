package com.oracle.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.Admin;

import org.hibernate.Query;

import com.oracle.model.SuperType;
import com.oracle.model.Order;
import com.oracle.model.OrderItem;
import com.oracle.model.OrderStatus;
import com.oracle.model.ProductInCart;
import com.oracle.model.Role;
import com.oracle.model.SubType;
import com.oracle.model.User;
import com.oracle.util.FileUpDownUtils;
import com.oracle.util.JasperReportUtil;
import com.oracle.util.PageModel;
import com.oracle.util.ReportConfig;
import com.oracle.service.AdminService;
import com.oracle.service.OrderService;


@ParentPackage("json-default")
@Controller
public class OrderAction extends ActionSupport implements SessionAware,RequestAware{
	private Order order;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private String result;
	private String info;
	private String selectdetail;
	//当前页码
	private String currentpageno;
	//每页显示记录数
	private String pagesize;
	private String resultset;
	private int ordertypeid;
	public static List<Order> orderList = new ArrayList<Order>();
//	//报表的字段--列名
//	public static Object[] fields = new String[]{};
	private String docType;
	
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
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
	public int getOrdertypeid() {
		return ordertypeid;
	}
	public void setOrdertypeid(int ordertypeid) {
		this.ordertypeid = ordertypeid;
	}
	public String getResultset() {
		return resultset;
	}
	public void setResultset(String resultset) {
		this.resultset = resultset;
	}
	public String getSelectdetail() {
		return selectdetail;
	}
	public void setSelectdetail(String selectdetail) {
		this.selectdetail = selectdetail;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	@Resource
	private OrderService orderService;

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	//调出所有订单状态
	@Action(value="/getallorderstatus",results=@Result(name="success",type="json",params={"root","result"}))
	public String getAllRoles(){
		List<OrderStatus> status = orderService.getAllOrderStatus(this.order.getId());
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jarray = JSONArray.fromObject(status,jsonconfig);
		this.result = jarray.toString();
		return SUCCESS;
	}
	//加载全部订单
	@Action(value="/listorder",results={@Result(name="success",location="order/order_list.jsp")})
	public String listOrder(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = "from Order";
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {}
		PageModel orderpm = orderService.getAllOrders(hql, offset, pagesize);
		orderList = orderpm.getDatas();
		request.put("pm", orderpm);
		return SUCCESS;
	}
	
	//条件查询
		@Action(value="/selectorder",results={@Result(name="success",location="order/order_list.jsp")})
		public String selectOrder(){
			HttpServletRequest hrequest = ServletActionContext.getRequest();
			String hql = null;
			if("".equals(this.selectdetail)||null == this.selectdetail){
				if("1".equals(info)){
					hql="from Order o where o.orderStaus.id = 1 ";
				}else if("2".equals(info)){
					hql="from Order o where o.orderStaus.id = 2 ";
				}else if("3".equals(info)){
					hql="from Order o where o.orderStaus.id = 3 ";
				}else if("4".equals(info)){
					hql="from Order o where o.orderStaus.id = 4 ";
				}else{
					hql="from Order";
				}
			}else{
				if ("username".equals(info)) {
					hql="from Order o where o.username like '%"+this.selectdetail+"%'";
				}else if("realname".equals(info)){
					hql="from Order o where o.realname like '%"+this.selectdetail+"%'";
				}else if("id".equals(info)){
					hql="from Order o where o.orderid like '%"+this.selectdetail+"%'";
				}
			}
			
			int offset = 0;
			int pagesize = 10;
			try {
				offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
			} catch (NumberFormatException e) {}
			PageModel orderpm = orderService.getOrderbyid(hql, offset, pagesize);
			orderList = orderpm.getDatas();
			request.put("pm", orderpm);
			return SUCCESS;
		}

	//删除管理员
		@Action(value="delorder",results={@Result(name="success",location="listorder",type="redirect")})
		public String delOrder(){
			orderService.delOrder(this.order);
			return SUCCESS;
		}
		//根据id调出order
		@Action(value="getorderbyid",results={@Result(name="success",location="order/order_modify.jsp")})
		public String getAdminById(){
			Order order = orderService.getOrderById(this.order);
			request.put("order", order);
			return SUCCESS;
		}
	//修改
		@Action(value="modifyorder",results={@Result(name="success",location="listorder",type="redirect")})
		public String modifyOrder(){
//			Order order = orderService.getOrderById(this.order);
//			OrderStatus orderStatus = orderService.getOrderStatusById(ordertypeid);
//			order.setOrderStaus(orderStatus);
			orderService.modifyOrder(this.order);
			return SUCCESS;
		}
		//更改订单状态
		@Action(value="tosendgoods",results={@Result(name="success",location="listorder",type="redirect")})
		public String tosendgoods(){
			Order order = orderService.getOrderById(this.order);
			OrderStatus orderStaus = orderService.getOrderStatusById(2);
			order.setOrderStaus(orderStaus);
			orderService.updateOrder(this.order);
			return SUCCESS;
		}
		//订单状态
		
		//订单增加
		@Action(value="addorder",results={@Result(name="success",location="/success.jsp",type="redirect")})
		public String addOrder() throws ParseException{
			User user = (User) session.get("user");
			order.setUsername(user.getUsername());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH::mm:ss");
			Date now = new Date(); 
			String ordertime = df.format(now);
			Date od = parseDate(ordertime);
			order.setOrderdate(od);
			OrderStatus os = orderService.getStatusById();
			order.setOrderStaus(os);
			List<OrderItem> ots = new ArrayList<OrderItem>();
			Map<Integer,ProductInCart> pic = (Map<Integer, ProductInCart>) session.get("pics");
			Set s = pic.keySet();
			Iterator ii = s.iterator();
			while(ii.hasNext()){
				int key = (Integer) ii.next();
				OrderItem ot = new OrderItem();
				ProductInCart pic2 = (ProductInCart) pic.get(key);
				ot.setProductid(pic2.getProductid());
				ot.setProductname(pic2.getProductname());
				ot.setProductnum(pic2.getNum());
				ot.setPrice(pic2.getPrice() * pic2.getNum());
				ot.setOtStatus("未评价");
				ot.setOrder(order);
				ots.add(ot);
			}
			order.setOis(ots);
			orderService.addOrder(order);
			return SUCCESS;
		}
		//时间转换
		public static Date parseDate(String str) throws ParseException{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH::mm:ss");
				return df.parse(str);
		}
		//前台显示订单详情
		@Action(value="/ordetail",results={@Result(name="success",location="order/order_details.jsp")})
		public String orderDetail(){
			Order order = orderService.getOrderById(this.order.getId());
			session.put("order", order);
				
			int startpage = 0;// 起始页
			int totalpage = 0;// 总页数
			int pagesizeno = 5;// 每页显示数据
			int totalnum = 0;// 总记录数
			
			/* 初始化数据 */
			if (currentpageno != null) {
				startpage = Integer.parseInt(currentpageno);
			}
			if (pagesize != null) {
				pagesizeno = Integer.parseInt(pagesize);
			}
						
			List<OrderItem> ots = orderService.getOrderItemByOid(startpage,pagesizeno,((Order)session.get("order")).getId());
			//totalnum = orderService.getCount(((Order)session.get("order")).getId());//6
			totalnum = ots.size();
			/* 分页具体算法 */
			if (totalnum % pagesizeno != 0) {
				totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
			} else {
				totalpage = totalnum / pagesizeno;
			}			
			request.put("currentpageno", currentpageno);// 根据计算得到当前页码 
			request.put("pagesize", pagesizeno);// 得到每页显示记录数 5
			request.put("totalpage", totalpage);// 得到总页数
			request.put("ots", ots);
			return "success";
		}
		
		//前台显示订单详情
				@Action(value="/ordetail1",results={@Result(name="success",location="/orderdetail.jsp")})
				public String orderDetail1(){
					Order order = orderService.getOrderById(this.order.getId());
					session.put("order", order);
						
					int startpage = 0;// 起始页
					int totalpage = 0;// 总页数
					int pagesizeno = 5;// 每页显示数据
					int totalnum = 0;// 总记录数
					
					/* 初始化数据 */
					if (currentpageno != null) {
						startpage = Integer.parseInt(currentpageno);
					}
					if (pagesize != null) {
						pagesizeno = Integer.parseInt(pagesize);
					}
								
					List<OrderItem> ots = orderService.getOrderItemByOid(startpage,pagesizeno,((Order)session.get

		("order")).getId());
					//totalnum = orderService.getCount(((Order)session.get("order")).getId());//6
					totalnum = ots.size();
					/* 分页具体算法 */
					if (totalnum % pagesizeno != 0) {
						totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
					} else {
						totalpage = totalnum / pagesizeno;
					}			
					request.put("currentpageno", currentpageno);// 根据计算得到当前页码 
					request.put("pagesize", pagesizeno);// 得到每页显示记录数 5
					request.put("totalpage", totalpage);// 得到总页数
					request.put("ots", ots);
					return "success";
				}
		
		//前台显示订单
		@Action(value="/listorder1",results={@Result(name="success",location="/orderlist.jsp")})
		public String listOrder1(){
			HttpServletRequest hrequest = ServletActionContext.getRequest();
			String hql = "from Order";
			int offset = 0;
			int pagesize = 10;
			try {
				offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
			} catch (NumberFormatException e) {}
			PageModel orderpm = orderService.getAllOrders(hql, offset, pagesize);
			request.put("pm", orderpm);
			return SUCCESS;
		}
		//打印订单
		@Action(value="/printOrder",results={@Result(name="success",location="order/order_list.jsp")})
		public String printOrder(){
			//根据需求生成文件
			produceDoc(docType);
			getExportDoc(ServletActionContext.getResponse(), ServletActionContext.getRequest().getServletContext().getRealPath("") + "/report/syslogReport" + "." + docType, "syslogReport" + "." + docType);
			return SUCCESS;
		}
		
		/**
		 * 生成文件存储到本地
		 */
		public void produceDoc(String docType){
			try {
				JasperReportUtil jru = new JasperReportUtil();
				ReportConfig<Order> orderReportConfig = new ReportConfig<Order>();
				orderReportConfig.setData(this.orderList);
				//模板文件的路径---E:\apache-tomcat-7.0.56\webapps\jmshopteam4\report
				String aaa = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("")+"/report";
				orderReportConfig.setJrxmlPath(aaa+"\\syslogReport.jrxml");
				orderReportConfig.setJrxmlExcelPath(aaa+"\\syslogExcelReport.jrxml");
				String[] fields = new String[]{"订单ID","用户登录名","用户真实姓名","用户地址","用户邮编","用户移动电话","订单日期","订单状态"};
				orderReportConfig.setFields(fields);
				orderReportConfig.setFieldLengths(statisticLength(this.orderList,fields));
				orderReportConfig.setDocPath(aaa+"/syslogReport");
				orderReportConfig.setDocType(docType);
				jru.reportMethod(orderReportConfig);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/**
		 * 统计每列中最长的字段
		 */
		public Integer[] statisticLength(List<Order> orderList,String[] fields){
			Integer[] fieldLength = new Integer[]{8,10,10,7,10,15,10};
			return fieldLength;
		}
		/**
		 * 导出文件供客户端下载
		 */
		public void getExportDoc(HttpServletResponse response, String filePath, String fileName) {
			try {
				FileUpDownUtils.download(ServletActionContext.getRequest(), response, filePath,
						new String("application/octet-stream"), fileName);
//				FortSystemLogFactory.getInnerHandleSystemLog().getSystemLogType("报表下载", "下载配置审计报表", true);
			} catch (Exception e) {
				e.printStackTrace();
//				FortSystemLogFactory.getInnerHandleSystemLog().getSystemLogType("报表下载", "下载配置审计报表", false);
			}
		}
}
