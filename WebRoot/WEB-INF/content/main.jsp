<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>后台页面</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/main.css" />
<!-- 导入js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
<script type="text/javascript" src="resources/js/time.js"></script>
<!-- 退出登录 -->
<script language="javascript" type="text/javascript">
    function logout(){
		if (confirm("您确定要退出登录吗？")){
            form1.submit();
		}
    }
</script>
</head>

<body onload="startTime()">
<div class="top"></div>
<div id="header">
	<div class="logo">龙腾商城管理平台</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li>${sessionScope.admin.role.rolename} ${sessionScope.admin.name }</li>
			<li><form name="form1" action="logout" method="post"><label id="submit" onclick="logout()">退出</label></form></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>用户管理</h4>
          <div class="list-item none">
            <a href="listadmin" target="show">查看用户</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="loadaddadmin" target="show">添加用户</a>
            </c:if>
          </div>
        </li>
        <li>
          <h4 class="M7"><span></span>买家管理</h4>
          <div class="list-item none">
            <a href="user_list" target="show">查看买家</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>商品管理</h4>
          <div class="list-item none">
            <a href="prodpagemodel" target="show">查看商品</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="loadaddprod" target="show">添加商品</a>
            </c:if>
            <a href="pagemodel" target="show">查看大类</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="loadaddsupertypepage" target="show">添加大类</a>
            </c:if>
            <a href="subpagemodel" target="show">查看小类</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="loadaddsubtpage" target="show">添加小类</a> 
            </c:if>
            <%-- <a href="attrpagemodel" target="show">查看属性</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">  
            	<a href="loadattradd" target="show">添加属性</a> 
            </c:if> --%>        
           </div>
        </li>
        <li>
          <h4 class="M6"><span></span>公告管理</h4>
          <div class="list-item none">
            <a href="notice_list" target="show">查看公告</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="noticeAdd" target="show">添加公告</a> 
            </c:if>       
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>订单管理</h4>
          <div class="list-item none">
            <a href="listorder" target="show">查看订单</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>广告管理</h4>
          <div class="list-item none">
            <a href="ad_list" target="show">查看广告</a>
            <c:if test="${sessionScope.admin.role.rolename == '超级管理员' }">
            	<a href="ad_preadd" target="show">添加广告</a>
            </c:if>
          </div>
        </li>
		<li>
          <h4 class="M5"><span></span>评论管理</h4>
          <div class="list-item none">
            <a href="commentList" target="show">查看评论</a>
          </div>
        </li>
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img style="padding-bottom: 15px;" src="resources/img/home.png"></li>
								<li style="margin-left:25px;"><a href="load">首页</a></li>
                                <li><a onclick="javascript:history.go(-1);"> 后退 </a></li>
                                <li><a onclick="javascript:history.go(1);"> 前进 </a></li>
								<li><span id="nowDateTimeSpan"></span></li>								
						</ul>
			</div>
			<div class="main">
<!-- 				<iframe id="show" name="show" runat="server" frameborder="0" width="1080" height="480" src="listadmin"></iframe> -->
					<iframe id="show" name="show" runat="server" frameborder="0" width="100%" height="100%" src="test.jsp"></iframe>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright  2017 版权所有 </p></div>
<script>navList(12);</script>
</body>
</html>
