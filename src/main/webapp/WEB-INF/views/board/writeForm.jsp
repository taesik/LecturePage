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
      	
      	<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-theme.css" rel="stylesheet">
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	    <script src="/resources/include/js/common.js"></script>
	    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
      	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
			$(function () {
				//저장 버튼
				$("#submitBtn").click(function () {
					//유효성 체크
					if(!chkData("#b_name","이름을 ")) return;
					else if(!chkData("#b_pwd","비밀번호를 ")) return;
					else if(!chkData("#b_title","제목을 ")) return;
					else if(!chkData("#b_content","내용을 ")) return;
					else{
						$("#writeForm").attr({
							"method":"post",
							"action":"/board/boardInsert"
						})
						$("#writeForm").submit();
					}
				})
				
				//취소 버튼
				$("#cancelBtn").click(function () {
					$("#writeForm").each(function () {
						this.reset();
					});
				});
				
				//목록 버튼
				$("#listBtn").click(function () {
					location.href="/board/boardList";
				});
			});
			function boardPwdConfirm() {
				if (!chkData('#passwd',"비밀번호를")) return; //이건 common.js에 정의 되있는 함수를 사용하였다.
				else {
					$.ajax({
						url: "/board/pwdCofirm", //전송 url    board/pwdCofirm
						type : "post" ,					//전송 시 method 방식            
						data : $("#f_pwd").serialize(),//폼전체 데이터 전송      
						dataType : "text",
						error : function() {		//실행시 오류가 발생ㅎ였을 경우
							alert ('시스템 오류 입니다. 관리자에게 문의하세요');
						},							//정상적으로 실행이 되었을 경우
						success : function(resultData) { //resultData에 0이나 1을 받는다. 0이면 비밀번호가 일치 하지않는다.
							var goUrl = "";		//이동할 경로를 저장할 변수
							if(resultData=="실패"){ //일치하지않는 경우
								$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.");
								$("#passwd").select();
							}else if(resultData=="성공"){ //일치할 경우
								$("#msg").text("");
							//console.log("비밀번호 일치");
								if (butChk==1) {//수정버튼 클릭
									goUrl = "/board/updateForm";
								}else if(butChk==2) {//삭제버튼 클릭
									goUrl = "/board/deleteBoard";
								}
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();  
								//주석 주고 새로고침  404 떨어질거다
							}
						}
					});
				}
		</script>
		
		<style type="text/css">
		textarea{
		resize: none;}
		</style>
		
		<title>글쓰기</title>
		
	</head>
	<body>
		<div class="container">
		<div class="contentTit page-header"><h3 class="text-center">글쓰기 폼</h3></div>
		<form id="writeForm" class="form-horizontal">
			  <div class="form-group">
			    <label for="b_name" class="col-sm-2 control-label">이름</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_name" name="b_name"
			       placeholder="Name" maxlength="10">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="b_pwd" class="col-sm-2 control-label">비밀번호</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="b_pwd" name="b_pwd"
			       placeholder="Password" maxlength="20">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="b_title" class="col-sm-2 control-label">제목</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="b_title" name="b_title"
			       placeholder="Title" maxlength="100">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="b_content" class="col-sm-2 control-label"><br><br><br><br>내용</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" id="b_content" name="b_content" placeholder="Content"
			      rows="10"></textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10 text-right">
			      <button type="button" class="btn btn-success" id="submitBtn">저장</button>
			      <button type="button" class="btn btn-warning" id="cancelBtn">취소</button>
			      <button type="button" class="btn btn-primary" id="listBtn">목록</button>
			    </div>
			  </div>
		</form>
		</div>
	</body>
</html>