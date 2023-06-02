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
			height: 1200px;
			width: 1200px;
			border: 0.1px solid sandybrown;
			box-sizing: border-box;
			text-align: center;
		}
		
		#title_wrap{
			height : 110px;
			width: 100%;
			text-align: center;
		}

		#list_wrap{
			height: 480px;
			width: 100%;
			border: 0.1px solid sandybrown;
		}

		#map_wrap{
			height: 480px;
			width: 100%;
			border: 0.1px solid sandybrown;
		}
		
		

		#list1, #list2{
			float: left;
			height: 100%;
			width: 50%;
			border: 0.1px solid sandybrown;
		}

		button{
			background-color:rgb(73, 166, 112);
			color: white;
			border: 1px rgb(73, 166, 112);
			font-size: small;
			border-radius: 5px;
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

				//console.log(lat1);
				//console.log(lat5);

				if(lat1 == '' || lat5 == ''){
						alert("출발지와 도착지를 선택 해 주세요!");
						return false;
					}

				resultMarkerArr = [];

				if(map == null){
								
				 	// 1. 지도 띄우기
					map = new Tmapv2.Map("map_div", {
						center: new Tmapv2.LatLng(lat1, lng1),
						width : "80%",
						height : "80%",
						zoom : 14,
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
					
					if(lat2 != ''){
					marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(lat2, lng2),
						icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
						iconSize : new Tmapv2.Size(24, 38),
						map:map
					});
					resultMarkerArr.push(marker);					
					}
					
					if(lat3 != ''){
					marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(lat3, lng3),
						icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
						iconSize : new Tmapv2.Size(24, 38),
						map:map
					});
					resultMarkerArr.push(marker);	
					}
					
					if(lat4 != ''){
					marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(lat4, lng4),
						icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
						iconSize : new Tmapv2.Size(24, 38),
						map:map
					});
					resultMarkerArr.push(marker);					
					}
				
				} else {
					if(confirm('지도를 새로 조회 하시겠습니까?')){
						$('#result').text('');
						
					} else {
						return false;
					}
				}
				
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
					
					//console.log(lat1);
					//console.log(lat5);
					//console.log(lat2);
					//console.log(lat3);
					//console.log(lat4);

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
									"viaX" : lat2,
									"viaY" : lng2
						}]
					}

					if(lat3 != '' && lat4 == ''){
						value = [{
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : lat2,
									"viaY" : lng2
									},
									{
										"viaPointId" : "test02",
										"viaPointName" : "name02",
										"viaX" : lat3 ,
										"viaY" : lng3 
									}]

					}

					if(lat2 != '' && lat3 != '' && lat4 != ''){
						value = [{
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : lat2,
									"viaY" : lng2
									},
								
									{
										"viaPointId" : "test02",
										"viaPointName" : "name02",
										"viaX" : lat3 ,
										"viaY" : lng3 
									},
									{
										"viaPointId" : "test03",
										"viaPointName" : "name03",
										"viaX" : lat4 ,
										"viaY" : lng4 
									}]
					}

					//console.log(lat3);
					//console.log(lng3);
					//console.log(value);

					var searchOption = $("#selectLevel").val();
					
					var headers = {}; 
					headers["appKey"]="Rm43dtLQun6kAQemZuCPLaSlRZ1ikgy14nIZvshd";
					headers["Content-Type"]="application/json";
					
					var param = JSON.stringify({
						"startName" : "출발지",
						"startX" : lat1,
						"startY" : lng1,
						"startTime" : "201708081103",
						"endName" : "도착지",
						"endX" : lat5,//lat5 :37.4990106lng5 : 127.0328414
						"endY" : lng5,
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
			<div id="title_wrap">
				<p><h4 align="center">여행 코스 짜기</h4></p>
				<hr>
				<select id="location">
					<option value="서울">서울</option>
					<option value="경기">경기도</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="전주">전주</option>
				</select>
				<select id="type">
					<option value="A">식당/카페</option>
					<option value="B">숙박</option>
					<option value="C">야외시설</option>
				</select>
			<button id="selecbtn" onclick="selectList();">조회</button>
			</div>
				<div id="list_wrap">
					<div id="list1">
							<button onclick="addMyPlace1(1);">출발지 추가</button>
							<button onclick="addMyPlace1(2);">2번 경유지 추가</button>
							<button onclick="addMyPlace1(3);">3번 경유지 추가</button>
							<button onclick="addMyPlace1(4);">4번 경유지 추가</button>
							<button onclick="addMyPlace1(5);">도착지 추가</button>
							<Br>
							
							<b>[ BEST 3 ]</b>
							<table id="bestlist">
								<thead>
									<th width="70px"></th>
									<th width="70px"></th>
									<th width="80px">선택</th>
									<th width="100px">번호</th>
									<th>장소명</th>
								</thead>
								<tbody>
								
								</tbody>
							</table>

							<hr>

							<b>[ 전체 목록  ]</b>
							<table id="allList">
								<thead>
									<th width="70px"></th>
									<th width="70px"></th>
									<th width="80px" align="center">선택</th>
									<th width="100px" align="center">번호</th>
									<th align="center">장소명</th>
								</thead>
								<tbody>
								</tbody>
								
							</table>
						</div>
					<div id="list2">
						<button onclick="saveMyCourse();">코스 저장</button>
						<button onclick="initTmap();">지도 조회</button>
						<button id="addPlace"><a data-bs-toggle="modal" data-bs-target="#placeModal">새 장소 추가</a></button>
						<br>
						<b>[ 선택한 장소  ]</b>  
						<table id="myChoiceList" align="center">
							<thead>
								<th width="70px">순번</th>
								<th width="70px">장소번호</th>
								<th width="300px">장소명</th>
								<th></th>
								<th></th>
								<th>삭제</th>
							</thead>
							<tbody>
								<tr id="my1">
									<td><b>출발지 :</b></td>
									<td id="pn1"></td>
									<td class="placeName"></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(1);">X</button></td>
								</tr>
								<tr id="my2" class="mylist">
									<td><b>2번 :</b></td>
									<td id="pn2"></td>
									<td class="placeName"></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(2);">X</button></td>
								</tr>
								<tr id="my3" class="mylist">
									<td><b>3번 :</b></td>
									<td id="pn3"></td>
									<td class="placeName"></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(3);">X</button></td>
								</tr>
								<tr id="my4" class="mylist">
									<td><b>4번 :</b></td>
									<td id="pn4"></td>
									<td class="placeName"></td>
									<td><input type="hidden" value=""></td>
									<td><input type="hidden" value=""></td>
									<td><button onclick="deleteMyPlace1(4);">X</button></td>
								</tr>
								<tr id="my5" class="mylist">
									<td><b>도착지 :</b></td>
									<td id="pn5"></td>
									<td class="placeName"></td>
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
						var pnum = checkbox.parent().parent().children().eq(3).text();
						var pname = checkbox.parent().parent().children().eq(4).text();
						var w = checkbox.parent().parent().children().eq(0).children().val();
						var g = checkbox.parent().parent().children().eq(1).children().val();
						var choice = '#my'+num;
						var choice2 = '#my'+(num-1);
						//console.log(w);
						//console.log(g);
						//console.log(pnum);
						//console.log(pname);
						//console.log(choice);

						if(pnum !='' && pnum == $(choice2).children().eq(1).text()){
							if(!confirm("이전 장소가 추가하려는 장소와 동일합니다. 계속 하시겠습니까?")){
								return false;
							} else {}
						}

						$(choice).children().eq(1).text(pnum);
						$(choice).children().eq(2).text(pname);
						$(choice).children().eq(3).children().val(w);
						$(choice).children().eq(4).children().val(g);
						
						if(pnum != ''){
							$('.placeName').click(function(){
								$('#placeDetailModal').modal("show");
								var placeNo = $(this).prev().text();
								console.log(placeNo);
								placedetail(placeNo);
							})
						}
					}

					function deleteMyPlace1(num){

						var choice = '#my'+num;
						$(choice).children().eq(1).text('');
						$(choice).children().eq(2).text('');
						$(choice).children().eq(3).children().text('');
						$(choice).children().eq(4).children().text('');

					}

					function saveMyCourse(){
						// 먼저 해당 회원의 저장 되어 있는 코스가 몇개인지 조회 해오기 
						// 2개 이하면 => myCourse테이블에 인서트 해주기 순서(1~5)
						console.log('${loginMember.memId}');
						$.ajax({
							url :'checkMyCourse',
							data : { memId : '${loginMember.memId}'},
							success : function(result){
								console.log(result);
								console.log($('#pn1').val());
								console.log($('#pn2').val());
								console.log($('#pn3').val());
								console.log($('#pn4').val());
								console.log($('#pn5').val());
								
								if(result == 9){
									if(confirm('이미 3개의 코스를 저장하셨습니다. 내 코스 페이지로 이동하시겠습니까?')){
										href="#"
									} 
								} else {
									
									var courseSe;
									if(result == 0 || result == 8) courseSe = 1;
									else if(result == 1 || result == 6) courseSe = 3;
									else courseSe = 5;
									
									console.log('courseSe : ' + courseSe);

									$.ajax({
										url : 'saveMyCourse',
										data : { courseSe : courseSe,
												memId : '${ loginMember.memId }',
												placeNo1 : $('#pn1').text(),
												placeNo2 : $('#pn2').text(),
												placeNo3 : $('#pn3').text(),
												placeNo4 : $('#pn4').text(),
												placeNo5 : $('#pn5').text()
										},
										success : function(result){
											console.log(result);
											if(result == 'S'){
												alert('코스 저장에 성공했습니다.');
												$('#myChoice'>tbody>tr).children().eq(1).text('');
												$('#myChoice'>tbody>tr).children().eq(1).text('');
											} else {
												alert('코스 저장에 실패했습니다.');
											}
											
										},
										error : function(){
											console.log('실패 ㅠㅠ');
										}
									})
								}
							},
							error : function(){
								console.log('실패');
							}
							})
						}

						function selectList(){

							$.ajax({
								url : "placeAllList",
								data : { placeLocation : $('#location').val(),
										placeType : $('#type').val()},
								success : function(result){
									console.log('전체는 성공!');
									console.log(result);
									let placeList ='';
									for(let i in result){
										placeList+= '<tr>'
												+ '<td>'+'<input type="hidden" value="'+result[i].placeLng+'">'+'</td>'
												+ '<td>'+'<input type="hidden" value="'+result[i].placeLat+'">'+'</td>'
												+ '<td>' + '<input type="radio" name="pick">' + '</td>'
												+ '<td>'+ result[i].placeNo+ '</td>'
												+ '<td class="placeName">'+ result[i].placeName + '<td>'
												+ '</tr>'
									}
									$('#allList>tbody').html(placeList);
									$('#allList>tbody>tr>.placeName').click(function(){
										$('#placeDetailModal').modal("show");
										var placeNo = $(this).prev().text();
										//console.log(placeNo);
										placedetail(placeNo);
									})
								},
								error : function(){
									console.log('전체 리스트 조회 실패');
								}
							})


							$.ajax({
								url : "placeBestList",
								data : {placeLocation : $('#location').val(),
										placeType : $('#type').val()},
								success : function(result){
									let bestList = '';
									console.log('베스트도 성공');
									for(let i in result){	
										bestList += '<tr>'
												+ '<td>'+'<input type="hidden" value="'+result[i].placeLng+'">'+'</td>'
												+ '<td>'+'<input type="hidden" value="'+result[i].placeLat+'">'+'</td>'
												+ '<td>' + '<input type="radio" name="pick">' + '</td>'
												+ '<td>'+ result[i].placeNo+ '</td>'
												+ '<td class="placeName">'+ result[i].placeName + '<td>'
												+ '</tr>'
									}
									$('#bestlist>tbody').html(bestList);
									$('.placeName').click(function(){
										$('#placeDetailModal').modal("show");
										var placeNo = $(this).prev().text();
										console.log(placeNo);
										placedetail(placeNo);
									})
								},
								error : function(){
									console.log('베스트 리스트 조회 실패');
								}
							})
						}
						
						function placedetail(placeNo){
							
							console.log(placeNo);
							
						 	$.ajax({
									url : 'detail.place',
									data : { placeNo : placeNo },
									success : function(result){
										console.log(result);
										if(result.changeName != null){
											value = '<img src="/withpet/' + result.changeName + '">';
											$('#photo').html(value);
										}
										$('#placeName').text(result.placeName);
										$('#placeCount').text(result.placeCount);
										$('#placeLocation').text(result.placeLocation);
										$('#placePhone').text(result.placePhone);
										$('#placeInfo').html(result.placeInfo);
									},
									error : function(){
										console.log('상세 페이지 내용 불러오기 실패 ')
									}
								})
	
						}

				</script>
				
				<div id="map_wrap" class="map_wrap">
					<div id="map_div">

						<p id="result"></p>
						<select id="selectLevel">
							<option value="0" selected="selected">교통최적+추천</option>
							<option value="1" >교통최적+무료우선</option>
							<option value="2" >교통최적+최소시간</option>
							<option value="3" >교통최적+초보</option>
						</select>
						<button id="btn_select">거리 조회</button>
					</div>
				</div>
		</div>
	
	
	<!-- 모달 창 -->
	<div class="modal fade" id="placeDetailModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>상세 정보</b></p>
            <br>
             <table width="100%" style="text-align:center">
             	 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;" colspan="2" id="photo">
                    	
                    </td>
                 </tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;">분류 : </td>
                    <td id="placeType"></td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">장소명 : </td>
                     <td width="100" id="placeName"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">저장된 수 : </td>
                     <td width="100" id="placeCount"></td>
                </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">주소 : </td>
                     <td id="placeLocation"></td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px">연락처 : </td>
                    <td id="placePhone"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr>
                     <td style="font-size:13px; color:gray; width: 30px">상세 정보 : </td>
                     <td>
                        <textarea id="placeInfo" style="resize: none; border:solid 1px lightgray; width: 90%; height: 200px;" readonly></textarea>
                    </td>
                </tr>
            
             </table>
       </div>
     </div>
   </div>
 </div>

	
	<jsp:include page="insertPlace.jsp" />
	<!-- <jsp:include page="placeDetail.jsp" /> -->
	</body>
</html>