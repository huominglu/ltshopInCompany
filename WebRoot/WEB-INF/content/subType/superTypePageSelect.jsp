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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- 导入js -->
<!-- <!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
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

$(function(){
		var supertypeid = "${supertype.id}";
		$.ajax({
			type:"post",
			url:"getallsupertype",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				var opo = "";
				$.each(jsonobj,function(i,value){
					if (value.id == supertypeid) {
						opo = "<option selected="+"'selected'"+" value='"+value.id+"'>"+value.superTypeName+"</option>";
					}else{
						opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					}
					$("#superType").append(opo);
			});
			}
		});
	});
</script>  

</head>

<body>
<div id="container">
	<h2>小类信息</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="subsomepagemodel" method="post">
        	<div id="word">请选择大类名称：</div>
            <div id="main1">           
                 <select name="superType.id" id="superType" onchange="form1.submit();">
                        
                 </select>            
            </div>
            <div id="word"><input value="查询" type="submit"/></div>
            </form>
        </div>
        <c:if test="${currentpageno==null }">
			<c:set var="currentpageno" value="0" scope="request"/>
		</c:if>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(subtypes) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>小类ID</th>
                    <th>小类名称</th>
                    <th>所属大类</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${subtypes}" var="subtype">
                	<tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>${subtype.id}</td>
                    <td>${subtype.subtypename}</td>
                    <td>${subtype.superType.superTypeName}</td>
                    <td><a href="deletesubtype?subType.id=${subtype.id}">删除</a>&nbsp;&nbsp;&nbsp;
                    <a href="getsubtypebyid?subType.id=${subtype.id}">修改</a></td>
                </tr>
                </c:forEach>
            </c:if>																					
        </table>
        <div id="word"><input type="button" value="删除"/></div>
        <div align="center" id="page">
            <form  action="subsomepagemodel?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="subsomepagemodel?currentpageno=0&pagesize=${pagesize}"  target="_self" >首页</a>  
			<a  href="subsomepagemodel?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >上一页</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> 首页 &nbsp;上一页</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="subsomepagemodel?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >下一页</a>  
			<a  href="subsomepagemodel?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >尾页</a>		
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

