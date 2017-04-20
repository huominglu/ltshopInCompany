<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>评论管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- 导入js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
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
// function chaxun(){
// 	alert("chaxun");
// 	var obj = document.getElementById("chaxun").value="";
// 	obj.value="";
// }
</script>  
<script type="text/javascript">
$().ready(function(){
	$("#chaxun").focus(function(){
		$("#chaxun").val("");
	});
});
</script>
</head>

<body>
<div id="container">
	<h2>评论信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="commentList" method="post">
	        	<div id="word">请输入</div>
	            <div id="main1">           
	                 <!-- <select name="language" id="language">
	                            <option value="id"  selected="selected">评论</option>
	                            <option value="name" >评论1</option>
	                            <option value="rolename" >评论2</option>
	                 </select>  -->           
	            </div>
	            <div id="main2"><input id="chaxun" type="text" name="comment.product.id" value="请输入商品ID查询评论"/></div>
	            <div id="word"><a onclick="submit()" style="cursor: pointer;">查询</a></div>
	            <div id="word"><a style="cursor: pointer;">批量删除</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>评论ID</th>
                    <th>评论用户名</th>
                    <th>商品编号</th>
                    <th>评价</th>
                    <th style="width: 80px;">评论内容</th>
                    <th>评论日期</th>
                    <th>操作</th>
                </tr>
                <c:if test="${fn:length(requestScope.comments)>0 }">
	                <c:forEach items="${requestScope.comments }" var="cts">
		                <tr>
		                	<td><input type="checkbox" name="groupCheckbox"/></td>
		                    <td>${cts.id }</td>
		                    <td>${cts.username }</td>
		                    <td>${cts.product.id }</td>
		                    <td>${cts.ctitle }</td>
		                    <td style="width: 80px;" title="${cts.content }"><label style="width: 400px;;display:block;overflow:hidden;white-space:nowrap;">${cts.content }</label></td>
		                    <td>${cts.cdate }</td>
		                    <td>
		                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
		                    	<a href="deleteComment?id=${cts.id }">删除</a>
		                    </c:if>
		                    </td>
		                </tr>		
	                </c:forEach>	
                </c:if>																					
        </table>
        <div align="center" id="page">
        <form  action="commentList?currentpageno=0" method="post">
			<c:if test="${currentpageno>0}">
				<a  href="commentList?currentpageno=0&pagesize=${pagesize}"  target="_self" >首页</a>  
				<a  href="commentList?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >上一页</a>
			</c:if>	  			
			<c:if test="${currentpageno==0}"> 首页 &nbsp;上一页</c:if>
			<c:if test="${currentpageno < totalpage-1}">			
				<a  href="commentList?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >下一页</a>  
				<a  href="commentList?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >尾页</a>		
			</c:if> 
			<c:if test="${currentpageno==totalpage-1}"> 下一页 &nbsp;尾页</c:if> 第${currentpageno+1}页   共${totalpage}页    
			
		           	每页记录数<input type="text" name="pagesize" value="${pagesize }"/>
		           			<input type="submit" value="确定"/>
	 	</form>
    	</div>
    </div>
</div>
</body>
</html>

