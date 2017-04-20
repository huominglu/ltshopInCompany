<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ҹ���</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<link type="text/css" rel="stylesheet" href="resources/css/userdet.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<!-- ��ѡ���ȫѡ��ȫ��ѡ -->
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
//����ɾ��
function delSelectUser(){
	var checklist = document.getElementsByName("groupCheckbox");
	var ids = "";
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	if (ids != "") {
		window.location="delSelectUser?ids="+ids;
	}
}

function detail(id,username,password,email,realname,gender,birthday,address,postcode,phone,mobil,score){
	document.getElementById('light').style.display='block';
	document.getElementById('fade').style.display='block';
	document.getElementById("userid").value=id;
	document.getElementById("username").value=username;
	document.getElementById("password").value=password;
	document.getElementById("email").value=email;
	document.getElementById("realname").value=realname;
	var sex = gender;
	if(sex == '0'){
		sex = "��";
	}else if(sex == '0'){
		sex = "Ů";
	}else{
		sex = "δ֪";
	}
	document.getElementById("gender").value=sex;
	document.getElementById("birthday").value=birthday;
	document.getElementById("address").value=address;
	document.getElementById("postcode").value=postcode;
	document.getElementById("phone").value=phone;
	document.getElementById("mobil").value=mobil;
	document.getElementById("score").value=score;
}
    function submit(){
    	form1.submit();
    }

</script>  
<script type="text/javascript">
$().ready(function(){
	$("#chaxun").focus(function(){
		$("#chaxun").val("");
	});
});
</script>
</head>

<body>
<div id="container">
	<h2>�����Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="user_list" method="post">
	        	<div id="word">�û���ѯ</div>
	            <div id="main2"><input id="chaxun" type="text" name="user.username" value="�������û�����ѯ"/></div>
	            <div id="word"><a onclick="submit()" style="cursor:pointer">��ѯ</a></div>
	            <div id="word"><a style="cursor: pointer;" onclick="delSelectUser()">����ɾ��</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>���ID</th>
                    <th>�û���</th>
                    <th>��ʵ����</th>
                    <th>����</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ǰ״̬</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
                	<c:forEach items="${requestScope.pm.datas }" var="user">
		                <tr>
		                	<td><input type="checkbox" name="groupCheckbox" value="${user.id }"/></td>
		                    <td>${user.id }</td>
		                    <td>${user.username }</td>
		                    <td>${user.realname }</td>
		                    <td>${user.score }</td>
		                    <td>
		                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
		                    	<a href="userDelete?id=${user.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
		                    </c:if>
		                    <a  class="detail" href = "javascript:void(0)"
		                     onclick = "detail('${user.id}','${user.username }','${user.password }','${user.email }','${user.realname }','${user.gender}','${user.birthday }','${user.address }','${user.postcode }','${user.phone }','${user.mobil }','${user.score }')">����</a>
		                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
		                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  href="userStatusModify?id=${user.id}">${user.status }</a>
		                    </c:if>
		                    </td>
		                </tr>
	                </c:forEach>
                </c:if>			
                																				
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="user_list.action" export="currentPageNumber=pageNumber">
                <pg:first>
                    <a href="${pageUrl}">��ҳ</a>
                </pg:first>
                <pg:prev>
                    <a href="${pageUrl}">ǰҳ</a>
                </pg:prev>
                <pg:pages>
                    <c:choose>
                        <c:when test="${ currentPageNumber eq pageNumber}">
                            <font>${pageNumber}</font>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl }">${pageNumber }</a>
                        </c:otherwise>
                    </c:choose>
                </pg:pages>
                <pg:next>
                    <a href="${pageUrl }">��ҳ</a>
                </pg:next>
                <pg:last>
                    <a href="${pageUrl }">βҳ</a>
                </pg:last>
            </pg:pager>
    	</div>
    </div>
</div>
<!-- ������� -->
<div id="light" class="white_content" align="center">
    <table cellspacing="0" cellpadding="0">
        <tr>
        	<td>��ұ��</td><td><input type="text" id="userid" name="id" value="" readonly="readonly"/></td>
            <td>����û���</td><td><input type="text" id="username" name="username" readonly="readonly" /></td>
        </tr>
        <tr>
        	<td>����</td><td><input type="password" id="password" name="password" readonly="readonly" /></td>
            <td>����</td><td><input type="text" id="email" name="email" readonly="readonly" /></td>
        </tr>
        <tr>
        	<td>��ʵ����</td><td><input type="text" id="realname" name="realname" readonly="readonly" /></td>
            <td>�Ա�</td><td><input type="text" id="gender" name="gender" readonly="readonly" /></td>
        </tr>
        <tr>
        	<td>����</td><td><input type="text" id="birthday" name="birthday" readonly="readonly" /></td>
            <td>��ַ</td><td><input type="text" id="address" name="address" readonly="readonly" /></td>
        </tr>
        <tr>
        	<td>�ʱ�</td><td><input type="text" id="postcode" name="postcode" readonly="readonly" /></td>
            <td>�̶��绰</td><td><input type="text" id="phone" name="phone" readonly="readonly" /></td>
        </tr>
        <tr>
        	<td>�ƶ��绰</td><td><input type="text" id="mobil" name="mobil" readonly="readonly" /></td>
            <td>����</td><td><input type="text" id="score" name="score" readonly="readonly" /></td>
        </tr>
    </table>
    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';
    document.getElementById('fade').style.display='none'">����</a>
</div> 
<div id="fade" class="black_overlay">
</div> 
</body>
</html>
