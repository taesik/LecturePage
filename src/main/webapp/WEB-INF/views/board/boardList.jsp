<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
				
		
		<!-- Bootstrap core CSS -->
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-theme.css" rel="stylesheet">
		<link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
		<script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
		 
			   <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	    <script src="/resources/include/js/common.js"></script>
	    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
	    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>		
			
		<script type="text/javascript">
			$(function () {
				$("#writeBtn").click(function () {
					location.href="/board/writeForm"
				})
				
				$(".goDetail").click(function () {
					var b_num=$(this).parents("tr").attr("data-num"); //자신의 부모요소를 찾는데 그건 tr이고 속성이 data-num
					$("#b_num").val(b_num);
					console.log("글번호 : "+b_num);
					//상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/board/boardDetail"
					})
					$("#detailForm").submit();
				})
			})
		</script>	
		<style type="text/css">
		.goDetail{
		cursor: pointer;}
		</style>	
		<title>게시판 목록</title>
		
	
	</head>
	<body>
	<form id="detailForm">
		<input type="hidden" id="b_num" name="b_num"/>
	</form>
		<div class="container">
			<div class="contentTit page-header"><h3 class="text-center">게시판 리스트</h3></div>
			
			<%--============================리스트 시작====================== --%>
			<div id="boardList">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">글번호</th>
							<th class="text-center">글제목</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach var="board" items="${boardList}" varStatus="status">
									<tr class="text-center" data-num="${board.b_num}">
										<td>${board.b_num}</td>
										<td class="text-left">
											<%-- <c:if test="${vo.repStep>0}">
												<c:forEach begin="1" end="${vo.repIndent}">
													&nbsp;&nbsp;&nbsp;
												</c:forEach>
												<img src="/siteProject/image/re1.jpg"/>
											</c:if> --%>
											<span class="goDetail">${board.b_title}</span></td>
										<td>${board.b_name}</td>
										<td>${board.b_date}</td>
										<%-- <td>${vo.readcnt}</td> --%>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="5" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>
					</tbody>	
				</table>
			</div>
			<%-- =========================리스트 종료 ======================= --%>
			
			<%-- =========================글쓰기 버튼 출력 시작 ===================== --%>
			<div class="text-right">
				<input type="button" value="글쓰기" id="writeBtn" class="btn btn-success"/>	
			</div>
		</div>
	</body>
</html>