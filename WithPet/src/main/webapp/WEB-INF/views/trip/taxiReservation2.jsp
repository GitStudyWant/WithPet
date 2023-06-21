<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>택시 예약하기 화면 </title>
<jsp:include page="../common/header.jsp"/>
	
	<style>
		#total_wrap{
			margin: auto;
			width: 1200px;
			/*border: 0.1px solid sandybrown;*/
			box-sizing: border-box;
			text-align: center;
		}
		
		#title_wrap{
			height : 80px;
			width: 100%;
			text-align: center;
			margin: 0px;
			/*border: 0.1px solid sandybrown;*/
		}
		
		#content_wrap{
			height : 200px;
			width: 100%;
			text-align: center;
			/*border: 0.1px solid sandybrown;*/
		}

		#tmap_wrap{
			height: 480px;
			width: 100%;
			/*border: 0.1px solid sandybrown;*/
			text-align: center;
			align : center;
			margin: auto;
		}
		
		#map_div{
			
			align : center;
			margin-left : 270px;
		}
		
			button{
			background-color:rgb(73, 166, 112);
			color: white;
			border: 1px rgb(73, 166, 112);
			font-size:small;
			border-radius:7px;
		}
		
		 input::placeholder { font-size: 90%; }
		
		
	
	</style>
		
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<!-- 티맵 api용 -->
		<!-- <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
		<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd"></script>
		<script type="text/javascript">
			var map;
			var markerInfo;
			//출발지,도착지 마커
			var marker_s, marker_e, marker_p;
			//경로그림정보
			var drawInfoArr = [];
			var drawInfoArr2 = [];
		
			var chktraffic = [];
			var resultdrawArr = [];
			var resultMarkerArr = [];
		
			function initTmap() {
		
				// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(37.49241689559544, 127.03171389453507),
					width : "70%",
					height : "400px",
					zoom : 11,
					zoomControl : true,
					scrollwheel : true
				});
		
				// 3. 경로탐색 API 사용요청
				$("#btn_select")
						.click(
								function() {
									
									if($('#findS').val() == '' || $('#findE').val() == ''){
										alert("출발지 도착지를 먼저 입력해주세요!");
										return false;
									}
									
									if($("#result").text() != ''){
										if(confirm("이미 조회한 경로가 있습니다. 초기화 하시겠습니까?")){
											location.href=location.href;
										} else {
											return false;
										}
									}
									
									if($('#findS').val() == $('#findE').val()){
										alert("출발지 도착지를 동일하게 입력하셨습니다.");
										return false;
									}
									
									
									
									
									marker_s = new Tmapv2.Marker(
											{
												position : new Tmapv2.LatLng($('#s_lat').val(),
														$('#s_lng').val()),
												icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
												iconSize : new Tmapv2.Size(24, 38),
												map : map
											});
							
									//도착
									marker_e = new Tmapv2.Marker(
											{
												position : new Tmapv2.LatLng($('#e_lat').val(),
														$('#e_lng').val()),
												icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
												iconSize : new Tmapv2.Size(24, 38),
												map : map
											});
									

									//기존 맵에 있던 정보들 초기화
									resettingMap();
		
									var searchOption = $("#selectLevel").val();
		
									var trafficInfochk = $("#year").val();
									var headers = {}; 
										headers["appKey"]="Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd";

									//JSON TYPE EDIT [S]
									$.ajax({
										type : "POST",
										headers : headers,
										url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result&appKey=Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd",
										async : false,
										data : {
											"startX" : $('#s_lng').val(),
											"startY" : $('#s_lat').val(),
											"endX" : $('#e_lng').val(),
											"endY" : $('#e_lat').val(),
											"reqCoordType" : "WGS84GEO",
											"resCoordType" : "EPSG3857",
											"searchOption" : searchOption,
											"trafficInfo" : trafficInfochk
										},
										success : function(response) {

											var resultData = response.features;

											var tDistance = "총 거리 : "
													+ (resultData[0].properties.totalDistance / 1000)
															.toFixed(1) + "km,";
											var tTime = " 총 시간 : "
													+ (resultData[0].properties.totalTime / 60)
															.toFixed(0) + "분,";
											var tFare = " 총 요금 : "
													+ resultData[0].properties.totalFare
													+ "원,";
											var taxiFare = " 예상 택시 요금 : "
													+ resultData[0].properties.taxiFare
													+ "원";

											$("#result").text(
													tDistance + tTime
															+ taxiFare);

											//교통정보 표출 옵션값을 체크
											if (trafficInfochk == "Y") {
												for ( var i in resultData) { //for문 [S]
													var geometry = resultData[i].geometry;
													var properties = resultData[i].properties;

													if (geometry.type == "LineString") {
														//교통 정보도 담음
														chktraffic
																.push(geometry.traffic);
														var sectionInfos = [];
														var trafficArr = geometry.traffic;

														for ( var j in geometry.coordinates) {
															// 경로들의 결과값들을 포인트 객체로 변환 
															var latlng = new Tmapv2.Point(
																	geometry.coordinates[j][0],
																	geometry.coordinates[j][1]);
															// 포인트 객체를 받아 좌표값으로 변환
															var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																	latlng);

															sectionInfos
																	.push(convertPoint);
														}

														drawLine(sectionInfos,
																trafficArr);
													} else {

														var markerImg = "";
														var pType = "";

														if (properties.pointType == "S") { //출발지 마커
															markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
															pType = "S";
														} else if (properties.pointType == "E") { //도착지 마커
															markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
															pType = "E";
														} else { //각 포인트 마커
															markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
															pType = "P"
														}

														// 경로들의 결과값들을 포인트 객체로 변환 
														var latlon = new Tmapv2.Point(
																geometry.coordinates[0],
																geometry.coordinates[1]);
														// 포인트 객체를 받아 좌표값으로 다시 변환
														var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																latlon);

														var routeInfoObj = {
															markerImage : markerImg,
															lng : convertPoint._lng,
															lat : convertPoint._lat,
															pointType : pType
														};
														// 마커 추가
														addMarkers(routeInfoObj);
													}
												}//for문 [E]

											} else {

												for ( var i in resultData) { //for문 [S]
													var geometry = resultData[i].geometry;
													var properties = resultData[i].properties;

													if (geometry.type == "LineString") {
														for ( var j in geometry.coordinates) {
															// 경로들의 결과값들을 포인트 객체로 변환 
															var latlng = new Tmapv2.Point(
																	geometry.coordinates[j][0],
																	geometry.coordinates[j][1]);
															// 포인트 객체를 받아 좌표값으로 변환
															var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																	latlng);
															// 포인트객체의 정보로 좌표값 변환 객체로 저장
															var convertChange = new Tmapv2.LatLng(
																	convertPoint._lat,
																	convertPoint._lng);
															// 배열에 담기
															drawInfoArr
																	.push(convertChange);
														}
														drawLine(drawInfoArr,
																"0");
													} else {

														var markerImg = "";
														var pType = "";

														if (properties.pointType == "S") { //출발지 마커
															markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
															pType = "S";
														} else if (properties.pointType == "E") { //도착지 마커
															markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
															pType = "E";
														} else { //각 포인트 마커
															markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
															pType = "P"
														}

														// 경로들의 결과값들을 포인트 객체로 변환 
														var latlon = new Tmapv2.Point(
																geometry.coordinates[0],
																geometry.coordinates[1]);
														// 포인트 객체를 받아 좌표값으로 다시 변환
														var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																latlon);

														var routeInfoObj = {
															markerImage : markerImg,
															lng : convertPoint._lng,
															lat : convertPoint._lat,
															pointType : pType
														};

														// Marker 추가
														addMarkers(routeInfoObj);
													}
												}//for문 [E]
											}
										},
										error : function(request, status, error) {
											console.log("code:"
													+ request.status + "\n"
													+ "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									});
							//JSON TYPE EDIT [E]
						});
			}
		
			function addComma(num) {
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
		
			//마커 생성하기
			function addMarkers(infoObj) {
				var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.
		
				if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
					size = new Tmapv2.Size(8, 8);
				}
		
				marker_p = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
					icon : infoObj.markerImage,
					iconSize : size,
					map : map
				});
		
				resultMarkerArr.push(marker_p);
			}
		
			//라인그리기
			function drawLine(arrPoint, traffic) {
				var polyline_;
		
				if (chktraffic.length != 0) {
		
					// 교통정보 혼잡도를 체크
					// strokeColor는 교통 정보상황에 다라서 변화
					// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)
		
					var lineColor = "";
		
					if (traffic != "0") {
						if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시
		
							lineColor = "#06050D";
							//라인그리기[S]
							polyline_ = new Tmapv2.Polyline({
								path : arrPoint,
								strokeColor : lineColor,
								strokeWeight : 6,
								map : map
							});
							resultdrawArr.push(polyline_);
							//라인그리기[E]
						} else { //교통정보가 있음
		
							if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
								var trafficObject = "";
								var tInfo = [];
		
								for (var z = 0; z < traffic.length; z++) {
									trafficObject = {
										"startIndex" : traffic[z][0],
										"endIndex" : traffic[z][1],
										"trafficIndex" : traffic[z][2],
									};
									tInfo.push(trafficObject)
								}
		
								var noInfomationPoint = [];
		
								for (var p = 0; p < tInfo[0].startIndex; p++) {
									noInfomationPoint.push(arrPoint[p]);
								}
		
								//라인그리기[S]
								polyline_ = new Tmapv2.Polyline({
									path : noInfomationPoint,
									strokeColor : "#06050D",
									strokeWeight : 6,
									map : map
								});
								//라인그리기[E]
								resultdrawArr.push(polyline_);
		
								for (var x = 0; x < tInfo.length; x++) {
									var sectionPoint = []; //구간선언
		
									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
										sectionPoint.push(arrPoint[y]);
									}
		
									if (tInfo[x].trafficIndex == 0) {
										lineColor = "#06050D";
									} else if (tInfo[x].trafficIndex == 1) {
										lineColor = "#61AB25";
									} else if (tInfo[x].trafficIndex == 2) {
										lineColor = "#FFFF00";
									} else if (tInfo[x].trafficIndex == 3) {
										lineColor = "#E87506";
									} else if (tInfo[x].trafficIndex == 4) {
										lineColor = "#D61125";
									}
		
									//라인그리기[S]
									polyline_ = new Tmapv2.Polyline({
										path : sectionPoint,
										strokeColor : lineColor,
										strokeWeight : 6,
										map : map
									});
									//라인그리기[E]
									resultdrawArr.push(polyline_);
								}
							} else { //0부터 시작하는 경우
		
								var trafficObject = "";
								var tInfo = [];
		
								for (var z = 0; z < traffic.length; z++) {
									trafficObject = {
										"startIndex" : traffic[z][0],
										"endIndex" : traffic[z][1],
										"trafficIndex" : traffic[z][2],
									};
									tInfo.push(trafficObject)
								}
		
								for (var x = 0; x < tInfo.length; x++) {
									var sectionPoint = []; //구간선언
		
									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
										sectionPoint.push(arrPoint[y]);
									}
		
									if (tInfo[x].trafficIndex == 0) {
										lineColor = "#06050D";
									} else if (tInfo[x].trafficIndex == 1) {
										lineColor = "#61AB25";
									} else if (tInfo[x].trafficIndex == 2) {
										lineColor = "#FFFF00";
									} else if (tInfo[x].trafficIndex == 3) {
										lineColor = "#E87506";
									} else if (tInfo[x].trafficIndex == 4) {
										lineColor = "#D61125";
									}
		
									//라인그리기[S]
									polyline_ = new Tmapv2.Polyline({
										path : sectionPoint,
										strokeColor : lineColor,
										strokeWeight : 6,
										map : map
									});
									//라인그리기[E]
									resultdrawArr.push(polyline_);
								}
							}
						}
					} else {
		
					}
				} else {
					polyline_ = new Tmapv2.Polyline({
						path : arrPoint,
						strokeColor : "#DD0000",
						strokeWeight : 6,
						map : map
					});
					resultdrawArr.push(polyline_);
				}
		
			}
		
			//초기화 기능
			function resettingMap() {
				//기존마커는 삭제
				marker_s.setMap(null);
				marker_e.setMap(null);
		
				if (resultMarkerArr.length > 0) {
					for (var i = 0; i < resultMarkerArr.length; i++) {
						resultMarkerArr[i].setMap(null);
					}
				}
		
				if (resultdrawArr.length > 0) {
					for (var i = 0; i < resultdrawArr.length; i++) {
						resultdrawArr[i].setMap(null);
					}
				}
		
				chktraffic = [];
				drawInfoArr = [];
				resultMarkerArr = [];
				resultdrawArr = [];
			}
		</script>
	</head>
	<body onload="initTmap();">
		<div id=Total_wrap>
			<div id="title_wrap">
			<p><h4 align="center">교통 예약하기</h4><p>
			
			</div>
			<div id="content_wrap">
			<br>
		출발지 : <input type="text" id="findS" placeholder="예시 :서울시 중구 남대문로 120 대일빌딩" style="width:300px;"> <button class="findxy">확인</button>
		<input type="hidden" id="s_lat">
		<input type="hidden" id="s_lng"> <br>
		도착지 : <input type="text" id="findE" placeholder="예시 :서울시 중구 남대문로 120 대일빌딩" style="width:300px;"> <button class="findxy">확인</button>
		<input type="hidden" id="e_lat">
		<input type="hidden" id="e_lng">
		<br>
		<br>
		<button id="btn_select" disabled style="background-color : gray;">예상 거리 및 비용 확인 하기</button>
		<button id="goTReservation">택시 예약 하기</button>
		<button id="goCReservation">렌터카 예약 하기</button>
		<button id="reset">새로 고침</button>
		<br><br>
			<p><b id="result"></b></p>
			</div>
			<div id="tmap_wrap">
				<div class="ft_area">
					<div class="ft_select_wrap">
						<div class="ft_select">
							<select id="selectLevel">
								<option value="0" selected="selected">교통최적+추천</option>
								<option value="1">교통최적+무료우선</option>
								<option value="2">교통최적+최소시간</option>
								<option value="3">교통최적+초보</option>
								<option value="4">교통최적+고속도로우선</option>
								<option value="10">최단거리+유/무료</option>
								<option value="12">이륜차도로우선</option>
								<option value="19">교통최적+어린이보호구역 회피</option>
							</select> <select id="year">
								<option value="N" selected="selected">교통정보 표출 옵션</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</div>
					</div>
					<div class="map_act_btn_wrap clear_box"></div>
					<div class="clear"></div>
				</div>
			
				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
				</div>
				<div class="map_act_btn_wrap clear_box"></div>
				
				
		
				</div>
			</div>
			
			
