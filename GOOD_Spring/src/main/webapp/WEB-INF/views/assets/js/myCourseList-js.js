/**
 * 
 */

$(function() {
    var length = $('#item-box').data('length');
    var map = [];
    var mapContainer = [];
    var mapOption = null;
    var linepath = [];
    var lat = [];
    var lon = [];
    var linepathLength = 0;

    for (var j = 0; j < length; j++) {
		var polyline=null;
		var marker=null;
        var mycourse_noId = document.getElementById('item' + j + '')
        var mycourse_no = mycourse_noId.dataset.mycourseno;


        console.log(mapContainer[j])
       

        //지도 띄우기 ajax 처리
        $.ajax({
            url: getContextPath() + '/commPage/comm_myCourseListGetLoc.do',
            type: 'post',
            data: { mycourse_no },
            success: function(data) {
 mapContainer[j] = document.getElementById('map' + j + ''), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.5160832, 126.9661696), // 지도의 중심좌표
                level: 10, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };
        map[j] = new kakao.maps.Map(mapContainer[j], mapOption);
                for (var i = 0; i < data.courseName.length; i++) {
                    linepathLength = data.courseName.length;
                    console.log(data.courseName.length)

                    lat[i] = parseFloat(data.courseName[i].lat);
                    lon[i] = parseFloat(data.courseName[i].lon);

                    linepath[i] = new kakao.maps.LatLng(parseFloat(data.courseName[i].lat), parseFloat(data.courseName[i].lon));
            	

				};
				               polyline = new kakao.maps.Polyline({
					map: map[j], // 선을 표시할 지도 객체 
					path: linepath,
					strokeWeight: 2, // 선의 두께
					strokeColor: '#FF0000', // 선 색
					strokeOpacity: 1, // 선 투명도
					strokeStyle: 'solid' // 선 스타일
				});
                // 지도에 마커를 생성하고 표시한다
                  marker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(lat[0], lon[0]), // 마커의 좌표
					map: map[j] // 마커를 표시할 지도 객체
					})
        },async:false


                /*// 지도 중심 좌표 변화 이벤트를 등록한다
                kakao.maps.event.addListener(map[j], 'center_changed', function() {
                	console.log('지도의 중심 좌표는 ' + map[j].getCenter().toString() + ' 입니다.');
                });
                map[j].setCenter(new kakao.maps.LatLng(lat[0], lon[0]));*/

                /*		// 도형에 mouseover 이벤트를 등록한다
						kakao.maps.event.addListener(polyline, 'mouseover', function() {
							console.log('도형에 mouseover 이벤트가 발생했습니다!');
						});

						// 도형에 mouseout 이벤트를 등록한다
						kakao.maps.event.addListener(polyline, 'mouseout', function() {
							console.log('도형에 mouseout 이벤트가 발생했습니다!');
						});

						// 도형에 mousedown 이벤트를 등록한다
						kakao.maps.event.addListener(polyline, 'mousedown', function() {
							console.log('도형에 mousedown 이벤트가 발생했습니다!');
								});*/
                // 지도에 선을 표시한다

         });
    }
})