<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>�û�����</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- ����js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<!-- json������� -->
	<script type="text/javascript">
	     $(document).ready(function(){
	     	$("#name").blur(function(){
	     		var an = $("#name").val();
				$.ajax({
					type: "post",
					url: "checkadminname?admin.name="+an,
					dataType:"json",
					success: function(result){
						var jsonobj = JSON.parse(result);
						var info = jsonobj.info;
						if(info == "�ý�ɫ���ƿ���ʹ��"){
							$("#info").html("<font color='green'>"+jsonobj.info+"</font>");
						}else{
							$("#name").val("");
							$("#info").html("<font color='red'>"+jsonobj.info+"</font>");
						}
										    	
					}}
				);
			});
			
		});
 </script>
<script type="text/javascript">		
		$(document).ready(function(){
				$.ajax({
					type: 'post',
					url: 'getallrole',
					success: function(result){
						var jsonobj = JSON.parse(result);
						$.each(jsonobj,function(i,value){
							var opo = "<option value="+value.id+">"+value.rolename+"</option>" 
				    		$("#language").append(opo);
						});
					}}
				);
			$("#submit").click(function(){
				var name = $("#name").val();
				var password = $("#password").val();
				if(name!="" && password!=""){
					form1.submit();
				}
			});
		});
 </script>
 <script type="text/javascript">
 	function checkpwd(){
 		var password = document.getElementById("password").value;
 		var psw =  /[a-zA-Z0-9]{5,14}/;
		if(!psw.test(password)){
			document.getElementById("password").value="";
			document.getElementById("info1").innerHTML = "<font color='red'>��������ǳ���6��15���Һ��ַ�</font>";
			return false;
		}else{
			document.getElementById("info1").innerHTML = "<font color='green'>��������ͨ��</font>";			
		}		
 	}
 </script>
  </head>

<body>
<div id="container">
	<h2>�û����</h2>
    <div id="uboxstyle" align="center">	
        <form name="form1" action="addadmin" method="post">
            <table cellspacing="0" cellpadding="0">
             <tr>
                <td>�û���</td>
                <td><input type="text" name="admin.name" id="name"/><label id="info" ></label></td>
            </tr>
             <tr>
                <td>����</td>
                <td><input type="password" id="password" name="admin.password" onblur="checkpwd()" />
                	<label id="info1"></label>
                </td>
            </tr>
             <tr>
                <td>�û��ȼ�</td>
                <td>
                <select name="role.id" id="language">
                	
                </select>     
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <label id="submit" style="width:90px;height:30px;color:#79A2BD;font-size:16px;cursor: pointer;padding-top: 0;
                border: 3px solid #e0e0e0;border-radius: 20px;padding: 5px;padding-bottom:5px;padding-left:20px;padding-right:20px;
                 background:#EBEBEB">���</label>
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
