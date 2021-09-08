# 한남규 팀프로젝트 git 저장소
## 프로젝트명 GOOD 
### http://itproject.ezenac.co.kr/goodspring/

![logo](https://user-images.githubusercontent.com/75535280/131618812-bf16681a-87bb-42e5-86bd-598561800977.png)


> 일상의 전원을 off하고 밖으로 나가 에너지를 
채워주는 서비스가 있으면 좋겠다는 생각에서 시작하였습니다.
많은 직장인들의 건강한 여가 생활 권장을 위하여 산책로 추천과 
문화 및 체육시설 추천 등 많은 편의 서비스들을 정보제공하는 사이트

![](../header.png)

## 개발 언어 환경 


```
Front - end
HTML5,CSS, Javascript 1.0, jQuery 1.11.3, Bootstrap 3.3.7, Ajax

Back -end
Java 11, JSP, Spring Framework 5.3.2, Eclipse IDE 4.19.0, Tomcat9 9.0.52

```

## 메인 화면

![image](https://user-images.githubusercontent.com/81571770/132345538-86f36703-b012-4a73-abe3-04b082d68fcf.png)


## 페이지 및 기능
* 메인 페이지: 캐러셀을 통한 각종 페이지 정보 랜덤으로 표기, javascript를 이용한 날씨위젯 불러오기, Open API 정보를 JSON 파일로 변환 후 좌표값을 map에 라인으로 표시, 코스 및 문화체육 찜하기 기능 구현, JSTL을 이용한 메인 페이지 팝업 기능 구현, 팝업에 링크를 통한 웹페이지 안내페이지로 이동.
* 로그인 페이지: 사용자가 입력한 정보를 DB에 저장된 정보와 비교 후 일치 할 경우 로그인, 단 탈퇴 여부'N'일 경우만 정상 로그인, 'Y'일 경우 탈퇴된 회원 swal 표시.
* 아이디 찾기 페이지: 사용자가 입력한 정보를 DB에서 조회 후 일치하는 정보가 있을 시 해당 정보를 swal로 표시. 단 탈퇴 여부'N'일 경우만 정상 로그인, 'Y'일 경우 탈퇴된 회원 swal 표시.
* 비밀번호 찾기 페이지:사용자가 입력한 정보를 DB에서 조회 후 일치하는 정보가 있을 시 해당 정보를 일치하는 e-mail로 임시 비밀번호 전송. 단 탈퇴 여부'N'일 경우만 정상 로그인, 'Y'일 경우 탈퇴된 회원 swal 표시.
* 회원가입 페이지: regexHelper를 이용한 유효성 검증 후 db에 저장되지 않은 아이디, 닉네임, 이메일이면 사용가능. 중복일 경우 error메시지 하단부에 출력.  
* 회원정보수정 페이지: 로그인한 세션값을 받아 온 후(받아 올 당시 getSession 메서드가 리턴이 object라서 형변환을 함) 해당 input창에 세션 정보 출력. 비밀번호, 연락처, 주소 변경 가능. 변경 후 db 저장.
* 회원탈퇴 페이지: 로그인한 세션값을 받아 온 후 해당 input창에 세션 정보 출력. 회원 탈퇴 클릭 시 탈퇴 여부 'Y'로 db저장.
* 마이페이지: javascript를 통한 image를 제외한 파일 업로드 불가 기능 구현 및 정상 이미지 파일 업로드 시 ajax를 통해 변경할 이미지 화면 출력 및 적용 클릭 시 db에 이미지 경로 저장.
* 1:1문의 페이지: 제목, 카테고리, 내용을 입력 후 작성완료 클릭 시 db에 저장. (단, null 허용하지 않기 때문에 하나라도 내용이 없을 경우 swal로 화면표시) 
* 찜목록 페이지: 문화체육 페이지 & 걷기 코스 페이지에서 사용자가 원하는 정보를 찜하기 클릭 시 찜목록 페이지에 리스트로 출력. (javascript로 해당 정보의 값을 받아 온 후 체크 여부 확인 및 이미 체크 되어있을 시 찜목록 제거 swal 표시 and 네 클릭 시 찜목록 테이블에서 삭제.)
* 자전거 페이지: Open API 정보를 이용해서 JSON 파일을 db에 저장 한 후, 저장된 정보를 지도에 마커 클러스터형태로 출력. 사용자가 입력한 keyword 와 일치하는 정보를 목록형태로 표시. 해당 정보 클릭 시 map에서 해당 마커로 이동 후 화면 출력. 
* 문화체육 페이지:Open API에서 받아온 데이터를 db에 저장 후 4개의 카테고리로 나누어 각 상세페이지와 연결되는 캐러셀로 구현. get방식을 통한 파라미터 전달값에 따른 페이지 변환 기능 구현.  각 상세페이지에서 해당 정보와 예약 사이트 바로가기 구현
* 걷기 페이지: 사용자가 걷기 기록 버튼을 클릭 시  모달로 화면 출력. 시작 버튼 클릭 시 사용자의 위치 정보를 받아 온 후 사용자의 현재 위치를 map에 마커로 표시해준다. 그 후 사용자의 위치를 15초 간격으로 갱신하여 변화가 생길 때 마다 새롭게 마커를 표시하고 이동 거리를 map에 라인으로 표시한다. 걷기 기록하기가 동작 중일 때 페이지 이동이 일어날 시 alert 표시. 기록 중지 버튼 클릭 후 db에 저장되기 위해 사용자가 원하는 제목을 입력.(제목 중복검사 또한 진행 & 제목 미 입력 시 db 저장 안됨.)  명예의 전당은 나만의 코스에 작성된 글의 추천수가 많은 순으로 정렬하여 화면에 캐러셀 형태로 출력. 걷기 목록은 db에 저장된 정보를 랜덤으로 캐러셀 형태로 화면에 출력. 해당 코스에 대한 geojson데이터(위경도가 있는 JSON 파일)를 map에 라인으로 표시.
* 내 기록 페이지: 걷기 기록하기를 이용한 사용자에 한해서 시간, 거리, 평균페이스(거리/시간)을 저장된 db에서 가져온 후 막대그래프 형태로 시각화. 
* 기록 비교 페이지: 본인 기록 및 웹 페이지 사용자 중 걷기를 기록한 사용자의 정보 또한 막대그래프 형태로 시각화.
* 목표설정 페이지: 사용자가 기간(1일,7일,30일) 및 거리 와 시간을 설정할 수 있다. 설정 후 걷기 기록을 이용하고 나면 이용한 거리 및 시간을 사용자가 설정한 목표 및 시간과 계산하여 progressbar 형태로 화면에 시각화. 목표 달성률은 기간안에 성공시 달성 or 실패시 미달성으로 저장되어 pie 그래프 형태로 화면에 시각화.
* 나만의 코스 페이지: 걷기 기록하기를 이용한 사용자가 걷기 기록 중지 시 입력한 제목을 드롭박스 형태로 저장되어 있는 정보 표기. 해당 제목과 일치하는 db정보 map에 표시 및 카테고리와 내용 작성 후 게시글 등록. 상세페이지에서 좋아요 기능은 ajax를 이용해 구현(json 형태로 나만의 코스 일련번호를 post 방식으로 url을 전달 후 해당 일련번호에 대한 좋아요 클릭여부 확인 후 클릭 시 count 1증가), 글삭제는 script를 이용해 swal로 여부 확인 후 '네'클릭 시 삭제, 댓글 등록 기능은 ajax를 이용해 구현. 등록된 댓글은 ajax의 get방식으로 목록 화면표기.
* 크루 페이지: 개설되어 있는 크루 정보를 캐러셀로 화면 출력. 페이지 네이션을 통한 화면에 표기되는 갯수 제한. JSTL을 이용하여 드롭다운을 통한 검색 조건 설정 후 해당 조건에 대한 검색 기능 구현.
* 마이크루 페이지: 사용자가 가입한 크루를 화면에 출력. 
* 크루개설 페이지: 개설 시 크루명은 regexhelper를 이용해 중복검사 및 유효성 검사 후 이름 설정가능하도록 기능 구현. 각 정보들 null값 허용하지 않으므로 null값이 있을 시 swal 표시. 이미지 등록 시 javascript를 이용하여 이미지 확장자(png,jpg)설정하여 그 이외에는 등록 불가능하게 기능 구현.
* 크루소개 페이지: 해당하는 크루의 저장된 정보를 화면에 출력. 미가입 한 회원은 가입하기 버튼을 통해 가입하기 가능. 가입된 회원은 소개 페이지 클릭시 크루 상세 페이지 이동하도록 기능 구현.
* 크루상세 페이지: 크루장과 크루원에 따른 JSTL을 이용하여 각각 다른 버튼들이 화면에 출력. 테이블 형태로 게시판 구현. 
* 크루회원관리 페이지: 해당 크루에 가입되어 있는 회원 목록을 표기. 단 크루장은 스스로 추방 불가능하게 기능 구현.
* 내가 쓴 글 페이지: 나만의 코스와 크루에서 작성한 게시물들을 조회 후 화면에 표기.
* 관리자 1:1문의 관리 페이지: 사용자가 등록한 1:1문의를 화면에 출력. 드롭박스를 통한 답변 유무 조회 기능 구현. 카테고리 선택 후 검색 기능 구현. 관리자가 답변을 달면 JSTL을 통해 답변 유무에 따른 답변중or답변완료 출력.
* 관리자 회원정보 페이지: 가입한 회원들의 정보를 테이블 형태로 출력 및 페이지네이션을 통한 화면에 보이는 갯수 조정. 회원 추방 시 탈퇴 여부 'Y'로 변경.  
* 관리자 회원통계 페이지: Intercepter 기능을 이용해 user_TrafficLog를 db에 저장. 저장된 user_TrafficLog를 활용하여 그래프로 화면에 시각화. 

## 직접 구현한 기능

