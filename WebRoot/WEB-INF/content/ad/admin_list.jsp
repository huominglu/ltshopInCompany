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
<title>用户管理</title>
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
	var info = document.getElementById("aname").value;
	if(info != null){
		form1.submit();
	}else{
		document.getElementById(font1).innerHTML="请输入查询内容！";
	}
}
</script>  
</head>

<body>
<div id="container">
	<h2>用户信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="selectadmin" method="post">
        	<div id="word">请选择</div>
            <div id="main1">           
                 <select name="info" id="language">
                            <option value="id" selected="selected">用户ID</option>
                            <option value="name" >用户名</option>
                            <option value="rolename" >用户角色</option>
                 </select>            
            </div>
            <div id="main2"><input id="aname" type="text" name="aname"/></div>
            <div id="word"><a onclick="submit()" style="cursor: pointer;"><font id="font1" color="red"></font>查询</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>角色名称</th>
                    <th>操作</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
		                <c:forEach items="${pm.datas }" var="admin">
			                <tr>
			                	<td><input type="checkbox" name="groupCheckbox" /></td>
			                    <td>${admin.id }</td>
			                    <td>${admin.name }</td>
			                    <td>${admin.password }</td>
			                    <td>${admin.role.rolename }</td>
			                    <td>
				                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
					                    <a href="deladmin?admin.id=${admin.id }">删除</a>&nbsp;&nbsp;&nbsp;
					                    <a href="getadminbyid?admin.id=${admin.id }">修改</a>
				                    </c:if>
			                    </td>
			                </tr>
		                </c:forEach>
                </c:if>																				
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="listadmin.action" export="currentPageNumber=pageNumber">
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
