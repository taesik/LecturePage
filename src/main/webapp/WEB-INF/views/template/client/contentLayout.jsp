<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
		<meta charset="utf-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<title><tiles:getAsString name="title"/></title>
		
		<!-- Bootstrap core CSS -->
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
		<script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
		 
		   <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
		
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
				
		<title>Insert title here</title>
		
	</head>
	<body>
		<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      	<tiles:insertAttribute name="header"/>
    </nav>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
       <h1><tiles:getAsString name="title"/></h1>
      </div>
    	<tiles:insertAttribute name="body"/>
    </div>

    <footer class="footer">
     	<tiles:insertAttribute name="footer"/>
    </footer>
	</body>
</html>