<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=18030">
<title>商品商品</title>
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
//批量删除
function delSelectProduct(){
	var checklist = document.getElementsByName("groupCheckbox");
	var ids = "";
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	if (ids != "") {
		window.location="delSelectProduct?ids="+ids;
	}
}
</script>  

</head>

<body>
<div id="container">
	<h2>商品信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">请选择</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">商品编号</option>
                            <option value="name" >商品名</option>
                            <option value="rolename" >商品1</option>
                            <option value="rolename" >商品2</option>
                            <option value="rolename" >商品3</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><a >查询</a></div>
            <div id="word"><a style="cursor: pointer;" onclick="delSelectProduct()">批量删除</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>商品ID</th>
                    <th>商品名</th>
                    <th>图片</th>
                    <th>商品介绍</th>
                    <th>价格</th>
                    <th>现价</th>                    
                    <th>上架时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pm.datas}" var="prod">
                <tr>
                	<td><input type="checkbox" name="groupCheckbox" value="${prod.id}"/></td>
                    <td>${prod.id}</td>
                    <td>${prod.productname}</td>
                    <td width="100"><img src="${pageScope.realpath }${prod.picture}" width="100%" height="100"></td>
                    <td title="商品介绍详情">${prod.introduce}</td>
                    <td>${prod.price}</td>
                    <td>${prod.nowprice}</td>
                    <td>${prod.intime}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
                    	<a href="delproduct?product.id=${prod.id}">删除</a>&nbsp;&nbsp;&nbsp;
                    	<a href="getprodbyid?product.id=${prod.id}">修改</a>&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <a href="detailsproduct?product.id=${prod.id}">详情</a>
                    </td>
                </tr>
                </c:forEach>			
          </c:if>      																					
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="prodpagemodel.action" export="currentPageNumber=pageNumber">
                <pg:first>
                    <a href="">首页</a>
                </pg:first>
                <pg:prev>
                    <a href="">前页</a>
                </pg:prev>
                <pg:pages>
                    <c:choose>
                        <c:when test="${ currentPageNumber eq pageNumber}">
                            <font>1</font>
                        </c:when>
                        <c:otherwise>
                            <a href="">2</a>
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
            转入
            <input type="text" size="1"/>
            页 
            <a href="">跳转</a>
    	</div>
    </div>
</div>
</body>
</html>


