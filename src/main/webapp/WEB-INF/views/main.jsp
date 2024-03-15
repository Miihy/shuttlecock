<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shuttle Cock</title>
    <link rel="stylesheet" href="/css/mainstyle.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<!-- wrap -->
 <div id="wrap">
 
 	  <!-- header -->
 	  <%@ include file="../views/include/header.jsp"%>

	  <!-- main -->
      <main id="main">
        <div id="slider">
          <div class="imageWrap"></div>
        </div>

        <section id="contents1">
          <div class="notice">
            <div class="container2">
	            <div class="page-title">
	              	<div class="vline"></div>
	                <h3>커뮤니티 게시판</h3>
	              	<a href="/Freeboard/freeList" class="more1">더보기+</a>
              	</div>
            </div>

            <div id="board-list">
              <div class="container3">
                <table class="board-table">
                  <thead>
                    <tr>
                      <th scope="col" class="th-num">번호</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date">등록일</th>
                    </tr>
                  </thead>
                  <c:choose>
					<c:when test="${not empty freePosts}">
						<c:forEach items="${freePosts}" var="post" varStatus="s">
		                  <tbody>
		                    <tr>
		                      <td>${fn:length(freePosts) - s.count + 1}</td>
		                      <th>
		                        <a href="#!"
		                          >${post.title}</a
		                        >
		                        <p>테스트</p>
		                      </th>
		                      <td><fmt:formatDate value="${post.regdate}" pattern="yyyy.MM.dd"/></td>
		                    </tr>
		                   </tbody>
		                 </c:forEach>
                      </c:when>
                    </c:choose>
                    <!-- <tr>
                      <td>4</td>
                      <th>
                        <a href="#!"
                          >[공지사항] 개인정보 처리방침 변경안내처리방침</a
                        >
                        <p>테스트</p>
                      </th>
                      <td>2017.07.13</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <th>
                        <a href="#!"
                          >[공지사항] 개인정보 처리방침 변경안내처리방침</a
                        >
                        <p>테스트</p>
                      </th>
                      <td>2017.07.13</td>
                    </tr>

                    <tr>
                      <td>2</td>
                      <th>
                        <a href="#!"
                          >공지사항 안내입니다. 이용해주셔서 감사합니다</a
                        >
                      </th>
                      <td>2017.06.15</td>
                    </tr>

                    <tr>
                      <td>1</td>
                      <th>
                        <a href="#!"
                          >공지사항 안내입니다. 이용해주셔서 감사합니다</a
                        >
                      </th>
                      <td>2017.06.15</td>
                    </tr>
                  </tbody> -->
                </table>
              </div>
            </div>
          </div>
          
          <div class="league">
            <div class="page-title">
              <div class="vline"></div>
              <div class="container2">
                <h3>리그 게시판</h3>
                <a href="/LeagueBoard" class="more2">더보기+</a>
              </div>
            </div>

            <div id="board-list">
              <div class="container3">
                <table class="board-table">
                  <thead>
                    <tr>
                      <th scope="col" class="th-num">번호</th>
                      <th scope="col" class="th-title">제목</th>
                      <th scope="col" class="th-date">등록일</th>
                    </tr>
                  </thead>
                  <c:choose>
					<c:when test="${not empty leaguePosts}">
						<c:forEach items="${leaguePosts}" var="post" varStatus="s">
		                  <tbody>
		                    <tr>
		                      <td>${fn:length(leaguePosts) - s.count + 1}</td>
		                      <th>
		                        <a href="/LeagueBoard/${post.leagueboardId}"
		                          >${post.title}</a
		                        >
		                        <p>테스트</p>
		                      </th>
		                      <td><fmt:formatDate value="${post.regdate}" pattern="yyyy.MM.dd"/></td>
		                    </tr>
		                   </tbody>
		                 </c:forEach>
                      </c:when>
                    </c:choose>
                    <!-- <tr>
                      <td>4</td>
                      <th>
                        <a href="#!"
                          >[공지사항] 개인정보 처리방침 변경안내처리방침</a
                        >
                        <p>테스트</p>
                      </th>
                      <td>2017.07.13</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <th>
                        <a href="#!"
                          >[공지사항] 개인정보 처리방침 변경안내처리방침</a
                        >
                        <p>테스트</p>
                      </th>
                      <td>2017.07.13</td>
                    </tr>

                    <tr>
                      <td>2</td>
                      <th>
                        <a href="#!"
                          >공지사항 안내입니다. 이용해주셔서 감사합니다</a
                        >
                      </th>
                      <td>2017.06.15</td>
                    </tr>

                    <tr>
                      <td>1</td>
                      <th>
                        <a href="#!"
                          >공지사항 안내입니다. 이용해주셔서 감사합니다</a
                        >
                      </th>
                      <td>2017.06.15</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
          <div class="calendar">
            <div class="page-title">
              <div class="vline"></div>
              <div class="container2">
                <h3>정규대회 일정</h3>
              </div>
            </div>
          </div>
        </section>

        <section id="contents2">
          <div class="video">
              <div class="page-title">
                <div class="vline"></div>
                <div class="container2">
                  <h3>배드민턴 정보 게시판</h3>
                  <a href="/getNews" class="more">더보기+</a>
                </div>
              </div>

              <div class="container">
                  <div class="div2">
                    <iframe width="423" height="240" src="https://www.youtube.com/embed/iqxuxEubedU?si=RzD9Lcefg0esEvUF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                  </div>

                  <div class="div2">
                    <iframe width="423" height="240" src="https://www.youtube.com/embed/CQlWDl-OTE4?si=6Zc6HbTsrV3Ta9ei" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                  </div>
              </div>
            </div>
            
            

          
          <div class="place">
            <div class="page-title">
                <div class="vline"></div>
                <div class="container2">
                  <h3>배드민턴 운동장소 추천</h3>
                </div>
              </div>

			<div class="map" id="map"></div>
      	</div>
      </section>
    </main>


	<!-- footer -->
	<%@ include file="../views/include/footer.jsp"%>

    </div>


