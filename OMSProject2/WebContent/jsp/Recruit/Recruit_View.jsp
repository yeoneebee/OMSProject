<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	readlist(1);
	minecheck();
});
function sysout(V){
	var tost="";
	for(var a in V){
		tost+=a;
	}
	return 
}

function minecheck(){
	var sessionId = "<%= (String)session.getAttribute("id")%>";
	var writer =$("#writer").text();
	if(sessionId==writer){
		$(".mine").css({"visibility":"visible","display":"block"});
		console.log('보여');;
	}else{
		$(".mine").css({"visibility":"hidden","display":"none"});
		console.log('사라져');;
	}
}

function dorefrence(id,REC_APPLY_NO,page){
	var rec_no = $('#rec_no').val();
	$.ajax({
		type:'get',
		url:'doRefrence.do',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		data:page="REC_APPLY_NO="+REC_APPLY_NO+"&REC_NO="+rec_no+"&M_ID="+id+"&page="+page,
		success:function(data){
			var datas= JSON.parse(data);
			console.log(datas.result);
			readlist(datas.page[0]);
		}
	
	
});
}


function readlist(page){
	var rec_no = $('#rec_no').val();

	$.ajax({
		type:'get',
		url:'getRefrenceList.do',
		dataType:'text',
		data:page="page="+page+"&REC_NO="+rec_no,
		
		success:function(data){
			var datas= JSON.parse(data);
			var result = datas.result[0];
			
			console.log(datas.result[0]);
			console.log(datas.result[0]["RefrenceList"])
			var refrenceList=datas.result[0]["RefrenceList"];
			
		   	$("#list").empty();
		   	$("#pages").empty();
		   	
			if(refrenceList.length== 0){
	       		$("#list").append("<td colspan=4 style='padding:30px;'>데이터가 없습니다.</td>");
			}else{ 
				$("#list").append("<tr><th>번호</th><th>이름</th><th>확정여부</th></tr>");
				
	          for(var i =0; i<refrenceList.length; i++){
	        		  msg='확정취소';
	        	  	  confirm="대기중";
	        	  if(refrenceList[i].REC_APPLY_CONFIRM=='Y'){
	        	  var msg='확정';
	        	  var confirm="확정";
	        	  }
	        	  $("#list").append("<tr>"
	        			  +"<td>"+refrenceList[i].RN+"</td>"
	        			  +"<td>"+refrenceList[i].M_ID+"</td>"
	        			  +"<td>"+confirm+"</td>"
	        			  +"<td><button class='mine' onclick=\"dorefrence('"+refrenceList[i].M_ID+"',"+refrenceList[i].REC_APPLY_NO+","+result.page+")\">"+msg+"</button>"+"</td>"
	        			  +"</tr>");       	  
	          }
	        $('#page').val(result.page);
	          	var begin=result.START;
	          	var current= result.current;
	          	console.log('current:'+current)
				if(result.END<result.END)
					var end=result.END;
				else
					var end=result.LAST;
				var str='';
				for(var i=begin;i<=end;i++){
					if(i==current){
						str=">"+i;
					}else
						str="  onclick='readlist("+i+")'>"+i;
					$('#pages').append("<td"+str+"</td>");
				}
				
	          
	      };
				minecheck();
		}
		
	});
}

</script>
<link rel="stylesheet" href="jsp/Recruit/css/view.css">
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../Header_tab1.jsp"></jsp:include>
<%boolean mine=(boolean)request.getAttribute("ismine"); %>
<div class="body">
<jsp:include page="../sidevar_1.jsp"/>
<div class="section"> 

<p id="title">모집합니다</p>
<p id="title_sub">모집하는 여행에 동참해보세요!</p>
<hr>
<input type="text" style="display: none;" value="${page}" id="page" readonly="readonly">
<input type="text" style="display: none;" value="${rec.REC_NO}" id="rec_no">
<dl>
<dt>제목</dt>
<dd>${rec.REC_TITLE}</dd>
<dt>작성날짜</dt>
<dd><fmt:formatDate value="${rec.REC_CREATE_DATE}" pattern="yyyy-MM-dd"/></dd>
<dt>작성자</dt>
<dd id="writer">${rec.m_ID}</dd>
<dt>인원수</dt>
<dd>${rec.REC_MEMBER_COUNT}</dd>
<dt>조회수</dt>
<dd>${rec.REC_VIEWS}</dd>
<dt>원하는 성별</dt>
<dd>${rec.REC_GENDER}</dd>
<dt>파일다운로드</dt>
<dd>
<c:choose>
<c:when test="${rec.REC_FILE!=null}">
<a href="recruitdownload.do?num=${rec.REC_NO}">
${rec.REC_FILE}
</a>
</c:when>
<c:otherwise>
파일없음
</c:otherwise>
</c:choose>
</dd>
<dt>내용</dt>
<dd><img alt="이미지없음" src="recruitdownload.do?num=${rec.REC_NO}">${rec.REC_CONTENT}</dd>
<dt>신청자 목록</dt>
<dd>
<table>
	<tr id="list">
	</tr>
	<td colspan="4">
	
		<table style="margin:0 auto">
			<tr id="pages"></tr>
		</table>
	
		</td>
</table>
</dd>
</dl>


<input type="button" class="button" value="뒤로가기" onclick="javascript:history.back()" style="margin-left:50px">
<%if(mine){%>
<span id="list1"></span>
<%}else{ %>
<span id="list1"></span>
<input  type="button" value="신청하기" onclick="location.href='recruit_refrence.do?REC_NO=${rec.REC_NO}'">
<%} %>
<%if(mine){ %>
<input type="button" value="수정" onclick="location.href='recruit_updateForm.do?num=${rec.REC_NO}'">
<input type="button" value="삭제" onclick="location.href='recruit_delete.do?REC_NO=${rec.REC_NO}'">
<%} %>
<input type="button" value="전체목록" onclick="location.href='recruit_main.do'"> 
</div>
</div>
</body>
</html>