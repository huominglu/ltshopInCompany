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
<title>��̨ҳ��</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/main.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/menu.js"></script>
<script type="text/javascript" src="resources/js/time.js"></script>
<!-- �˳���¼ -->
<script language="javascript" type="text/javascript">
    function logout(){
		if (confirm("��ȷ��Ҫ�˳���¼��")){
            form1.submit();
		}
    }
</script>
</head>

<body onload="startTime()">
<div class="top"></div>
<div id="header">
	<div class="logo">�����̳ǹ���ƽ̨</div>
	<div class="navigation">
		<ul>
		 	<li>��ӭ����</li>
			<li>${sessionScope.admin.role.rolename} ${sessionScope.admin.name }</li>
			<li><form name="form1" action="logout" method="post"><label id="submit" onclick="logout()">�˳�</label></form></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>�û�����</h4>
          <div class="list-item none">
            <a href="listadmin" target="show">�鿴�û�</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="loadaddadmin" target="show">����û�</a>
            </c:if>
          </div>
        </li>
        <li>
          <h4 class="M7"><span></span>��ҹ���</h4>
          <div class="list-item none">
            <a href="user_list" target="show">�鿴���</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>��Ʒ����</h4>
          <div class="list-item none">
            <a href="prodpagemodel" target="show">�鿴��Ʒ</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="loadaddprod" target="show">�����Ʒ</a>
            </c:if>
            <a href="pagemodel" target="show">�鿴����</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="loadaddsupertypepage" target="show">��Ӵ���</a>
            </c:if>
            <a href="subpagemodel" target="show">�鿴С��</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="loadaddsubtpage" target="show">���С��</a> 
            </c:if>
            <%-- <a href="attrpagemodel" target="show">�鿴����</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">  
            	<a href="loadattradd" target="show">�������</a> 
            </c:if> --%>        
           </div>
        </li>
        <li>
          <h4 class="M6"><span></span>�������</h4>
          <div class="list-item none">
            <a href="notice_list" target="show">�鿴����</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="noticeAdd" target="show">��ӹ���</a> 
            </c:if>       
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>��������</h4>
          <div class="list-item none">
            <a href="listorder" target="show">�鿴����</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>������</h4>
          <div class="list-item none">
            <a href="ad_list" target="show">�鿴���</a>
            <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
            	<a href="ad_preadd" target="show">��ӹ��</a>
            </c:if>
          </div>
        </li>
		<li>
          <h4 class="M5"><span></span>���۹���</h4>
          <div class="list-item none">
            <a href="commentList" target="show">�鿴����</a>
          </div>
        </li>
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img style="padding-bottom: 15px;" src="resources/img/home.png"></li>
								<li style="margin-left:25px;"><a href="load">��ҳ</a></li>
                                <li><a onclick="javascript:history.go(-1);"> ���� </a></li>
                                <li><a onclick="javascript:history.go(1);"> ǰ�� </a></li>
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
<div id="footer"><p>Copyright  2017 ��Ȩ���� </p></div>
<script>navList(12);</script>
</body>
</html>