<script>

$(function(){
	
	
})
	
	
	$('.findxy').click(function(){
		var clickbtn = $(this);
	
		$.ajax({
			url : 'findXY',
			data : {location : clickbtn.prev().val()},
			success : function(result){
				console.log('성공');
				//console.log(result.results[0].geometry.location.lat);
				//console.log(result.results[0].geometry.location.lng);
				let lat = result.results[0].geometry.location.lat;
				let lng = result.results[0].geometry.location.lng;
				clickbtn.next().val(lat);
				clickbtn.next().next().val(lng);
				console.log($('#s_lat').val());
				console.log($('#e_lat').val());
				
				if($('#s_lat').val() != '' && $('#e_lat').val() != ''){
					
					alert('출발지, 도착지 확인이 완료 되었습니다.');
					$('#btn_select').attr('disabled',false).css('background-color','rgb(73, 166, 112)');
					
				} else {
					
					
				}
			},
			errorr : function(){
				consol.log('실패 ㅠㅠ')
			}
		})
	})
	
	$('#reset').click(function(){
		if(confirm('출발지, 도착지를 초기화 하시겠습니까?')){
			$('#findS').val('');
			$('#findE').val('');
			$('#s_lat').val('');
			$('#s_lng').val('');
			$('#e_lat').val('');
			$('#e_lng').val('');
			
			$('#btn_select').attr('disabled',true).css('background-color','gray');
		}
	})
	
	$('#goTReservation').click(function(){
		 $('#goResTaxi').modal("show");	
			$('#findS2').val($('#findS').val());
			$('#findE2').val($('#findE').val());
		 
	})
	
	$('#goCReservation').click(function(){
		$('#goResCar').modal("show");
		
	})
	
