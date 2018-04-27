<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src="http://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="Js/jquery.timeago.js" type="text/javascript"></script>
<script src="Js/jquery.timeago.ko.js" type="text/javascript"></script> 
<title>사진 뷰</title>

<style type="text/css">
@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	font-weight: 700;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

* {
	font-family: 'LotteMartDream';
}

body {
	margin: 0;
	padding: 0;
}

.pv_container{
	top:60px;
	position: absolute;
	width: 100%;
}
.pv_body{
	width:70%;
	margin:0 auto;
}

.pv_header {
	width: 100%;
	position: fixed;
	z-index: 999;
	top: 0px;
	left: 0px;
	overflow: hidden;
	clear: both;
	border-bottom: 1px solid #E6E6E6;
	background:white;
}

.pv_header button {
	margin:10px 0px;
	padding: 9px 55px;
	background-color: white;
	color: #919198;
	border: 2px solid #919198;
	letter-spacing: 2px;
	outline: none;
	cursor: pointer;
	font-size : 17px;
	font-weight: bold;
	transition:800ms ease all;
}

.pv_header button:hover {
	background-color: #919198;
	color: white;
}

.pv_header #btnBx1 {
	float: left;
	display: inline-block;
	margin-left:8%;
}

.pv_header #btnBx2 {
	float: right;
	display: ininline-block;
	margin-right:1%;
}

.pv_header #btnBx3 {
	float: right;
	display: ininline-block;
	margin-right:3%;
	margin-left:0.8%;
	
}

.pv_header #btnBx3 img {
 	margin-top:12px; 
}

.pv_header #btnBx3 img:hover {
	cursor:pointer;
	opicity:0.5;
}



.pv_header #logoBx{
	margin:0 auto;
	width:52%;
	display: inline-block;
	text-align: center;
	color:#46CCFF;
}

.pv_header #logoBx img{
	margin-top: 17px;
	position:relative;
}

#pht_title{
	width:92%;
	margin:5px auto;
	padding:3px 0px;
	background: #f5fbf9;
}

#pht_title_deco{
	border:1px solid #F2F2F2;
	margin-bottom: 10px;
}

#pht_title h2{
	color:#919198;
}

#pht_no {
	font-size: 18px;
	text-align:right;
	display: inline-block;
	width:92%;
	color:#919198;
}

.content_head {
	width: 85%;
	margin: 10px auto;
}

.content_head h2 {
	text-align: center;
}

.content_head span {
	font-weight: bold;
}

.content_img {
	width: 85%;
	margin:0 auto;
	text-align: center;
}

.content_img img {
	width: 600px;
	height:500px;	
}

.content_text{
	width:100%;
	font-size:17px;
}

#content_text_inner{
	overflow:auto;
	position: relative;
	padding-top:10px;
	
}


.photo_like{
	width:60%;
	margin:0 auto;
}

.content_pre{
	width:100%;
	overflow: auto;
	height:100px;
	margin:0 auto;
	position: relative;
}

.content_pre_inner{
	margin:0 auto;
	border:1px solid black;
	width:72%;
	height:95%;
}
.content_pre img{
	width:100px;
	height:100px;
	margin:5px 10px;
}

#content_id_wrap{
	width:90%;
	margin: 10px auto;
	font-size: 20px;
	font-weight: bold;
}

#content_id {
	width:80%;
	margin:0 auto;
	position: relative;
} 
#content_id p {
	margin:10px 0px;
	font-size: 15px;
	color:#919198;
}

.goUpdate {
	padding: 9px 50px;
	letter-spacing: 5px;
	font-size: 15px;
	float:right;
	background:#9DCEBD;
 	color:#fff;
  	border:none;
  	position:relative;
  	cursor:pointer;
 	transition:800ms ease all;
  	outline:none;
}

.goUpdate:hover{
	background:#fff;
  color:#9DCEBD;
}

.goUpdate:before,.goUpdate:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #9DCEBD;
  transition:400ms ease all;
}
.goUpdate:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.goUpdate:hover:before,.goUpdate:hover:after{
  width:100%;
  transition:800ms ease all;
}

.pv_cmt_write{
	
	
}

.pv_comment_wrap {
	width: 70%;
	margin:3% auto;	
	position:relative;
}

.pv_comment{
	width: 80%;
	margin:0 auto;
	position:relative;
}

#openComt{
	width:80%;
	position: relative;
	margin:25px auto;
}

#openComt button{
	padding:10px 0px;
	letter-spacing: 4px;
	font-size:18px;
	width:100%;
	border: none;
	outline: none;
	cursor: pointer;
	background-color:#FDD7EC;
	color:#fff;
	border-radius: 1px;
}

#openComt button:hover{
	background-color:#F0B3E2;
}

.pv_cmt_write img{
	margin: 0px 5px 0px 0px;
	width: 40px;
	height: 40px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	-ms-border-radius: 100px;
	-khtml-border-radius: 100px;
	-o-border-radius: 100px;
	border: 0;
	vertical-align: middle;
}

