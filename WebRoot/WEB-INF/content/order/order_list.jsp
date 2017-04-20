<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>��������</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
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
function submit(){
	var info = document.getElementById("selectdetail").value;
	if(info != null){
		form1.submit();
	}else{
		var info1 = document.getElementById("info").value;
		if(info1 == 1||info == 2||info == 3||info == 4){
		form1.submit();
		}
		document.getElementById(font1).innerHTML="�������ѯ���ݣ�";
	}
}
</script>  

</head>

<body>
<div id="container">
	<h2>������Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="selectorder" method="post">
	        	<div id="word">��ѡ��</div>
	            <div id="main1">           
                <select name="info" id="language">
                            <option value="id"  selected="selected">�������</option>
                            <option value="username" >�û���</option>
                            <option value="realname" >��ʵ����</option>
                            <option value="1">δ����</option>
                            <option value="2" >�ѷ���</option>
                            <option value="3" >���ջ���δ���ۣ�</option>
                            <option value="4" >����ɣ������ۣ�</option>
                 </select>            
	             </div>
	             <div id="main2"><input type="text" name="selectdetail"/></div>
	             <div id="word">
		             <font id="font1" color="red"></font><input type="submit" value="��ѯ" />
		             <a href="printOrder?datas=${pm.datas }&docType=doc">&nbsp;&nbsp;��ӡ����</a>
	             </div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>����ID</th>
                    <th>�û���¼��</th>
                    <th>�û���ʵ����</th>
                    <th>�û���ַ</th>
                    <th>�û��ʱ�</th>
                    <th>�û��ƶ��绰</th>
                    <th>��������</th>
                    <th>����״̬</th>
                    <th>����</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
		                <c:forEach items="${pm.datas }" var="order">
			                <tr>
			                	<td><input type="checkbox" name="groupCheckbox" /></td>
			                    <td>${order.id}</td>
			                    <td>${order.username }</td>
			                    <td>${order.realname }</td>
			                    <td>${order.address }</td>
			                    <td>${order.postcode }</td>
			                    <td>${order.mobil }</td>
			                    <td>${order.orderdate }</td>
			                    <td>${order.orderStaus.orderStatusName }</td>
			                    <td><a href="ordetail?order.id=${order.id }">����</a>&nbsp;&nbsp;
			                    	<a href="tosendgoods?order.id=${order.id }">����</a>&nbsp;&nbsp;
			                    	<a href="delorder?order.id=${order.id }">ɾ��</a>&nbsp;&nbsp;
			                    	<a href="getorderbyid?order.id=${order.id }">�޸�</a>	
			                    </td>
			                </tr>
		                </c:forEach>
                </c:if>																				
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="listorder.action" export="currentPageNumber=pageNumber">
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
</body>
</html>