</script>




<script>
	
	$(function(){
		$('#taxiRDate').datepicker({
			dateFormat: 'dd/mm/yy',
			minDate: +1
		});
		
		$('#taxiRDate').click(function(){
			$('#taxiRDate').datepicker({
			});
			var choiceDate = $('#taxiRDate').val();
		})
		
		
		$('#startDate').datepicker({
			dateFormat: 'dd/mm/yy',
			minDate: +1
		});
		
		$('#startDate').click(function(){
			$('#startDate').datepicker({
			});
			var startDate = $('#startDate').val();
		})
		
		$('#endDate').datepicker({
			dateFormat: 'dd/mm/yy'
			,minDate: +1
		});
		
		$('#endDate').click(function(){
			$('#endDate').datepicker({
			});
			var endDate = $('#endDate').val();
		})
		
		$('#checkTR').click(function(){
			
			var choiceDate = $('#taxiRDate').val();
			if(choiceDate == ''){
				alert('날짜를 선택해주세요!');
				return false;
			}
			else{
			
			$.ajax({
					url : 'checkTReservation',
					data : { 
							 taxiRDate : choiceDate,
							 trType2 : $('input[name=trType2]:checked').val(),
							 taxiRTime : $('#taxiRTime').val()},
					success : function(result){
						if(result == "Yes"){
							alert('예약이 가능합니다.');
							$('#submitBtn').attr('disabled',false).css('background-color','rgb(73, 166, 112)')
						} else {
							alert('선택하신 차량은 해당 날짜와 시간에 이미 예약이 다 완료되었습니다.')
						}
					},
					error : function(){
						console.log('택시 예약 가능 시간 조회 실패ㅜㅡ ')
					}
				});
			}
		})

		
		$('#checkCR').click(function(){
			
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			//console.log(startDate);
			//console.log(endDate);
			//console.log($('input[name=trType2]:checked').val());
			var value = '';
			
			var date1 = new Date($("#startDate").datepicker("getDate"));
		    var date2 = new Date($("#endDate").datepicker("getDate"));
		    var date3 = date2.getDate() - date1.getDate();
		    //console.log(date4);
		    //var date4 = new Date(date1.)
		    //console.log(date3);
			//console.log(date1);
			//console.log(date2);
			if(date2 - date1 < 0){
				alert('종료 날짜는 시작 날짜보다 이전일 수 없습니다. 올바른 날짜를 선택 해 주세요.');
				return false;
			} else {
				
				$.ajax({
					
					url : 'checkCReservation',
					data : { 
							 startDate : startDate,
							 endDate : endDate,
							 trType22 : $('input[name=trType22]:checked').val()
							},
					success : function(result){
						console.log($('input[name=trType22]:checked').val());
						console.log(result);
						if(result.trFee == 0){
							alert('선택하신 차량은 해당 날짜에 이미 예약이 다 완료되었습니다.');
							$('#paymentChk').html('');
						} else {
							alert('예약이 가능 합니다.');
							console.log(result);
							$('#submitBtn2').attr('disabled',false).css('background-color','rgb(73, 166, 112)');
							value += '<p style="font-size: 13px;">'+'<b>'+'1일 렌트 비용은 ' + result.trFee +'원, 총 비용은' + (result.trFee)*(date3) + '원 입니다.' +'</b>'+'</p>';
							$('#paymentChk').html(value);
							$('#trNo').val(result.trNo);
							console.log(value);
							console.log($('#trNo').val());
						}
					},
					error : function(){
						console.log('렌터카 예약 가능 여부 조회 실패ㅜㅡ ');
					}
				});
				
			}
		
		})
	
	})
		
		function validate_1(){
			
			var regExp1 = /^[0-9]{16}$/;
			var regExp2 = /^[0-2][0-9][0-9][0-9]$/;
			var cardNo = $('#trCardNo').val();
			console.log(cardNo);
			var expireDay = $('#expireDay').val();
			console.log(expireDay);
			
			if(!regExp1.test(cardNo)){
				alert('카드번호 16자리를 올바르게 입력해주세요.');
				return false;
			}
			
			else if(!regExp2.test(expireDay)){
				alert('유효기간 4자리를 올바르게 입력해주세요 (월연도)');
				return false;
			} else {
				return true;
			}
	
		}

	
