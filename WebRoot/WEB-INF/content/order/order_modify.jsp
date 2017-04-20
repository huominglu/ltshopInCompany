<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<title>更改订单</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript" src="js/select.js"></script>
<script type="text/javascript">		
		$(document).ready(function(){
				$.ajax({
					type: 'post',
					url: 'getallorderstatus',
					success: function(result){
						var jsonobj = JSON.parse(result);
						$.each(jsonobj,function(i,value){
							var opo = "<option value="+value.id+">"+value.ordertypename+"</option>" 
				    		$("#orderstatus").append(opo);
						});
					}}
				);
		});
 </script>
</head>

<body>
<div id="container">
	<h2>更改订单</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifyorder" method="post">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>订单编号</td>
                <td><input type="text" readonly="readonly" name="order.id" value="${requestScope.order.id }"/></td>
            </tr>
             <tr>
                <td>买家登陆名</td>
                <td><input type="text" name="order.username" value="${requestScope.order.username }"/></td>
            </tr>
             <tr>
                <td>买家真实姓名</td>
                <td><input type="text" name="order.realname" value="${requestScope.order.realname }"/></td>
            </tr>
             <tr>
                <td>地址</td>
                <td><input type="text" name="order.address" value="${requestScope.order.address }"/></td>
            </tr>
             <tr>
                <td>邮编</td>
                <td><input type="text" name="order.postcode" value="${requestScope.order.postcode }"/></td>
            </tr>
             <tr>
                <td>移动电话</td>
                <td><input type="text" name="order.mobil" value="${requestScope.order.mobil }"/></td>
            </tr>
             <tr>
                <td>订单日期</td>
                <td><input type="text" name="order.orderdate" value="${requestScope.order.orderdate }"/></td>
            </tr>
            <tr>
                <td>订单状态</td>
                <td>
                <select name="order.orderStaus.id" id="orderstatus">
                            <option value="1">未发货</option>
                            <option value="2" >已发货</option>
                            <option value="3" >已收货（未评论）</option>
                            <option value="4" >已完成（已评论）</option>
                 </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
				<!-- <label id="submit" style="width:90px;height:30px;color:#79A2BD;font-size:16px;cursor: pointer;padding-top: 0;
                border: 3px solid #e0e0e0;border-radius: 20px;padding: 5px;padding-bottom:5px;padding-left:20px;padding-right:20px;
                 background:#EBEBEB">修改</label> -->
                 <input type="submit" value="修改">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
