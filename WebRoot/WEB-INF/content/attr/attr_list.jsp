<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/select.js"></script>
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
</script>  
</head>

<body>
<div id="container">
	<h2>������Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">��ѡ��</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">����</option>
                            <option value="name" >����1</option>
                            <option value="rolename" >����2</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><a href="">��ѯ</a></div>
            <div id="word"><a href="">ɾ��</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>����ID</th>
                    <th>��������</th>
                    <th>��������</th>
                    <th>����ֵ</th>
                    <th>С������</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${pm.datas}" var="attr">
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>${attr.id}</td>
                    <td>${attr.attrname}</td>
                    <td>
                    	<c:if test="${attr.attrnameid == 0}">
                    		�ֶ�����
                    	</c:if>
                    	<c:if test="${attr.attrnameid == 1}">
                    		���б���ѡȡ
                    	</c:if>
                    </td>
                    <td>${attr.attrvalue}</td>
                    <td>${attr.subType.subtypename}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
                    	<a href="delattrbyid?attr.id=${attr.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
                    	<a href="getoneattr?attr.id=${attr.id}">�޸�</a>
                    </c:if>
                    </td>
                </tr>
                </c:forEach>	
             </c:if>		
                <!-- <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>			
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>			
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr>	
                <tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td>Data</td>
                    <td><a href="">ɾ��</a>&nbsp&nbsp&nbsp<a href="">�޸�</a></td>
                </tr> -->																					
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="attrpagemodel.action" export="currentPageNumber=pageNumber">
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


