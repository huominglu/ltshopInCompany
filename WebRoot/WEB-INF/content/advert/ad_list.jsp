<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
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
function submit(){
	form1.submit();
}
</script>  
<script type="text/javascript">
	$().ready(function(){
		var adtype = '${requestScope.adtype}';
		if(adtype == "1"){
			$("#tj").attr("selected","selected");
		}else if(adtype == "2"){
			$("#cx").attr("selected","selected");
		}else{
			$("#all").attr("selected","selected");
		}
		
	});
</script>
</head>

<body>
<div id="container">
	<h2>�����Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="ad_list" method="post">
	        	<div id="word">��ѡ��</div>
	            <div id="main1">           
	                 <select name="advert.adType.id" id="language" onchange="submit()">
	                            <option id="all" value="3">ȫ�����</option>
	                            <option id="tj" value="1" >��Ʒ�Ƽ�</option>
	                            <option id="cx" value="2" >��Ʒ����</option>
	                 </select>            
	            </div>
	            <div id="main2"><input type="text" name="advert.description"/></div>
	            <div id="word"><a onclick="submit()" style="cursor:pointer;">��ѯ</a></div>
	            <div id="word"><a style="cursor:pointer;">����ɾ��</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0" style="margin-bottom: 100px;">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>���ID</th>
                    <th>�������</th>
                    <th>���ͼƬ</th>
                    <th>�������</th>
                    <th>��ʼʱ��</th>
                    <th>��ֹʱ��</th>
                    <th>����</th>
                </tr>
                <c:if test="${fn:length(pm.datas)>0 }">
	            	<c:forEach items="${requestScope.pm.datas }" var="ad">
		                <tr>
		                	<td><input type="checkbox" name="groupCheckbox"/></td>
		                    <td>${ad.id }</td>
		                    <td>${ad.adType.adtypename }</td>
		                    <td width="300"><img src="${pageScope.realpath }${ad.picture}" width="100%" height="150"></td>
		                    <td>${ad.description }</td>
		                    <td>${ad.begintime }</td>
		                    <td>${ad.endtime }</td>
		                    <td>
		                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
		                    	<a href="ad_delete?id=${ad.id }">ɾ��</a>&nbsp&nbsp&nbsp<a href="ad_premodify?id=${ad.id }">�޸�</a>
		                    </c:if>
		                    </td>
		                </tr>			
                	</c:forEach>
                </c:if>																		
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="ad_list.action" export="currentPageNumber=pageNumber">
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
