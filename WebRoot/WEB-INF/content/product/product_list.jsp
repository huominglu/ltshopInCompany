<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=18030">
<title>��Ʒ��Ʒ</title>
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
//����ɾ��
function delSelectProduct(){
	var checklist = document.getElementsByName("groupCheckbox");
	var ids = "";
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	if (ids != "") {
		window.location="delSelectProduct?ids="+ids;
	}
}
</script>  

</head>

<body>
<div id="container">
	<h2>��Ʒ��Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">��ѡ��</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">��Ʒ���</option>
                            <option value="name" >��Ʒ��</option>
                            <option value="rolename" >��Ʒ1</option>
                            <option value="rolename" >��Ʒ2</option>
                            <option value="rolename" >��Ʒ3</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><a >��ѯ</a></div>
            <div id="word"><a style="cursor: pointer;" onclick="delSelectProduct()">����ɾ��</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>��ƷID</th>
                    <th>��Ʒ��</th>
                    <th>ͼƬ</th>
                    <th>��Ʒ����</th>
                    <th>�۸�</th>
                    <th>�ּ�</th>                    
                    <th>�ϼ�ʱ��</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${pm.datas}" var="prod">
                <tr>
                	<td><input type="checkbox" name="groupCheckbox" value="${prod.id}"/></td>
                    <td>${prod.id}</td>
                    <td>${prod.productname}</td>
                    <td width="100"><img src="${pageScope.realpath }${prod.picture}" width="100%" height="100"></td>
                    <td title="��Ʒ��������">${prod.introduce}</td>
                    <td>${prod.price}</td>
                    <td>${prod.nowprice}</td>
                    <td>${prod.intime}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
                    	<a href="delproduct?product.id=${prod.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
                    	<a href="getprodbyid?product.id=${prod.id}">�޸�</a>&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <a href="detailsproduct?product.id=${prod.id}">����</a>
                    </td>
                </tr>
                </c:forEach>			
          </c:if>      																					
        </table>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="prodpagemodel.action" export="currentPageNumber=pageNumber">
                <pg:first>
                    <a href="">��ҳ</a>
                </pg:first>
                <pg:prev>
                    <a href="">ǰҳ</a>
                </pg:prev>
                <pg:pages>
                    <c:choose>
                        <c:when test="${ currentPageNumber eq pageNumber}">
                            <font>1</font>
                        </c:when>
                        <c:otherwise>
                            <a href="">2</a>
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
            ת��
            <input type="text" size="1"/>
            ҳ 
            <a href="">��ת</a>
    	</div>
    </div>
</div>
</body>
</html>