<!-- script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}"></script>
<script>

//지도를 표시할 div
var mapContainer = document.getElementById('map'), 
    mapOption = 
    { 
		// 지도의 중심좌표
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
    	// 지도의 확대 레벨    
        level: 6
    }; 

//지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation)
{
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(
   		function(position)
	    {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            
	        // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        var locPosition = new kakao.maps.LatLng(lat, lon),
	     	// 인포윈도우에 표시될 내용입니다
	            message = '<div style="padding:5px;">현재 위치</div>'; 
	        //json으로 보낼 위도,경도
	        var data = {"lat": lat,
	        			"lon": lon};
	        var positions = [];
	        //ajax호출
	        $.ajax
	        ({
	        	type : "POST",
				url : "/location",
				data : JSON.stringify(data),
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				async : false,
				success : function(result)
				{	
					//일정 반경이내의 배드민턴장 위치
					var closestList = result.closestList
					//positions에 title,latlng속성가진 obj로 변환하여 추가
					for(var i in closestList)
					{
						var obj = new Object();
						obj.title = closestList[i].name;
						obj.latlng = new kakao.maps.LatLng(closestList[i].lon, closestList[i].lat);
						positions.push(obj)
						//console.log("lon" + closestList[i].lon);
						//console.log("lat" + closestList[i].lat);
					}
					
			        //마커 image url
			        var imageSrc = "img/map-icon.jpg"; 
			        
			        // 각 위치에 마커 생성
			        for (var i = 0; i < positions.length; i ++) 
			        {
			            // 마커 이미지의 이미지 크기 입니다
			            var imageSize = new kakao.maps.Size(35, 35); 
			            
			            // 마커 이미지를 생성합니다    
			            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			            
			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker
			            ({
			                map: map, // 마커를 표시할 지도
			                position: positions[i].latlng, // 마커를 표시할 위치
			                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			                image : markerImage // 마커 이미지 
			            });
			            
			            var lat = positions[i].latlng.getLat();
			            var lng = positions[i].latlng.getLng();
			            var latlngString = lat + ',' + lng;
			            var iwRemoveable = true;
			            var iwContent = '<div style="padding:6px; width:230px;">'+ positions[i].title +'<br><a href="https://map.kakao.com/link/map/'
			            				+ positions[i].title + ',' + latlngString + '" style="color:blue" target="_blank">지도보기</a> <a href="https://map.kakao.com/link/to/'
			            				+ positions[i].title + ',' + latlngString + '" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			            var iwPosition = positions[i]; //인포윈도우 표시 위치입니다
			            var previousInfowindow = null;
			            // 마커 클릭 이벤트 리스너 추가
		           	    addClickListener(marker, iwContent, previousInfowindow);
		           	    
				        // 현재위치의 마커, message표시
				        crrentMarker(locPosition, message);
			        }
			        
				}//success
	        })//$ajax
	    }//function(position)
    )//getCurrentPosition
} else 
	{ // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        crrentMarker(locPosition, message);
	}


// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function crrentMarker(locPosition, message) 
{
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker
    ({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow
    ({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}

function addClickListener(marker, iwContent) 
{	
	var previousInfowindow = null;
	var infowindow = new kakao.maps.InfoWindow
	({
        position: marker.getPosition(),
        content: iwContent,
        removable: true
    });

    //
    function clickHandler()
    {
        // 새 인포윈도우 열기
        infowindow.setPosition(marker.getPosition());
        infowindow.open(map, marker);
    }

    // 이전 인포윈도우가 있다면 이전 클릭 이벤트를 제거합니다.
    if (previousInfowindow) {
        kakao.maps.event.removeListener(marker, 'click', previousInfowindow);
    }

    // 클릭 이벤트 핸들러를 등록합니다.
    kakao.maps.event.addListener(marker, 'click', clickHandler);

    // 이전 클릭 이벤트를 저장합니다.
    previousInfowindow = clickHandler;
}


</script>
</body>
</html>