.pv_cmt_write span{
	vertical-align: middle;
	margin-right: 10px;
}

.pv_cmt_write input{
	vertical-align: middle;
	width:65%;
	border-left:none; 
	border-bottom:1px solid gray;
	border-right:none;
	border-top:none;
	font-size: 15px;
	overflow: visible;
	padding:10px;
}

.pv_cmt_write button{
	vertical-align: middle;
	border: none;
	outline: none;
	cursor: pointer;
	background-color: #F0B3E2;
	padding: 9px 15px;
	letter-spacing: 2px;
	font-size: 15px;
	border-radius:1px;
	color:#fff;
}

.pv_cmt_write button:hover{
	background-color: #FDD7EC;
}



#pv_cmt_view{
	width:100%;
	position:relative;
}


#pv_cmt_view ul{
	padding:0;
}

#pv_cmt_view ul li{
	list-style:none;
}

#pv_cmt_view #replyImg{
	margin:10px 20px 10px 10px; 
}

.addParent {
	width:100%;
	display: inline-block;
}

.addChild{
	width:100%;
	display:inline-block;
	padding-left:5%;
}

.addParent img{
margin: 0px 5px 0px 0px;
	width: 40px;
	height: 40px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	-ms-border-radius: 100px;
	-khtml-border-radius: 100px;
	-o-border-radius: 100px;
	border: 0;
	vertical-align: middle;
}

.addParent span{
	margin-right: 20px;
}

.addParent button{
	margin-right: 10px;
	padding:5px;
}

#relpyMark{
	margin:0px 15px 0px 20px;
}

#replyMarkParent{
	margin:0px 10x;
	color:gray;
}

	

</style>

<script>

	function checkWriter(id){
		var s_id = '${p.m_ID}';
			if(id==s_id){
			
		}
	}
	
	function checkFL(){
		var pNo = '${p.PHOTO_NO}';
		var first = '${fl.FNO}';
		var last = '${fl.LNO}';
		
		if(pNo == first){
			$('#goPrev').attr('disabled',true).css(
				{'background':'#424242',
				 'cursor' : 'cursr',
				 'color' : '#6e6e6e'
				});
		}
		
		if(pNo == last){
			$('#goNextView').attr('disabled',true).css(
					{'background':'#424242',
					 'cursor' : 'cursr',
					 'color' : '#6e6e6e'
			});
		}
	}
	
	function init(){
		
// 		$('ul').each(function(){			
// 			var parent =$('input[name="parentFlag"]').val();
// 			alert(parent);
// 			if(parent!=0){
// 				$('addParent').css('padding-left','5%');
// 			}
// 		});
	}


	$(document).ready(function(){
		var likeFlag=0;
		
		var id= "<%= (String)session.getAttribute("id")%>";
		
		checkWriter(id); //작석자 본인 확인
		checkFL(); //처음 게시물이냐 마지막 게시물이냐 판별해서 버튼 클릭 막음
		init();
		
		$('#goPhtMain').hover(function(){
			$(this).attr('cursor','pointer').attr('opicity',0.5);
		});
		
		$('#goPhtMain').click(function(){
			window.location.href="myAlbum.do?"+id;
		});
		
		$('#goPrev').click(function(){
			var prePage = Number('${p.PHOTO_NO}')+1;
			window.location.href="inDetail.do?photo_no="+prePage;
		});
		
		$('#goNextView').click(function(){
			var nextPage = Number('${p.PHOTO_NO}')-1;
			window.location.href="inDetail.do?photo_no="+nextPage
		});
		
		$('#logo').hover(function(){
			$(this).css('top',+2);},
			function(){
				$(this).css('top',-2);
		});
		
		$('#likeThis').click(function(){
			if(likeFlag==0){
				$(this).attr('src',"image/like2.png");
				//여기에서 컨트롤러에서 넘어온 좋아요수가 3개 이상이냐 체크해서 이름으로 텍스트 쓸지 갯수로 보여줄지 결정.
				$('#likeCnt').text(id+'님');
				likeFlag=1;
			}else{
				$(this).attr('src',"image/like.png");
				likeFlag=0;
			}
			
		});
	 	
		$('#clickMe').hover(function(){
			$(this).text('Click Me!!');
		});
		$('#clickMe').mouseleave(function(){
			$(this).text('댓글 보기 (${commentTotalCnt}개)');
		});
		
		
		$('#writeComt').on('click',function(){
			
			var COMMT_CONTENT =$('input[name="COMMT_CONTENT"]').val();
			var PHOTO_NO = ${p.PHOTO_NO};
			var COMMT_PARENT =$('input[name="COMMT_PARENT"]').val(); 
		
			$.ajax({
				url:'commt_write.do',
				data:{
					COMMT_CONTENT,id,PHOTO_NO,COMMT_PARENT},
				type:'POST',
				cache:false,
				dataType:'text',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					var result = JSON.parse(data);
					
					$('#pv_cmt_view').appendTo(
							'<div style="width:100%;margin-bottom:15px;"'+'"><img src='+'"profileDownload.do?M_ID='+result.id+'">'+
							'<span>'+result.id+'</span>'+
							'<span>'+result.content+'</span>'+
							'<span id="date">'+result.date+'</span>'+
							'<button id="update_commt">수정</button>'+
							'<button id="delete_commt">삭제</button></div>'
							);		
					
					if(result.parent==null){
						$('#pv_cmt_view').addClass('addParent');
					}else{
						$('#pv_cmt_view').addClass('addParent').css('padding-left','5%');
					}
				
// 					if(result.id!=id){
// 						$('#update_commt').hide();
// 						$('#delete_commt').hide();
// 						$('#date').append('')
// 					}
				
				},
				error: function(request,status,error){
        			alert("code:"+request.status+"error:"+error);
				}
				
			});
			
		});
		
		
		       $(".tg").each(function(){
		           var timeago_t = jQuery.timeago( $(this).data("${i.PHT_COMMT_CREATE_DATE}"));
		           $(this).text(timeago_t);
		        });
		
	});
