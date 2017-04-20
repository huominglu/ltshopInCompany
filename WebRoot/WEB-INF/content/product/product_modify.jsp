<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb18030">
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
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript">
function insertTitle(tValue){  
   var t1 = tValue.lastIndexOf("\\");  
   var t2 = tValue.lastIndexOf(".");  
   if(t1 >= 0 && t1 < t2 && t1 < tValue.length){  
    document.getElementById("filename").innerHTML = tValue.substring(t1 + 1, t2);  
   }  
}  
</script>
</head>

<body>
<div id="container">
	<h2>商品修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifyprod" method="post" enctype="multipart/form-data">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>商品ID</td>
                <td><input type="text" name="product.id" value="${prod.id}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>商品大类</td>
                <td>
                <!-- <select name="superType" id="superType" readonly="readonly" onchange="getSubType()" onclick="getSubType()">
                           <option selected="selected"> 
                 </select> -->
                 <input type="text" name="superType.superTypeName" value="${prod.superType.superTypeName}" readonly="readonly"/>     
                </td>
            </tr>
            <tr>
                <td>商品小类</td>
                <td>
                <!-- <select name="language2" id="subType" readonly="readonly">
                     
                 </select> -->
                 <input type="text" name="subType.subtypename" value="${prod.subType.subtypename}" readonly="readonly"/>    
                </td>
            </tr>
            <tr>
                <td>品牌</td>
                <td>
                <input type="text" name="product.brand" value="${prod.brand}" readonly="readonly"/>   
                </td>
            </tr>
            <tr>
                <td>商品名</td>
                <td>
                <input type="text" name="product.productname" value="${prod.productname}"/>   
                </td>
            </tr>
             <tr>
                <td>商品介绍</td>
                <td><textarea  name="product.introduce" cols="20" rows="5">${prod.introduce}</textarea></td>
            </tr>
             <tr>
                <td>商品价格</td>
                <td><input type="text" name="product.price" value="${prod.price}"/></td>
            </tr>
             <tr>
                <td>商品现价</td>
                <td><input type="text" name="product.nowprice" value="${prod.nowprice}"/></td>
            </tr>
            <tr>
                <td>商品图片</td>
                <td>
                	<img src="${pageScope.realpath }${prod.picture}" width="50" height="50"/>
                	<a class="btn_addPic" href="javascript:void(0);"><span><em>+</em>修改图片</span>
                    <input class="filePrew" type="file" name="upload"  onChange="if(this.value)insertTitle(this.value);">
                    <input name="product.picture" type="hidden" value="${prod.picture}">
                    </a>
                     <label id="filename"></label>
                </td>
            </tr>
            <tr>
                <td>上架时间</td>
                <td><input type="text" name="product.intime" value="${prod.intime}" onclick="laydate()"/></td>
            </tr>
            <tr>
                <td>是否新品</td>
                <c:if test="${prod.isnew == 1}">
                <td>
                	<input name="product.isnew" type="radio" value="1" checked="checked">是
					<input name="product.isnew" type="radio" value="0">否
				</td>
				</c:if>
				<c:if test="${prod.isnew == 0}">
                <td>
                	<input name="product.isnew" type="radio" value="1">是
					<input name="product.isnew" type="radio" value="0" checked="checked">否
				</td>
				</c:if>
				<c:if test="${empty prod.isnew}">
                <td>
                	<input name="product.isnew" type="radio" value="1">是
					<input name="product.isnew" type="radio" value="0">否
				</td>
				</c:if>
            </tr>
            <tr>
                <td>是否特价</td>
                <c:if test="${prod.issale == 1}">
                <td><input name="product.issale" type="radio" value="1" checked="checked">是
					<input name="product.issale" type="radio" value="0">否
				</td>
				</c:if>
				<c:if test="${prod.issale == 0}">
                <td><input name="product.issale" type="radio" value="1">是
					<input name="product.issale" type="radio" value="0" checked="checked">否
				</td>
				</c:if>
				<c:if test="${empty prod.issale}">
                <td><input name="product.issale" type="radio" value="1">是
					<input name="product.issale" type="radio" value="0">否
				</td>
				</c:if>
            </tr>
            <tr>
                <td>是否热销</td>
                <c:if test="${prod.ishost == 1}">
                <td>
                	<input name="product.ishost" type="radio" value="1" checked="checked">是
					<input name="product.ishost" type="radio" value="0">否
				</td>
				</c:if>
				<c:if test="${prod.ishost == 0}">
                <td>
                	<input name="product.ishost" type="radio" value="1">是
					<input name="product.ishost" type="radio" value="0" checked="checked">否
				</td>
				</c:if>
				<c:if test="${empty prod.ishost}">
                <td>
                	<input name="product.ishost" type="radio" value="1">是
					<input name="product.ishost" type="radio" value="0">否
				</td>
				</c:if>
            </tr>
            <tr>
                <td>是否特别推荐</td>
                <c:if test="${prod.isspecial == 1}">
                <td>
                	<input name="product.isspecial" type="radio" value="1" checked="checked">是
					<input name="product.isspecial" type="radio" value="0">否
				</td>
				</c:if>
				<c:if test="${prod.isspecial == 0}">
                <td>
                	<input name="product.isspecial" type="radio" value="1">是
					<input name="product.isspecial" type="radio" value="0" checked="checked">否
				</td>
				</c:if>
				<c:if test="${empty prod.isspecial }">
                <td>
                	<input name="product.isspecial" type="radio" value="1">是
					<input name="product.isspecial" type="radio" value="0">否
				</td>
				</c:if>
            </tr>
            <tr>
                <td>商品数量</td>
                <td><input type="text" name="product.productnum" value="${prod.productnum}" /></td>
            </tr>
            <tr>
                <td>商品来源</td>
                <td><input type="text" name="product.origin" value="${prod.origin}" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" style="width:90px;height:30px;color:#79A2BD;font-size:16px;margin-bottom:30px;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

