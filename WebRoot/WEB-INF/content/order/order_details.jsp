<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
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
	form1.submit();
}
</script>  

</head>

<body>
<div id="container">
	<h2>订单详情</h2>	
	<c:if test="${currentpageno==null }">
			<c:set var="currentpageno" value="0" scope="request"/>
		</c:if>
        <table cellspacing="0" cellpadding="0">
            
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>订单详情id</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>商品数量</th>
              		<th>总金额</th>
                    

                </tr>
                <c:if test="${fn:length(requestScope.ots)>0 }">
		                <c:forEach items="${requestScope.ots }" var="orderitem">
			                <tr>
			                	<td><input type="checkbox" name="groupCheckbox" /></td>
			                    <td>${orderitem.id}</td>
			                    <td>${orderitem.productname }</td>
			                    <td>${orderitem.price }</td>
			                    <td>${orderitem.productnum }</td>
			                    <td><c:out value="${orderitem.price*orderitem.productnum}"></c:out></td>
			                </tr>
		                </c:forEach>
                </c:if>																				
        </table>
        <div align="center" id="page">
            <form  action="ordetail?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="ordetail?currentpageno=0&pagesize=${pagesize}"  target="_self" >首页</a>  
			<a  href="ordetail?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >上一页</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> 首页 &nbsp;上一页</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="ordetail?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >下一页</a>  
			<a  href="ordetail?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >尾页</a>		
		</c:if> 
		<c:if test="${currentpageno==totalpage-1}"> 下一页 &nbsp;尾页</c:if> 第${currentpageno+1}页   共${totalpage}页    
		
	           	每页记录数<input type="text" name="pagesize" value="${pagesize }"/>
	           			<input type="submit" value="确定"/>
	 	</form>
	 	<a href="listorder">返回</a>
    	</div>
</div>

</body>
</html>
