<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link
	href="../plugins/drag-drop-image-uploader/dist/image-uploader.min.css"
	rel="stylesheet">

<style type="text/css">
.profile_info {
	padding-top: 60px;
}

.profileimage {
	padding-top: 30px;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<h1 class="page-header">마이페이지</h1>
			<div class="row">
				<div class="col-md-3 col-md-offset-1 profileimage"
					style="width: 230px">
					<form>
						<div class="form-group">
							<img id="img__wrap"
								onerror="this.src='../img/profile_default.png'"
								src="${sessionScope.principal.userProfile}" width="200px"
								height="200px" style="border-radius: 100px" />
						</div>
						<div class="form-group text-center bg-light">
							<label for="img__preview" class=" btn btn-default">프로필 사진
								변경</label> <input type="file" name="userProfile" id="img__preview"
								class="hidden" /> 
								<button type="button"
								name="userProfile_apply" id="userProfile_apply" class="btn btn-default" >적용</button>
						</div>
						<input type="hidden" name="id"
							value="${sessionScope.principal.id}" />
					</form>
				</div>
				<div class="col-md-7 col-md-offset-1 profile_info">
					<h4>ID: 모카</h4>
					<h4>닉네임: 모카</h4>
					<h4>
						휴대폰 번호: 010-1234-6789<%

					%>
					</h4>
					<h4>
						주소: 나도 모름<%

					%>
					</h4>
					<h4>
						이메일: abc@abc.com<%

					%>
					</h4>
					<h4>
						가입일:2021-06-04<%

					%>
					</h4>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="pull-left">
						<a href="myPage_inquiry.jsp" class="btn btn-default">1:1 문의</a>
					</div>
					<div class="pull-right">
						<a href="myPage_accountEdit.jsp" class="btn btn-default">계정 관리</a>
						<a href="myPage_accountOut.jsp" class="btn btn-default">회원 탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>


	<script type="text/javascript">
		$('#img__preview').on("change", function(e) {
			console.log(e.target.files);

			console.log(e.target.files[0].type.match("image*"));
			console.log(e.target.files[0].type.includes("image"));

			var f = e.target.files[0];

			if (!f.type.match("image*")) {
				alert("이미지만 첨부할 수 있습니다.");
				$("#img__preview").val('');
				return;
			}

			if (f.size > 1024 * 1024 * 2) {
				alert("이미지는 2MB 이하만 가능합니다.");
				$('#img__preview').val('');
				return;
			}
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img__wrap').attr("src", e.target.result);
			};
			reader.readAsDataURL(f);
		});
	</script>
</body>
</html>