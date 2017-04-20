<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公告管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- 导入js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<!-- 复选框的全选与全不选 -->
<script type="text/javascript">  
 function selectAll(){
 var checklist = document.getElementsByName ("ck");
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
	selectform.submit();
}
//批量删除
function delSelectSuperType(){
	var checklist = document.getElementsByName("ck");
	var ids = "";
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	if (ids != "") {
		window.location="delSelectNotice?ids="+ids;
	}
}
</script>  
<script type="text/javascript">
	$().ready(function(){
		var title = '${requestScope.title}';
		if(title == "公告"){
			$("#gg").attr("selected","selected");
		}else if(title == "特惠"){
			$("#th").attr("selected","selected");
		}else if(title == "优选"){
			$("#yx").attr("selected","selected");
		}else{
			$("#all").attr("selected","selected");
		}
		
	});
</script>
</head>

<body>
<div id="container">
	<h2>公告信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="selectform" action="notice_list" method="post">
	        	<div id="word">查询选项</div>
	            <div id="main1">           
	                 <select name="notice.noticetitle" id="language" onchange="submit()" >
	                 			<option id="all" value="全部" >全部</option>
	                            <option id="gg" value="公告"  >公告</option>
	                            <option id="th" value="特惠"  >特惠</option>
	                            <option id="yx" value="优选"  >优选</option>
	                 </select>            
	            </div>
	            <div id="main2"><input type="text" name="notice.noticecontent"/></div>
	            <div id="word"><a style="cursor: pointer;" onclick="submit()">查询</a></div>
	            <div id="word"><a style="cursor: pointer;" onclick="delSelectSuperType()">批量删除</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
            	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                <th>公告ID</th>
                <th>公告标题</th>
                <th>公告内容</th>
                <th>操作</th>
            </tr>
            <c:if test="${fn:length(pm.datas)>0 }">
	            <c:forEach items="${requestScope.pm.datas }" var="notice">
	            	<tr>
	            		<td><input type="checkbox"  name="ck" value="${notice.id }"/></td>
	            		<td>${notice.id }</td>
	            		<td>${notice.noticetitle }</td>
	            		<td>${notice.noticecontent }</td>
	            		<td>
	            		<c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
	            			<a href="notice_delete?id=${notice.id }">删除</a>&nbsp;&nbsp;
	            			<a href="notice_premodify?notice.id=${notice.id }&notice.noticetitle=${notice.noticetitle}&notice.noticecontent=${notice.noticecontent}">修改</a>
	            		</c:if>
	            		</td>
	            	</tr>
	            </c:forEach>
            </c:if>																					
        </table>
<!--         <div id="word"><input type="button" value="删除" onclick="delSelectSuperType()"/></div> -->
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="notice_list.action" export="currentPageNumber=pageNumber">
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

