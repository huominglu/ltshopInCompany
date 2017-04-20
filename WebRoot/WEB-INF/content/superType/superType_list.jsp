<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>商品管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- 导入js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
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
function delSelectSuperType(){
	var checklist = document.getElementsByName("ck");
	var ids = "";
	alert(checklist.length);
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	alert(ids);
	if (ids != "") {
		$.ajax({
			type:"post",
			url:"delSelectStype?ids="+ids,
			dataType:"json",
			success:function(result){
			}
		});
	}
}
</script>  
</head>

<body>
<div id="container">
	<h2>大类信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">请选择</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">大类</option>
                            <option value="name" >大类1</option>
                            <option value="rolename" >大类2</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><input type="submit" value="查询"/></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0 }">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>大类ID</th>
                    <th>大类名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pm.datas}" var="st">
                <tr>
                	<td><input type="checkbox" name="ck" value="${st.id}"/></td>
                    <td>${st.id}</td>
                    <td>${st.superTypeName}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
                    	<a href="deletesupertypebyid?superType.id=${st.id}">删除</a>&nbsp;&nbsp;&nbsp;
                    	<a href="modifygetsupertypebyid?supertypeid=${st.id}">修改</a>
                    </c:if>
                    </td>
                </tr>	
                </c:forEach>
                </c:if>																							
        </table>
       <!--  <div id="word"><input type="button" value="删除" onclick="delSelectSuperType()"/></div> -->
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="pagemodel.action" export="currentPageNumber=pageNumber">
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

