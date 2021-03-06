<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

<style type="text/css">
.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}

.fr-wrapper {
	min-height: 400px
}

#editable {
	margin-top: 30px;
}

input#title {
	width: 500px;
	height: 34px;
}

#editable, input#title {
	margin-left: 30px;
}

input#title {
	margin-top: 30px;
}

.btn-group {
	margin: 30px 0;
}

.cke_contents {
	min-height: 500px;
}
</style>
</head>

<body>
	<div class="wrapper">
		<!-- 공용 헤더 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container con_post">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/comm_icon.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">크루게시판</h1>
			<h2>게시글 작성</h2>
			<br />


			<form role="form" id="post_form">
				<input type="hidden" name="post_crew" value="${output.crew_name}" />
				<input type="hidden" name="crew_no" value="${output.crew_no}" />
				<div class="row">
					<div class="col-md-6">
						<label for="post_title">제목</label> <input type="text"
							id="post_title" name="post_title" class="form-control"
							placeholder="제목을 입력해주세요."
							style="display: inline-block; width: 90%; margin-left: 10px">
					</div>
				</div>

				<br />
				<textarea name="post_content" id="post_content" class="ckeditor"
					style="font-size: 20px; resize: none"></textarea>
				<br />

				<div class="btn-group pull-right">
					<button type="reset" class="btn btn-warning wr_cancel"
						id="wr_cancel">
						<span>취소</span>
					</button>
					<button type="submit" class="btn btn-primary wr_ok" id="wr_ok" >
						<span>작성완료</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //컨테이너 -->
	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
	<!-- // js -->
	<script>
	let crew_no="${output.crew_no}"
	let post_crew="${output.crew_name}"
		$(function() {
			$('#wr_ok').click(function(e) {
				e.preventDefault();

				var	post_title=document.getElementById('post_title').value;
				var post_content= CKEDITOR.instances['post_content'].getData()
				if (post_title==null||post_title=="") { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "제목을 입력해주세요.",
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {
							$("#post_title").focus(); // <-- 커서를 강제로 넣기
						}, 100);
					}); // <-- 메시지 표시
					return false; // <-- 실행 중단
				}

				if (post_content==null||post_content=="") { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "내용을 입력해주세요.",
						type : "error"
					})
					return false; // <-- 실행 중단
				} else {
					$.ajax({
						url:getContextPath()+"/commPage/comm_crew_postWrite_ok",
						method:'post',
						data:{post_title,post_content,post_crew,crew_no},
						success:function(data){
							var post_no=data.input.post_no
							swal({
								title : '성공', // 제목
								text : "게시글 작성이 완료되었습니다.", // 내용
								type : 'success', // 종류
							}).then(function(result) {
								window.location = getContextPath() + "/commPage/comm_crew_post.do?post_no="+post_no
							})
						},error:function(data, status, error){
							var error_msg =data.responseJSON.rt
							swal({
								title : "에러",
								text :error_msg,
								type : "error"
								})
						return false; // <-- 실행 중단
						}
					})
				}
			});
			
			$("#wr_cancel").click(function() {
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "정말 취소 하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '게시글 작성이 취소되었습니다.', 'success').then(function(result){
							window.location = getContextPath() + "/commPage/comm_crew_bbs.do?crew_no=" 
							+ crew_no + "&crew_name=" + post_crew;
						});
					}
				});
			});
		});
	</script>
</body>
</html>