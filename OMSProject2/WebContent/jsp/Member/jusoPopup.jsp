<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
  src="http://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>  

<% 

	//request.setCharacterEncoding("UTF-8");  //�ѱ۱����� �ּ�����

	//request.setCharacterEncoding("EUC-KR");  //�ش�ý����� ���ڵ�Ÿ���� EUC-KR�ϰ�쿡

	String inputYn = request.getParameter("inputYn"); 

	String roadFullAddr = request.getParameter("roadFullAddr"); 

	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 

	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 

	String engAddr = request.getParameter("engAddr"); 

	String jibunAddr = request.getParameter("jibunAddr"); 

	String zipNo = request.getParameter("zipNo"); 

	String addrDetail = request.getParameter("addrDetail"); 

	String admCd    = request.getParameter("admCd");

	String rnMgtSn = request.getParameter("rnMgtSn");

	String bdMgtSn  = request.getParameter("bdMgtSn");

	String detBdNmList  = request.getParameter("detBdNmList");	

	/** 2017�� 2�� �߰����� **/

	String bdNm  = request.getParameter("bdNm");

	String bdKdcd  = request.getParameter("bdKdcd");

	String siNm  = request.getParameter("siNm");

	String sggNm  = request.getParameter("sggNm");

	String emdNm  = request.getParameter("emdNm");

	String liNm  = request.getParameter("liNm");

	String rn  = request.getParameter("rn");

	String udrtYn  = request.getParameter("udrtYn");

	String buldMnnm  = request.getParameter("buldMnnm");

	String buldSlno  = request.getParameter("buldSlno");

	String mtYn  = request.getParameter("mtYn");

	String lnbrMnnm  = request.getParameter("lnbrMnnm");

	String lnbrSlno  = request.getParameter("lnbrSlno");

	/** 2017�� 3�� �߰����� **/

	String emdNo  = request.getParameter("emdNo");



%>

<style type="text/css">
/* ���� ��� �̹��� */
.pop-address-search .pop-address-search-inner { background-image: url(http://www.0000.com/img/backImg.png);}
/* ȸ�� �ΰ� �̹��� */
.pop-address-search .pop-address-search-inner .logo { background: url(http://www.0000.com/img/logo.png) no-repeat; background-position:center; }

/* ���� ������ */
.pop-address-search .pop-address-search-inner { background-color:#ECECEC; }
/* �˻�â ���� */
.pop-address-search .pop-address-search-inner .wrap input { background-color:#FFFFFF; }
/* �˻���ư ���� */
.pop-address-search .pop-address-search-inner .wrap { background-color:#FFFFFF; }
/* ���� ����(Ȧ��) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(odd) td {background:#FFFFFF}
/* ���� ����(¦��) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(even) td {background:#FFFFFF}
</style>
</head>
<body>
<script language="javascript">

// opener���� ������ �߻��ϴ� ��� �Ʒ� �ּ��� �����ϰ�, ������� ������������ �Է��մϴ�. ("�ּ��Է�ȭ�� �ҽ�"�� �����ϰ� ������Ѿ� �մϴ�.)

//document.domain = "abc.go.kr";



function init(){
var url = location.href;

	var confmKey = "U01TX0FVVEgyMDE4MDMxOTA2MTMwOTEwNzczNjQ=";  // ������ �߱޹��� apiŰ���� �־��ݴϴ�.

	var resultType = "4"; // ���θ��ּ� �˻���� ȭ�� ��³���, 1 : ���θ�, 2 : ���θ�+����, 3 : ���θ�+�󼼰ǹ���, 4 : ���θ�+����+�󼼰ǹ���

	var inputYn= "<%=inputYn%>";

	if(inputYn != "Y"){

		document.form.confmKey.value = confmKey;

		document.form.returnUrl.value = url;

		document.form.resultType.value = resultType;

		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //���ͳݸ�

		//document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //����� ���� ���, ���ͳݸ�

		document.form.submit();

	}else{

		opener.parent.jusoCallBack("<%=roadFullAddr%>");
<%-- 		$(opener.location).attr("href", "javascript:jusoCallBack('"<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>","<%=engAddr%>","<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>", "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>", "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>")';"); --%>
<%-- 		$(opener.location).attr("href", "javascript:jusoCallBack(\"<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>","<%=engAddr%>","<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>", "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>", "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>");"); --%>
			self.close();
		}
	


}

</script>

<body onload="init();">

	<form id="form" name="form" method="post">

		<input type="hidden" id="confmKey" name="confmKey" value=""/>

		<input type="hidden" id="returnUrl" name="returnUrl" value="<c:url value='/cnsgn/entpr/insertCnsgnEntprMngmeView.do'/>"/>

		<input type="hidden" id="resultType" name="resultType" value=""/>


	</form>
</body>
</html>