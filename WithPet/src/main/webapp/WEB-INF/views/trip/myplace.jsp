<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 코스 추천 페이지</title>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<style>
		#Ttotal{
			margin: auto;
			height: 1000px;
			width: 1200px;
			border: 0.1px solid sandybrown;
			box-sizing: border-box;
		}

		#list_wrap{
			height: 48%;
			width: 100%;
			border: 0.1px solid sandybrown;
		}

		#map_wrap{
			height: 48%;
			width: 100%;
			border: 0.1px solid sandybrown;
		}

		#list1, #list2{
			float: left;
			height: 100%;
			width: 50%;
			border: 0.1px solid sandybrown;
		}






	</style>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd"></script>
	<script type="text/javascript">
				
			var map;
			//console.log(map);

			var marker_s, marekr_e, waypoint;
			var resultMarkerArr = [];
			//경로그림정보
			var drawInfoArr = [];
			var resultInfoArr = [];
			
			function initTmap(){

				var lat1 = $('#my1').children().eq(3).children().val();
				var lng1 = $('#my1').children().eq(4).children().val();
				var lat5 = $('#my5').children().eq(3).children().val();
				var lng5 = $('#my5').children().eq(4).children().val();

				var lat2 = $('#my2').children().eq(3).children().val();
				var lng2 = $('#my2').children().eq(4).children().val();
				var lat3 = $('#my3').children().eq(3).children().val();
				var lng3 = $('#my3').children().eq(4).children().val();
				var lat4 = $('#my4').children().eq(3).children().val();
				var lng4 = $('#my4').children().eq(4).children().val();

				console.log(lat1);
				console.log(lat5);

				if(lat1 == '' || lat5 == ''){
						alert("출발지와 도착지를 선택 해 주세요!");
						return false;
					}

				if(map != null){
					if(confirm('지도를 새로 조회 하시겠습니까?')){
						$('#map_div').html('');
						$('#result').text('');
					} else {
						return false;
					}
				}

				resultMarkerArr = [];


				
			 	// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center: new Tmapv2.LatLng(lat1, lng1),
					width : "80%",
					height : "80%",
					zoom : 10,
					zoomControl : true,
					scrollwheel : true
					
				});
				
				// 2. 시작, 도착 심볼찍기
				// 시작
				marker_s = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(lat1,lng1),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker_s);
				// 도착
				marker_e = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(lat5,lng5),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker_e);
				
				// 3. 경유지 심볼 찍기
				marker = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(lat2, lng2),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker);
				
				marker = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(lat3, lng3),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker);
				
				marker = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(lat4, lng4),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker);
				
				// 4. 경로탐색 API 사용요청
				var routeLayer; 
				$("#btn_select").click(function(){


					var lat1 = $('#my1').children().eq(3).children().val();
					var lng1 = $('#my1').children().eq(4).children().val();
					var lat2 = $('#my2').children().eq(3).children().val();
					var lng2 = $('#my2').children().eq(4).children().val();
					var lat3 = $('#my3').children().eq(3).children().val();
					var lng3 = $('#my3').children().eq(4).children().val();
					var lat4 = $('#my4').children().eq(3).children().val();
					var lng4 = $('#my4').children().eq(4).children().val();
					var lat5 = $('#my5').children().eq(3).children().val();
					var lng5 = $('#my5').children().eq(4).children().val();
					var value = '';
					
					console.log(lat1);
					console.log(lat5);

					if(lat1 == '' || lat5 == ''){
						alert("출발지와 도착지를 선택 해 주세요!");
						return false;
					}

					if(lat2 == '' && lat3 != ''){
						alert("경유지는 2번부터 순서대로 추가해주세요!");
						return false;
					}

					if(lat3 == '' && lat4 != ''){
						alert("경유지는 2번부터 순서대로 추가해주세요!");
						return false;
					}

					if(lat2 == '' && lat3 == '' && lat4 == ''){
						alert("경유지는 최소 1개 입력 해 주세요!");
						return false;
					}

					if(lat3 == '' && lat4 == ''){
						value = [{
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : lng2,
									"viaY" : lat2
						}]
					}

					if(lat3 != '' && lat4 == ''){
						value = [{
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : lng2,
									"viaY" : lat2
									},
									{
										"viaPointId" : "test02",
										"viaPointName" : "name02",
										"viaX" : lng3 ,
										"viaY" : lat3 
									}]

					}

					if(lat2 != '' && lat3 != '' && lat4 != ''){
						value = [{
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : lng2,
									"viaY" : lat2
									},
								
									{
										"viaPointId" : "test02",
										"viaPointName" : "name02",
										"viaX" : lng3 ,
										"viaY" : lat3 
									},
									{
										"viaPointId" : "test03",
										"viaPointName" : "name03",
										"viaX" : lng4 ,
										"viaY" : lat4 
									}]
					}

					console.log(lat3);
					console.log(lng3);
					console.log(value);

					var searchOption = $("#selectLevel").val();
					
					var headers = {}; 
					headers["appKey"]="Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd";
					headers["Content-Type"]="application/json";
					
					var param = JSON.stringify({
						"startName" : "출발지",
						"startX" : lng1,
						"startY" : lat1,
						"startTime" : "201708081103",
						"endName" : "도착지",
						"endX" : lng5,//lat5 :37.4990106lng5 : 127.0328414
						"endY" : lat5,
						"viaPoints" : value,
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"searchOption": searchOption
					});
					
					$.ajax({
							method:"POST",
							url:"https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
							headers : headers,
							async:false,
							data:param,
							success:function(response){
			
								var resultData = response.properties;
								var resultFeatures = response.features;
								
								// 결과 출력
								var tDistance = "총 거리 : " + (resultData.totalDistance/1000).toFixed(1) + "km,  ";
								var tTime = "총 시간 : " + (resultData.totalTime/60).toFixed(0) + "분,  ";
								var tFare = "총 요금 : " + resultData.totalFare + "원";
								
								$("#result").text(tDistance+tTime+tFare);
								
								//기존  라인 초기화
								
								if(resultInfoArr.length>0){
									for(var i in resultInfoArr){
										resultInfoArr[i].setMap(null);
									}
									resultInfoArr=[];
								}
								
								for(var i in resultFeatures) {
									var geometry = resultFeatures[i].geometry;
									var properties = resultFeatures[i].properties;
									var polyline_;
									
									drawInfoArr = [];
									
									if(geometry.type == "LineString") {
										for(var j in geometry.coordinates){
											// 경로들의 결과값(구간)들을 포인트 객체로 변환 
											var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
											// 포인트 객체를 받아 좌표값으로 변환
											var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
											// 포인트객체의 정보로 좌표값 변환 객체로 저장
											var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
											
											drawInfoArr.push(convertChange);
										}
			
										polyline_ = new Tmapv2.Polyline({
											path : drawInfoArr,
											strokeColor : "#FF0000",
											strokeWeight: 6,
											map : map
										});
										resultInfoArr.push(polyline_);
										
									}else{
										var markerImg = "";
										var size = "";			//아이콘 크기 설정합니다.
										
										if(properties.pointType == "S"){	//출발지 마커
											markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";	
											size = new Tmapv2.Size(24, 38);
										}else if(properties.pointType == "E"){	//도착지 마커
											markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
											size = new Tmapv2.Size(24, 38);
										}else{	//각 포인트 마커
											markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
											size = new Tmapv2.Size(8, 8);
										}
										
										// 경로들의 결과값들을 포인트 객체로 변환 
										var latlon = new Tmapv2.Point(geometry.coordinates[0], geometry.coordinates[1]);
										// 포인트 객체를 받아 좌표값으로 다시 변환
										var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);
									  	
									  	marker_p = new Tmapv2.Marker({
									  		position: new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng),
									  		icon : markerImg,
									  		iconSize : size,
									  		map:map
									  	});
									  	
									  	resultMarkerArr.push(marker_p);
									}
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
				});
			}
			
			function addComma(num) {
				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
				   return num.toString().replace(regexp, ',');
			}
		</script>
	</head>

	
	<!--<body onload="initTmap()"> 맵 생성 실행 -->
		<div id="Ttotal">
				<div id="list_wrap">
					<div id="list1">
							<button onclick="addMyPlace1(1);">출발지 추가</button>
							<button onclick="addMyPlace1(2);">2번 경유지 추가</button>
							<button onclick="addMyPlace1(3);">3번 경유지 추가</button>
							<button onclick="addMyPlace1(4);">4번 경유지 추가</button>
							<button onclick="addMyPlace1(5);">도착지 추가</button>
							<Br>
							
							BEST 3
							<br>
							<table id="bestlist">
								<tr>
									<td><input type="radio" name="pick" value="ggg"></td>
									<td>1</td>
									<td>장소명1</td>
									<td><input type="hidden" value="37.4990106"></td>
									<td><input type="hidden" value="127.0328414"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>2</td>
									<td>장소명2</td>
									<td><input type="hidden" value="37.5679514"></td>
									<td><input type="hidden" value="126.9831357"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>3</td>
									<td>장소명3</td>
									<td><input type="hidden" value="37.4890106"></td>
									<td><input type="hidden" value="127.0321514"></td>
								</tr>
							</table>

							<hr>

							전체 목록
							<br>
							<table id="allList">
								<tr>
									<td><input type="radio" name="pick" value="ggg"></td>
									<td>4</td>
									<td>장소명4</td>
									<td><input type="hidden" value="37.4990111"></td>
									<td><input type="hidden" value="126.9831357"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>5</td>
									<td>장소명5</td>
									<td><input type="hidden" value="37.5338151"></td>
									<td><input type="hidden" value="126.8969784"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>6</td>
									<td>장소명6</td>
									<td><input type="hidden" value="37.4985164"></td>
									<td><input type="hidden" value="127.0325625"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>7</td>
									<td>장소명7</td>
									<td><input type="hidden" value="37.5002218"></td>
									<td><input type="hidden" value="127.029133"></td>
								</tr>
								<tr>
									<td><input type="radio" name="pick"></td>
									<td>8</td>
									<td>장소명8</td>
									<td><input type="hidden" value="37.5546725"></td>
									<td><input type="hidden" value="126.9375613"></td>
								</tr>
							</table>
					</div>
					<div id="list2">
						선택한 코스  <button onclick="saveMyplace();">코스 저장하기</button>
						<button onclick="initTmap();">지도 조회하기</button>
						<table>
							<thead>
							</thead>
							<tbody id="list2body">
								<tr id="my1">
									<td>출발지</td>
									<td></td>
									<td></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(1);">X</button></td>
								</tr>
								<tr id="my2" class="mylist">
									<td>2번</td>
									<td></td>
									<td></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(2);">X</button></td>
								</tr>
								<tr id="my3" class="mylist">
									<td>3번</td>
									<td></td>
									<td></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(3);">X</button></td>
								</tr>
								<tr id="my4" class="mylist">
									<td>4번</td>
									<td></td>
									<td></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(4);">X</button></td>
								</tr>
								<tr id="my5" class="mylist">
									<td>도착지</td>
									<td></td>
									<td></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(5);">X</button></td>
								</tr>
							</tbody>

						</table>
					</div>
				</div>

				<script>

					function addMyPlace1(num){
						var checkbox = $("input[name=pick]:checked");
						var num1 = checkbox.parent().parent().children().eq(1).text();
						var name1 = checkbox.parent().parent().children().eq(2).text();
						var w = checkbox.parent().parent().children().eq(3).children().val();
						var g = checkbox.parent().parent().children().eq(4).children().val();
						var choice = '#my'+num;
						var choice2 = '#my'+(num-1);
						console.log(w);
						console.log(g);

						if(num1 == $(choice2).children().eq(1).text()){
							if(!confirm("이전 장소가 추가하려는 장소와 동일합니다. 계속 하시겠습니까?")){
								return false;
							} else {}
						}

						//console.log(choice2);

						$(choice).children().eq(1).text(num1);
						$(choice).children().eq(2).text(name1);
						$(choice).children().eq(3).children().val(w);
						$(choice).children().eq(4).children().val(g);

						//console.log($(choice).children().eq(3).children().val());
						//console.log($(choice).children().eq(4).children().val());


					}

					function deleteMyPlace1(num){

						var choice = '#my'+num;
						$(choice).children().eq(1).text('');
						$(choice).children().eq(2).text('');
						$(choice).children().eq(3).children().text('');
						$(choice).children().eq(4).children().text('');

					}

					function saveMyplace(){
						// 먼저 해당 회원의 저장 되어 있는 코스가 몇개인지 조회 해오기 
						// 2개 이하면 => myCourse테이블에 인서트 해주기 순서(1~5)
					}

				
				/*

				$('#bestlist').on('click', '.best', function(e){

					
					//console.log($(this));
					//console.log($(this).parent().parent().children().eq(0).text());
					var name = $(this).parent().parent().children().eq(0).text();
					var w = $(this).parent().parent().children().eq(2).text();
					var g = $(this).parent().parent().children().eq(3).text();
					console.log(name);
					console.log(w);
					console.log(g);
					
					test = '333';
					value = '';
					value += '<tr>'
						 + '<td>'+name+'</td>'
						 + '<td>'+w+'</td>'
						 + '<td>'+g+'</td>'
					     + '</tr>';
					
					console.log(value);
							 
					$('#list2body').html(value);
							 
				});
						
				*/

				</script>
				
				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
					<p id="result"></p>
					<select id="selectLevel">
						<option value="0" selected="selected">교통최적+추천</option>
						<option value="1" >교통최적+무료우선</option>
						<option value="2" >교통최적+최소시간</option>
						<option value="3" >교통최적+초보</option>
					</select>
					<button id="btn_select">적용하기</button>
				</div>
		</div>
	</body>
</html>					