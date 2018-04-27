<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="jsp/Service_Center/css/view.css">
<body>
<jsp:include page="../../Header_tab1.jsp"></jsp:include>
	<div class="body">
	<jsp:include page="../Service_Center_Side.jsp"></jsp:include>
	<div class="section">
	<p id="subject">�̺�Ʈ�Խ���</p>
	<p id="subject_sub">�������� �̺�Ʈ�� �����غ�����!</p>
	<hr>
	<dl>
	<dt>����</dt><dd>${Event.EVT_TITLE}</dd>
	<dt>��ȸ��</dt><dd>${Event.EVT_VIEW}</dd>
	<dt>�ۼ���</dt><dd><fmt:formatDate value="${Event.EVT_CREATE_DATE}" pattern="yyyy-MM-dd"/></dd>
	<dt>����</dt><dd>${Event.EVT_CONTENT}</dd>
	<dd><img alt="" src="eventdownload.do?num=${Event.EVT_NO}"></dd>
	</dl>
<%
boolean admin=false;
if(request.getAttribute("admin").equals('Y')){admin=true;} %>

<%if(admin){ %>
<button onclick="location.href='event_updateForm.do?EVT_NO=${Event.EVT_NO}'">����</button>
<button onclick="location.href='event_delete.do?EVT_NO=${Event.EVT_NO}'">����</button>
<%}%>
<input type="button" class="button" value="�ڷΰ���" onclick="javascript:history.back()" style="margin-left:50px">
<button onclick="location.href='event_main.do'">�̺�Ʈ�Խù�</button>
</div>
	</div>
</body>
</html>