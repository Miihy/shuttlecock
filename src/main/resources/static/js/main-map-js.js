// 페이지 로딩 시와 모달 열릴 때 실행되는 지도 초기화 함수
// 지도 초기화 함수
console.log("map-js 진입")
var mapContainer = document.getElementById('map'); 
var mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), 
    level: 6
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); 

if (navigator.geolocation) {
    getCurrentLocationAndAddMarker(map);
    console.log("navigator.geolocation 호출 성공")
}else{
	console.log("navigator.geolocation 못불러옴");
}

// 현재 위치 가져와서 마커 추가하는 함수
function getCurrentLocationAndAddMarker(map) {
	console.log("getCurrentLocationAndAddMarker 진입");
    navigator.geolocation.getCurrentPosition(function(position) {
		console.log("geolocation으로 현재위치 찍기");
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;
        console.log(lat,lon);
        var locPosition = new kakao.maps.LatLng(lat, lon);
        var message = '<div style="padding:5px;">현재 위치</div>'; 
		console.log("locPosition");
		console.log(locPosition);
        var data = {"lat": lat, "lon": lon};
        $.ajax({
            type : "POST",
            url : "/location",
            data : JSON.stringify(data),
            dataType : "JSON",
            contentType : "application/json; charset=UTF-8",
            async : false,
            success : function(result) {
                addMarkersToMap(map, result.closestList);
                crrentMarker(map, locPosition, message);
            },
            error: function(xhr, status, error) {
                console.error("Failed to fetch map data:", error);
            }
        });
    });
}

// 지도에 마커 추가하는 함수
function addMarkersToMap(map, markerDataList) {
    var imageSrc = "img/map-icon.png"; 

    for (var i = 0; i < markerDataList.length; i++) {
        var markerData = markerDataList[i];
        var position = new kakao.maps.LatLng(markerData.lon, markerData.lat);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, new kakao.maps.Size(35, 35)); 
        var marker = new kakao.maps.Marker({
            map: map,
            position: position,
            title: markerData.name,
            image: markerImage
        });

        var latlngString = position.getLat() + ',' + position.getLng();
        var iwContent = '<div style="padding:6px; width:230px;">' + markerData.name +
            			'<br><a href="https://map.kakao.com/link/map/' + markerData.name + 
            			',' + latlngString + 
            			'" style="color:blue" target="_blank">지도보기</a> <a href="https://map.kakao.com/link/to/' + markerData.name + 
            			',' + latlngString + '" style="color:blue" target="_blank">길찾기</a></div>';
        addClickListener(marker, iwContent);
    }
}

// 마커 클릭 시 인포윈도우를 연결하는 함수
function addClickListener(marker, iwContent) {
    var infowindow = new kakao.maps.InfoWindow({
        position: marker.getPosition(),
        content: iwContent,
        removable: true
    });

    function clickHandler() {
        infowindow.setPosition(marker.getPosition());
        infowindow.open(map, marker);
    }

    kakao.maps.event.addListener(marker, 'click', clickHandler);
}

// 현재 위치에 마커 추가하는 함수
function crrentMarker(map, locPosition, message) {
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 

    var infowindow = new kakao.maps.InfoWindow({
        content: message,
        removable: true
    });
    
    infowindow.open(map, marker);
    map.setCenter(locPosition);
}