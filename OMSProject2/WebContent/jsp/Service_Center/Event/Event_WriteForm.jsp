<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="jsp/Recruit/css/writeForm.css">
</head>

<body>

<jsp:include page="../../Header_tab1.jsp"></jsp:include>
	<div class="body">
<jsp:include page="../Service_Center_Side.jsp"></jsp:include>

<div class="sc_board">
	<p id="subject">이벤트게시판</p>
	<p id="subject_sub">오마쏘에 이벤트작성 페이지</p>
	<hr>
<hr>
<div>
<form action="event_write.do" enctype="multipart/form-data" method="post">
<dl>
<dt>제목</dt><dd><input type="text" name="EVT_TITLE"></dd>
<dt>내용</dt><dd><input type="text" name="EVT_CONTENT"></dd>
<dt>첨부파일</dt><dd><input type="file" name="ufile"></dd>
</dl>
<input type="button" class="button" value="뒤로가기" onclick="javascript:history.back()" style="margin-left:50px">
<input type="submit" value="작성하기" style="margin-left:200px"> 
</form>
</div>
</div>
</div>

</body>
</html>