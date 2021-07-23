<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">
/** 공통 영역 **/
* {
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
	width: 100%;
}

.body a {
	text-decoration: none;
}

.body .main_header {
	padding-bottom: 0;
}

.body .detail_info {
	padding-bottom: 70px;
	margin: auto;
}

ul, li {
	list-style: none;
}

.body .detail_info .info {
	box-shadow: 0 2px 7px rgba(102, 109, 117, 0.32);
}

.detail_info .info li {
	padding: 17px 20px 20px 10px;
	border-bottom: 1px solid #ddd;
}

.body .header {
	padding-bottom: 10px;
	padding-top: 20px;
}

.main_header h1 {
	position: relative;
	text-align: center;
}

.main_header>h1 {
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
	bottom: 5px;
}

.detail_info {
	padding-top: 10px;
}

.detail_info .detail_item {
	padding-left: 10px;
}

.detail_info .info p {
	font-size: 15px;
	display: inline;
}

.detail_info .info strong {
	font-size: 20px;
}

.detail_info .detail_img img {
	border: 1px solid #ddd;
	box-shadow: 0 2px 7px rgba(102, 109, 117, 0.32);
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	max-height: 100%;
	min-width: 100%;
	max-width: 100%;
	height: 300px;
}

.detail_info .itemHeader {
	padding-left: 5px;
	margin-bottom: 10px;
}

.detail_info .detail_item {
	padding-top: 10px;
}

.main_info .info strong {
	color: #343a40;
}

.main_info .info p {
	color: #495056;
}

/*찜하기 버튼*/
.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}

.row .btn_container {
	margin: 20px 0;
}

.detail_info .btn {
	margin-bottom: 10px;
	margin-left: 5px;
	margin-right: 5px;
}

/** 대분류 소분류 사이의 중간점 **/
.middel_dot {
	content: "";
	display: inline-block;
	width: 2px;
	height: 2px;
	border-radius: 50%;
	background-color: #848c94;
	vertical-align: middle;
	margin: 0 5px;
}
</style>
</head>

<body>
	<!-- 공통 헤더 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- //공통 헤더 -->
	<!-- 컨테이너 -->
	<div class="container">
		<!-- 본문영역 시작 -->
		<div class="body">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/casPage/cas_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">문화 체육<img
						src="${pageContext.request.contextPath }/assets/icon_img/문화체육 아이콘.png;" />
					</span>
				</h1>
			</div>
			<div class="row detail_info clearfix">
				<div class="itemHeader">
					<h2 style="color: #343a40;">${output.SVCNM }</h2>
				</div>
				<div class="row detail_item">
					<div class="col-md-5 col-sm-6 col-xs-12">
						<div class="detail_img">
							<img alt="이미지" src="${output.IMGURL }">
						</div>
						<!-- 버튼 -->
						<div class="btn_container" style="text-align: center;">
							<button class="btn btn-primary" type="button"
								onclick="location.href='${output.SVCURL}'" style="width: 140px;">
								<span style="font-size: 18px;">예약 사이트 바로가기</span>
							</button>
							<button class="heart btn btn-warning" type="button"
								style="width: 140px; font-size: 18px;" >
								<i class="fa fa-heart-o" aria-hidden="true" role="button"
									style="padding-right: 5px; font-size: 18px;" ></i>찜하기
							</button>
						</div>
					</div>
					<div class="col-md-7 col-sm-6 col-xs-12 main_info">
						<ul class="info">
							<li class="infoItem"><strong class="infoLabel">분류명
									: </strong>
								<p class="infoText">${output.MAXCLASSNM }<span
										class="middel_dot"></span>${output.MINCLASSNM }</p></li>
							<li class="infoItem"><strong class="infoLabel">이용시간
									: </strong>
								<p class="infoText">${output.VMIN }~${output.VMAX }</p></li>
							<li class="infoItem"><strong class="infoLabel">접수기간
									: </strong>
								<p class="infoText">${output.RCPTBGNDT}~${output.RCPTENDDT }</p></li>
							<li class="infoItem"><strong class="infoLabel">서비스
									상태 : </strong>
								<p class="infoText">${output.SVCSTATNM }</p></li>
							<li class="infoItem"><strong class="infoLabel">이용요금
									: </strong>
								<p class="infoText">${output.PAYATNM }</p></li>
							<li class="infoItem"><strong class="infoLabel">대상연령
									: </strong>
								<p class="infoText">${output.USETGTINFO }</p></li>
							<li class="infoItem"><strong class="infoLabel">장소명
									: </strong>
								<p class="infoText">${output.AREANM}<span class="middel_dot"></span>${output.PLACENM }</p></li>
							<li class="infoItem"><strong class="infoLabel">문의전화
									: </strong>
								<p class="infoText">${output.TELNO }</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨테이너 -->
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script>
		// 하트
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								$(".heart")
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
								$(".heart").removeClass("liked");
							} else {

								swal({
									title : '확인',
									text : "찜목록에 추가할까요?",
									type : 'question',
									confirmButtonText : '네',
									showCancelButton : true,
									cancelButtonText : '아니요',
								})
										.then(
												function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
													if (result.value) { // 확인 버튼이 눌러진 경우
														$(".heart")
																.html(
																		'<i class="fa fa-heart" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
														$(".heart").addClass(
																"liked");
														swal(
																'성공',
																'찜목록에 추가되었습니다.',
																'success');
														setTimeout(function() {
														}, 1000);
													} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
														$(".heart")
																.html(
																		'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
														$(".heart")
																.removeClass(
																		"liked");
														swal(
																'취소',
																'찜하기가 취소되었습니다.',
																'error');
													}
												});
							}

						});
	</script>
	<!-- //하트 -->
	<!-- // js -->
</body>
</html>