</script>
</head>
<body>
	<div class="pv_container">
		<div class="pv_header">
			<div id="btnBx1">
				<button id="goPrev">이전 사진</button>
			</div>
			
			<div id="logoBx">
				<img src="image/logo2.jpg" id="logo">
			</div>
			
			<div id="btnBx3">
				<img id="goPhtMain" src="image/gallery.png">
			</div>
			
			<div id="btnBx2">
				<button id="goNextView">다음 사진</button>
			</div>
			
			
		</div>

		<div class="pv_body">
			
				<div class="content_head">
					<div id="pht_title_deco">
					<div id="pht_title">
					<h2>${p.PHOTO_TITLE}</h2>
					</div>
					</div>
					<div id="pht_no">
					<span>No :  </span><span>${p.PHOTO_NO}</span>
					</div>
				</div>
				
				<div class="content_img">
					<img src="photodownload.do?PHOTO_NO=${p.PHOTO_NO}">
				</div>
				<div class="content_pre">
					<div class="content_pre_inner"></div>
				</div>

			<div id="content_id_wrap">
				<div id="content_id">
					<span id="p.m_ID">${p.m_ID}</span> <img src="image/like.png"
						id="likeThis"> <span id="likeCnt"></span>
					<!-- 좋아요 눌렀을 때 부터 3개까지는 누른사람 표시 그 이후부터는 개수표시 -->
 					<button id="goUpdate" class="goUpdate">수정</button>
    

					<c:choose>
						<c:when test="${empty p.PHOTO_UPDATE_DATE}">
							<p><fmt:formatDate value="${p.PHOTO_CREATE_DATE}" pattern="yyyy년 MM월 dd일" /></p>
						</c:when>
						<c:otherwise>
							<p><fmt:formatDate value="${p.PHOTO_UPDATE_DATE}" pattern="yyyy년 MM월 dd일" /></p>
						</c:otherwise>
					</c:choose>
					<div class="content_text">${p.PHOTO_CONTENT}
						<div id="content_text_inner">내용입니다.</div>
					</div>
				</div>
			</div>
			<!-- 도저히 이해를 할 수 없는 부분 대문자와 소문자의 차이는 뭐고 왜 얘만 이럴까 -->
			
			<div id="openComt">
				<button id="clickMe">댓글보기 (${commentTotalCnt}개)</button>
			</div>
		</div>
		
		

		<div class="pv_comment_wrap">
			<div class="pv_comment">
			<div id="pv_cmt_view" >
			<c:forEach items="${CommentList}" var="i">
			<ul>
				<li><div class="addParent">
					<c:choose>
						<c:when test="${0 ne i.COMMT_PARENT}">
							<span id="relpyMark"> └ </span>
							<span id="replyMarkParent">${i.PARENT_ID}</span>
						</c:when>
					</c:choose>
				<img src="profileDownload.do?M_ID=${i.m_ID}"> <span>${i.m_ID}</span>
					<span>${i.COMMT_CONTENT}</span>
					<c:choose>
						<c:when test="${empty i.PHT_COMMT_UPDATE_DATE}">
							<span>${i.PHT_COMMT_CREATE_DATE}</span>
						</c:when>
						<c:otherwise>
							<span>${i.PHT_COMMT_UPATE_DATE}</span>
						</c:otherwise>
					</c:choose>
					<span class="tg"></span>
							<button id="update_commt">수정</button>
							<button id="delete_commt">삭제</button>
					</div></li>
				
			</ul>
			</c:forEach>
			</div>
			
			
			<div class="pv_cmt_write">
				<img src="profileDownload.do?M_ID=${id}"> <span>${id}</span>
				<input type="text" name="COMMT_CONTENT"></input>
				<input type="hidden" value=0 name="COMMT_PARENT">
				<input type="hidden" value="${p.PHOTO_NO}" name="PHOTO_NO">
				<button id="writeComt">등록</button>
			</div>
			</div>
			</div>
		
			
			</div>
		


</body>
</html>