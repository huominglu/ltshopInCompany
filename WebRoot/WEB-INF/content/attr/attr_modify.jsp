<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
function checkSelect(){
		$("#attrvalue").html("");
		var attrtypeid = $("#attrnameid").val();
		var opo = "";
		if (attrtypeid == "1") {
			opo = "<td>属性值(多个用逗号隔开)</td>"+
                "<td><input type="+"'text'"+"name="+"'attr.attrvalue'"+" /></td>";	
		}
		$("#attrvalue").append(opo);
}

$(function(){
		var subtypeid = "${attr.subType.id}";
		$.ajax({
			type:"post",
			url:"getallsubtypes",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#subType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "";
					if (value.id == subtypeid) {
						opo = "<option value='"+value.id+"'selected="+"'selected'"+">"+value.subtypename+"</option>";
					}else{
						opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
					}
					$("#subType").append(opo);
				});
			}
				});
});
</script>
</head>

<body>
<div id="container">
	<h2>属性修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifyattr" method="post" onClick="return checkattr()">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>属性ID</td>
                <td><input type="text" name="attr.id" readonly="readonly" value="${attr.id}"/></td>
            </tr>
             <tr>
                <td>属性名</td>
                <td><input type="text" name="attr.attrname" value="${attr.attrname}" id="attrName"/>
                <label id="info"></label>
                </td>
            </tr>
             <tr>
                <td>属性类型</td>
                <td>
                <select name="attr.attrnameid" id="attrnameid" onchange="checkSelect()">
                            <c:if test="${attr.attrnameid == 0}">
                            	<option value="${attr.attrnameid}" selected="selected">手动输入</option>
                            	<option value="1">从列表中选取</option>
                            </c:if>
                            <c:if test="${attr.attrnameid == 1}">
                            	<option value="0">手动输入</option>
                            	<option value="1" selected="selected">从列表中选取</option>
                            </c:if>
                            
                 </select>     
                </td>
            </tr>
            <tr id="attrvalue">
            	<c:if test="${attr.attrnameid == 1}">
		           	<td>属性值(多个用逗号隔开)</td>
		            <td><input type="text" name="attr.attrvalue" value="${attr.attrvalue}" id="attrValue"/>
		            <label id="info1"></label>
		            </td>
            	</c:if>   
            </tr>
             <tr>
                <td>商品小类</td>
                <td>
                <select name="subType.id" id="subType">
                            <!-- <option value="id"  selected="selected">商品小类1</option>
                            <option value="name" >商品小类2</option> -->
                 </select>     
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>


