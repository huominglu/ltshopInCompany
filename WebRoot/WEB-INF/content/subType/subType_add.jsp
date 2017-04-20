<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>��Ʒ����</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- ����js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript">
$(function(){
		$.ajax({
			type:"post",
			url:"getsupertypes",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					$("#superType").append(opo);
			});
			}
		});
	}); 
	
	$(function(){
	$("#subtypename").blur(function(){
		var subtname = $("#subtypename").val();
		$.ajax({
			type:"post",
			url:"checksubtypename?subType.subtypename="+subtname,
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				if (subtname == "") {
					jsonobj.retjson = "��������ƷС�����ƣ�";
				}
				$("#sbtnameinfo").html(jsonobj.retjson);
				if (jsonobj.retjson != "") {
					
					$("#mysbtadd").submit(function(){
						return false;
					});	
				}else{
					
					$("#mysbtadd").submit(function(){
						return true;
					});
				}
			}
		});
	});
});
</script>
</head>

<body>
<div id="container">
	<h2>С�����</h2>
    <div id="uboxstyle" align="center">	
        <form action="addsubtype" method="post" id="mysbtadd">
            <table cellspacing="0" cellpadding="0">
            
            <tr>
                <td>��Ʒ����</td>
                <td>
                <select name="superType.id" id="superType">
                            
                 </select>     
                </td>
            </tr>
             <tr>
                <td>��ƷС����</td>
                <td><input type="text" name="subType.subtypename" id="subtypename"/>
                <label id="sbtnameinfo" style="color:red"></label></td>
            </tr>
             <!-- <tr>
                <td>��Ʒ����</td>
                <td>
                <select name="attr" id="attr">
                            <option value="id"  selected="selected">��Ʒ����1</option>
                            <option value="name" >��Ʒ����2</option>
                 </select>     
                </td>
            </tr> -->
            <tr>
                <td></td>
                <td>
                <input type="submit" value="���" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
