<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- 导入js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<!-- 复选框的全选与全不选 -->
<script type="text/javascript">  
 function selectAll(){
 var checklist = document.getElementsByName ("groupCheckbox");
   if(document.getElementById("controlAll").checked)
   {
   for(var i=0;i<checklist.length;i++)
   {
      checklist[i].checked = 1;
   } 
 }else{
  for(var j=0;j<checklist.length;j++)
  {
     checklist[j].checked = 0;
  }
 }
}
function submit(){
	var info = document.getElementById("selectdetail").value;
	if(info != null){
		form1.submit();
	}else{
		var info1 = document.getElementById("info").value;
		if(info1 == 1||info == 2||info == 3||info == 4){
		form1.submit();
		}
		document.getElementById(font1).innerHTML="请输入查询内容！";
	}
}
</script>  

</head>

<body>
<div id="container">
	<h2>订单信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="selectorder" method="post">
	        	<div id="word">请选择</div>
	            <div id="main1">           
                <select name="info" id="language">
                            <option value="id"  selected="selected">订单编号</option>
                            <option value="username" >用户名</option>
                            <option value="realname" >真实姓名</option>
                            <option value="1">未发货</option>
                            <option value="2" >已发货</option>
                            <option value="3" >已收货（未评论）</option>
                            <option value="4" >已完成（已评论）</option>
                 </select>            
	             </div>
	             <div id="main2"><input type="text" name="selectdetail"/></div>
	             <div id="word">
		             <font id="font1" color="red"></font><input type="submit" value="查询" />
		             <a href="printOrder?datas=${pm.datas }&docType=doc">&nbsp;&nbsp;打印订单</a>
	             </div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>订单ID</th>
                    <th>用户登录名</th>
                    <th>用户真实姓名</th>
                    <th>用户地址</th>
                    <th>用户邮编</th>
                    <th>用户移动电话</th>
                    <th>订单日期</th>
                    <th>订单状态</th>
                    <th>操作</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
		                <c:forEach items="${pm.datas }" var="order">
			                <tr>
			                	<td><input type="checkbox" name="groupCheckbox" /></td>
			                    <td>${order.id}</td>
			                    <td>${order.username }</td>
			                    <td>${order.realname }</td>
			                    <td>${order.address }</td>
			                    <td>${order.postcode }</td>
			                    <td>${order.mobil }</td>
			                    <td>${order.orderdate }</td>
			                    <td>${order.orderStaus.orderStatusName }</td>
			                    <td><a href="ordetail?order.id=${order.id }">详情</a>&nbsp;&nbsp;
			                    	<a href="tosendgoods?order.id=${order.id }">发货</a>&nbsp;&nbsp;
			                    	<a href="delorder?order.id=${order.id }">删除</a>&nbsp;&nbsp;
			                    	<a href="getorderbyid?order.id=${order.id }">修改</a>	
			                    </td>
			                </tr>
		                </c:forEach>
                </c:if>																				
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="listorder.action" export="currentPageNumber=pageNumber">
                <pg:first>
                    <a href="${pageUrl}">首页</a>
                </pg:first>
                <pg:prev>
                    <a href="${pageUrl}">前页</a>
                </pg:prev>
                <pg:pages>
                    <c:choose>
                        <c:when test="${ currentPageNumber eq pageNumber}">
                            <font>${pageNumber}</font>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl }">${pageNumber }</a>
                        </c:otherwise>
                    </c:choose>
                </pg:pages>
                <pg:next>
                    <a href="${pageUrl }">下页</a>
                </pg:next>
                <pg:last>
                    <a href="${pageUrl }">尾页</a>
                </pg:last>
            </pg:pager>
    	</div>
    </div>
</div>
</body>
</html>
