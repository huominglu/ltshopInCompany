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
<script type="text/javascript" src="resources/js/select.js"></script>
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
</script>  
</head>

<body>
<div id="container">
	<h2>属性信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">请选择</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">属性</option>
                            <option value="name" >属性1</option>
                            <option value="rolename" >属性2</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><a href="">查询</a></div>
            <div id="word"><a href="">删除</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>属性ID</th>
                    <th>属性名称</th>
                    <th>属性类型</th>
                    <th>属性值</th>
                    <th>小类名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pm.datas}" var="attr">
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>${attr.id}</td>
                    <td>${attr.attrname}</td>
                    <td>
                    	<c:if test="${attr.attrnameid == 0}">
                    		手动输入
                    	</c:if>
                    	<c:if test="${attr.attrnameid == 1}">
                    		从列表中选取
                    	</c:if>
                    </td>
                    <td>${attr.attrvalue}</td>
                    <td>${attr.subType.subtypename}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
                    	<a href="delattrbyid?attr.id=${attr.id}">删除</a>&nbsp;&nbsp;&nbsp;
                    	<a href="getoneattr?attr.id=${attr.id}">修改</a>
                    </c:if>
                    </td>
                </tr>
                </c:forEach>	
             </c:if>		
                <!-- <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>			
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>			
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">删除</a>&nbsp&nbsp&nbsp<a href="">修改</a></td>
                </tr> -->																					
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="attrpagemodel.action" export="currentPageNumber=pageNumber">
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