</script>


	<!-- 택시 모달 창 -->
	<div class="modal fade" id="goResTaxi" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>택시 예약하기</b></p>
            <br>
            <form action="taxiReservation" method="POST">
            <input type="hidden" name="memId" id="memId" value="${ loginMember.memId }">
             <table width="100%" style="text-align:center">
                 <tr>
                    <td style="font-size:13px; color:gray; height: 10px; width: 70px">종류 선택 : </td> 
                    <td style="font-size:13px; color:gray; width: 75%"><input type="radio" name="trType2" value="J" checked> 중형세단   
                    	<input type="radio" name="trType2" value="D"> 대형 세단 <input type="radio" name="trType2" value="S"> SUV </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width: 70px">날짜 선택 : </td>
                     <td width="100"><input autocomplete="off" type="text" name="taxiRDate" id="taxiRDate" style="width:75%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width: 70px">시간 선택 : </td>
                     <td width="100">
                     	<select style="width:75%; border:solid 1px lightgray" name="taxiRTime" id="taxiRTime">
                     		<option style="font-size:90%; color:gray;" value="1">06:00~07:00</option>  
                     		<option style="font-size:90%; color:gray;" value="2">07:00~08:00</option>  
                     		<option style="font-size:90%; color:gray;" value="3">08:00~09:00</option>  
                     		<option style="font-size:90%; color:gray;" value="4">09:00~10:00</option>  
                     		<option style="font-size:90%; color:gray;" value="5">10:00~11:00</option>  
                     		<option style="font-size:90%; color:gray;" value="6">11:00~12:00</option>  
                     		<option style="font-size:90%; color:gray;" value="7">12:00~13:00</option>  
                     		<option style="font-size:90%; color:gray;" value="8">13:00~14:00</option>  
                     		<option style="font-size:90%; color:gray;" value="9">14:00~15:00</option>  
                     		<option style="font-size:90%; color:gray;" value="10">15:00~16:00</option>  
                     		<option style="font-size:90%; color:gray;" value="11">16:00~17:00</option>  
                     		<option style="font-size:90%; color:gray;" value="12">17:00~18:00</option>  
                     		<option style="font-size:90%; color:gray;" value="13">18:00~19:00</option>  
                     		<option style="font-size:90%; color:gray;" value="14">19:00~20:00</option>  
                     		<option style="font-size:90%; color:gray;" value="15">20:00~21:00</option>  
                     		<option style="font-size:90%; color:gray;" value="16">21:00~22:00</option>  
                     		<option style="font-size:90%; color:gray;" value="17">22:00~23:00</option>  
                     		<option style="font-size:90%; color:gray;" value="18">23:00~24:00</option>  	
                     	</select>
                     	
                     </td>
                </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 70px">출발지 : </td>
                     <td><input type="text" readonly id="findS2" style="width:75%; border:solid 1px lightgray"></td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 70px">도착지 : </td>
                    <td><input type="text" readonly id="findE2" style="width:75%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                
                <tr>
                	<td style="width: 50px" colspan="2"><button type="button" id="checkTR">예약 가능 여부 조회하기 </button><td>
                </tr>
                
                </table>
                
                <p style="font-size:15px; text-align:center;">*배정 기사님이 미리 연락 드릴 예정입니다.
                <p style="font-size:15px; text-align:center;">*예약취소는 예약일 1일전까지 가능 합니다.</p>
              
             <button type="submit" style="margin-left: 200px; background-color:gray" disabled id="submitBtn">예약하기</button>
            </form>
       </div>
     </div>
   </div>
 </div>
	
	
	<!-- 렌터카 모달 창 -->
	<div class="modal fade" id="goResCar" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>렌터카 예약하기</b></p>
            <br>
            <form action="carReservation" method="POST">
            <input type="hidden" name="memId" id="memId" value="${ loginMember.memId }">
            <input type="hidden" name="trNo" id="trNo">
             <table width="100%" style="text-align:center">
                 <tr>
                    <td style="font-size:13px; color:gray; height: 10px; width:70px">종류 선택 : </td> 
                    <td style="font-size:13px; color:gray; width: 75%;"><input type="radio" name="trType22" value="J" checked> 중형세단   
                    	<input type="radio" name="trType22" value="D"> 대형 세단 <input type="radio" name="trType22" value="S"> SUV </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width:70px">시작 날짜  : </td>
                     <td><input type="text" autocomplete="off" name="startDate" id="startDate" style="width:75%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width:70px">종료 날짜 : </td>
                     <td><input type="text" autocomplete="off" name="endDate" id="endDate" style="width:75%; border:solid 1px lightgray"></td>
                </tr>
                 <tr style="height: 10px;"></tr>    
                <tr>
                	<td style="width: 50px" colspan="2"><button type="button" id="checkCR" style="margin-left: 50px;">예약 가능 여부 조회하기 </button><td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr>
                	<td style="width: 50px" colspan="2" id="paymentChk"><td>
                </tr>
                <tr style="margin-top:5px">
                	<td height="25" style="font-size:13px; color:gray; width:70px">카드번호  : </td>
                    <td><input type="text" name="trCardNo" id="trCardNo" style="width:75%; border:solid 1px lightgray" placeholder="예시 : 1234111122223333"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="margin-top:5px">
                	<td height="25" style="font-size:13px; color:gray; width:70px">유효기간 : </td>
                    <td><input type="text" id="expireDay" style="width:75%; border:solid 1px lightgray" placeholder="예시 : 0924 (월연도)"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                </table>
                
                <p style="font-size:15px; text-align:center;">*미리 관련 내용 안내드릴 예정입니다.
                <p style="font-size:15px; text-align:center;">*예약취소는 예약일 1일전까지 가능 합니다.</p>
              
             <button type="submit" style="margin-left: 200px; background-color:gray" disabled id="submitBtn2" onclick= "return validate_1();">예약하기</button>
            </form>
       </div>
     </div>
   </div>
 </div>
 
</body>
</html>