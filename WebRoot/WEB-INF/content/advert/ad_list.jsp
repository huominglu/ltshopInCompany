<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String realpath = basePath+"upfile/";
pageContext.setAttribute("realpath", realpath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广告管理</title>
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
<script type="text/javascript">
	$().ready(function(){
		var adtype = '${requestScope.adtype}';
		if(adtype == "1"){
			$("#tj").attr("selected","selected");
		}else if(adtype == "2"){
			$("#cx").attr("selected","selected");
		}else{
			$("#all").attr("selected","selected");
		}
		
	});
</script>
</head>

<body>
<div id="container">
	<h2>广告信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="ad_list" method="post">
	        	<div id="word">请选择</div>
	            <div id="main1">           
	                 <select name="advert.adType.id" id="language" onchange="submit()">
	                            <option id="all" value="3">全部广告</option>
	                            <option id="tj" value="1" >商品推荐</option>
	                            <option id="cx" value="2" >商品促销</option>
	                 </select>            
	            </div>
	            <div id="main2"><input type="text" name="advert.description"/></div>
	            <div id="word"><a onclick="submit()" style="cursor:pointer;">查询</a></div>
	            <div id="word"><a style="cursor:pointer;">批量删除</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0" style="margin-bottom: 100px;">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>广告ID</th>
                    <th>广告类型</th>
                    <th>广告图片</th>
                    <th>广告描述</th>
                    <th>开始时间</th>
                    <th>截止时间</th>
                    <th>操作</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
	            	<c:forEach items="${requestScope.pm.datas }" var="ad">
		                <tr>
		                	<td><input type="checkbox" name="groupCheckbox"/></td>
		                    <td>${ad.id }</td>
		                    <td>${ad.adType.adtypename }</td>
		                    <td width="300"><img src="${pageScope.realpath }${ad.picture}" width="100%" height="150"></td>
		                    <td>${ad.description }</td>
		                    <td>${ad.begintime }</td>
		                    <td>${ad.endtime }</td>
		                    <td>
		                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
		                    	<a href="ad_delete?id=${ad.id }">删除</a>&nbsp&nbsp&nbsp<a href="ad_premodify?id=${ad.id }">修改</a>
		                    </c:if>
		                    </td>
		                </tr>			
                	</c:forEach>
                </c:if>																		
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="ad_list.action" export="currentPageNumber=pageNumber">
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
