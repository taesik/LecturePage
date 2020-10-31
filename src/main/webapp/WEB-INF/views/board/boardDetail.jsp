<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-theme.css" rel="stylesheet">
	    <script src="/resources/include/js/common.js"></script>
	    <script src="/resources/include/dist/js/bootstrap.min.js"></script>		
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			var butChk = 0;// 수정버튼과 삭제터븐을 구별하기 위한 변수
			$(function () {
				$("#pwdChk").css("visibility","hidden");
				
				$("#updateFormBtn").click(function () {
					$("#pwdChk").css("visibility","visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요").css("color","#000099");
					butChk =1;
				});
				
				
				$("#listBtn").click(function () {
					location.href="/board/boardList";
				});
				
				
			})
		</script>
		
		<title>글 상세 보기</title>
		
	</head>
	<body>
	<!-- <div class="contentTit"></div>-->
	<form name="f_data" id="f_data" method="post">
		<input type="hidden" name="b_num" value="${detail.b_num}"/>
	</form>
		
		<!-- 비밀번호 확인 버튼 및 버튼 추가 시작 -->
		<div id="boardPwdBut" class="row text-center">
			<div id="pwdChk" class="row text-center">
				<form name="f_pwd" id="f_pwd" class="form-inline">
					<input type="hidden" name="b_num" id="b_num" value=""${detail.b_num}"/>
					<label for="b_pwd" id="l_pwd">비밀번호 : </label>
					<input type="password" name="b_pwd" id="b_pwd" class="form-control"/>
					
					<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
					<span id="msg"></span>
				</form>
			</div>
		
			<div class="btnArea col-md-4 text-right">
				<input type="button" value="수정" id="updateBtn" class="btn btn-success"/>
				<input type="button" value="삭제" id="deliteBtn" class="btn btn-danger"/>
				<input type="button" value="쓰기" id="insertBtn" class="btn btn-warning"/>
				<input type="button" value="목록" id="listBtn" class="btn btn-primary"/>
			</div>	
		</div>	
			<!-- 상세 정보 보여주기 시작 -->		
			<div class="contentTB text-center">
				<table class="table table-hover">
					<colgroup>
						<col width="17%"/>
						<col width="33%"/>
						<col width="17%"/>
						<col width="33%"/>
					</colgroup>
					<tbody>
					<tr>
						<td>글번호</td>
						<td class="text-left">${detail.b_num}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td class="text-left">${detail.b_name}</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-left">${detail.b_title}</td>
					</tr>
					<tr class="table-height">
						<td>글내용</td>
						<td colspan="3" class="text-left">${detail.b_content}</td>
					</tr>
					</tbody>
				</table>
			</div>
			
	</body>
</html>