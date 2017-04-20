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
<title>��Ʒ����</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- ����js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript">
function insertTitle(tValue){  
   var t1 = tValue.lastIndexOf("\\");  
   var t2 = tValue.lastIndexOf(".");  
   if(t1 >= 0 && t1 < t2 && t1 < tValue.length){  
    document.getElementById("filename").innerHTML = tValue.substring(t1 + 1, t2);  
   }  
}  

$(function(){
		var supertypeid = "${prod.superType.id}";
		$.ajax({
			type:"post",
			url:"getsupertypebybrand",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "";
					if (supertypeid == value.id) {
						opo = "<option selected="+"'selected'"+"value='"+value.id+"'>"+value.superTypeName+"</option>";
					}else{
						opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					}
					
					$("#superType").append(opo);
			});
			}
		});
});

$(function(){
		var subtypeid = "${prod.subType.id}";
		var superTypeid = $("#superType").val();
		$.ajax({
			type:"post",
			url:"getsubtypebybrand?superType.id="+superTypeid,
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#subType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "";
					if (subtypeid == value.id) {
						opo = "<option selected="+"'selected'"+"value='"+value.id+"'>"+value.subtypename+"</option>";
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
	<h2>��Ʒ����</h2>
    <div id="uboxstyle" align="center">	
        <form action="prodpagemodel" method="post">
            <table cellspacing="0" cellpadding="0" style="margin-bottom: 100px;">
            <tr>
                <td>��ƷID</td>
                <td><input type="text" name="productId" value="${prod.id}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>��Ʒ����</td>
                <td>
                <!-- <select name="superType" id="superType" readonly="readonly" onchange="getSubType()" onclick="getSubType()">
                           <option selected="selected"> 
                 </select> -->
                 ${prod.superType.superTypeName}     
                </td>
            </tr>
            <tr>
                <td>��ƷС��</td>
                <td>
                <!-- <select name="language2" id="subType" readonly="readonly">
                     
                 </select> -->
                 ${prod.subType.subtypename}     
                </td>
            </tr>
            <tr>
                <td>Ʒ��</td>
                <td>
                <input type="text" id="brand" value="${prod.brand}" readonly="readonly"/>     
                </td>
            </tr>
            <tr>
                <td>��Ʒ��</td>
                <td>
                <input type="text" name="productName" value="${prod.productname}" readonly="readonly"/>   
                </td>
            </tr>
             <tr>
                <td>��Ʒ����</td>
                <td><textarea name="introduce" cols="20" rows="5"  readonly="readonly">${prod.introduce}</textarea></td>
            </tr>
             <tr>
                <td>��Ʒ�۸�</td>
                <td><input type="text" name="price" value="${prod.price}"  readonly="readonly"/></td>
            </tr>
             <tr>
                <td>��Ʒ�ּ�</td>
                <td><input type="text" name="nowPrice" value="${prod.nowprice}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>��ƷͼƬ</td>
                <td>
                	<img src="${pageScope.realpath }${prod.picture}" width="50" height="50">
                </td>
            </tr>
            <tr>
                <td>�ϼ�ʱ��</td>
                <td><input type="text" name="intime" value="${prod.intime}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>�Ƿ���Ʒ</td>
                <c:if test="${prod.isnew == 1}">
                <td>��</td>
				</c:if>
				<c:if test="${prod.isnew == 0}">
                <td>��</td>
				</c:if>
				<c:if test="${empty prod.isnew}">
                <td>δ֪</td>
				</c:if>
            </tr>
            <tr>
                <td>�Ƿ��ؼ�</td>
                <c:if test="${prod.issale == 1}">
                <td>��</td>
				</c:if>
				<c:if test="${prod.issale == 0}">
                <td>��</td>
				</c:if>
				<c:if test="${empty prod.issale}">
                <td>δ֪</td>
				</c:if>
            </tr>
            <tr>
                <td>�Ƿ�����</td>
                <c:if test="${prod.ishost == 1}">
                <td>��</td>
				</c:if>
				<c:if test="${prod.ishost == 0}">
                <td>��</td>
				</c:if>
				<c:if test="${empty prod.ishost}">
                <td>δ֪</td>
				</c:if>
            </tr>
            <tr>
                <td>�Ƿ��ر��Ƽ�</td>
                <c:if test="${prod.isspecial == 1}">
                <td>��</td>
				</c:if>
				<c:if test="${prod.isspecial == 0}">
                <td>��</td>
				</c:if>
				<c:if test="${empty prod.isspecial}">
                <td>δ֪</td>
				</c:if>
            </tr>
            <tr>
                <td>��Ʒ����</td>
                <td><input type="text" name="productNum" value="${prod.productnum}"  readonly="readonly"/></td>
            </tr>
            <tr>
                <td>��Ʒ��Դ</td>
                <td><input type="text" name="origin" value="${prod.origin}"  readonly="readonly"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="����" style="width:90px;height:30px;color:#79A2BD;font-size:16px;padding-top: 0;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

