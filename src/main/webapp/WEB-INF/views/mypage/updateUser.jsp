<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shuttle Cock</title>
<link rel="stylesheet" href="/css/mainstyle.css">
<link rel="stylesheet" href="/css/aside.css">
<!-- aisde-js 파일 -->
<script src="/js/aside-js.js"></script>
<link rel="stylesheet" href="/css/free.css">



</head>
<body>
	<% if (request.getAttribute("errorMsg") != null) { %>
        <script>
            alert("<%= request.getAttribute("errorMsg") %>");
            window.location = '/updateUser';
        </script>
    <% } %>

	<!-- wrap -->
	<div id="wrap">

		<!-- header -->
		<%@ include file="../include/header.jsp"%>
		<!-- main -->
		<main id="main">
			<div id="slider">
				<div class="imageWrap1"></div>
			</div>

			<!-- section -->
			<section id="contents">

				<!-- aside -->
				<div class="aside">
					<div class="menubar">
						<ul>
							<li><a class="list" href="/mypage">마이페이지</a></li>
							<li><a class="list" href="/updateUser">내 프로필</a></li>
							<li><a class="list" href="/record">나의활동내역</a></li>
							<li><a class="list" href="/manageBlockedUser">차단유저관리</a></li>
						</ul>
					</div>
				</div>

				<div class="noticeboard">
					<div class="title" style="margin: 0px;">
						<div class="vline"></div>
						<div class="container2">
							<h3>내 프로필 &#10095</h3>
						</div>
					</div>


					<div id="board-list">
						<div class="container2">

							<form action="/updateUser" method="POST" enctype="multipart/form-data" id="next_form">
							  
							  <table class="board-table"> 
						            <colgroup>
						                <col width="15%">
							            <col width="35%">
							            <col width="15%">
							            <col width="35%">
						            </colgroup>
						            <tbody> 
						                <tr>
						                    <th scope="row" bgcolor="#F9F9F9">프로필 사진</th>
						                    <td colspan="4" class="profile-picture" style="display: flex; flex-direction: column;">			         
								              <c:if test="${user.userImageName eq null}">
								                  <img src="https://kr.object.ncloudstorage.com/team1bucket/profile/noprofile.png" alt="프로필 이미지">
								              </c:if>
								              <c:if test="${user.userImageName != null}">
								                  <img src="https://kr.object.ncloudstorage.com/team1bucket/profile/${user.userImageName}" alt="프로필 이미지">
								              </c:if>
								              <input type="file" id="fileInput" name="file" class="custom-file-upload">
									        </td>
						                </tr>
						                <tr>
						                    <th scope="row" bgcolor="#F9F9F9">아이디</th>
						                    <td colspan="4" style="text-align: left; padding-left:10px; font-weight: bold;">
										        <div style="display: flex; align-items: center;">
										        <img src="https://kr.object.ncloudstorage.com/team1bucket/badge/${user.badgeId}.png"
													width="30px" height="25px" style="margin-right:5px;">${user.userId}
												</div>
										    </td>
										</tr>
										<tr>
										    <th scope="row" bgcolor="#F9F9F9">이름</th>
						                    <td colspan="4" style="text-align: left; padding-left:10px;">
										        <input type="text" name="username" class="form-control1" value="${user.username}">
										    </td>
						                </tr>
										<tr>
										    <th scope="row" bgcolor="#F9F9F9">이메일</th>
						                    <td colspan="4" style="text-align: left; padding-left:10px;">
										        <input type="email" name="userEmail" id="userEmail" class="form-control1" value="${user.userEmail}">
										        <span id="emailMsg"></span>
										    </td>
										</tr>
						            </tbody>
					            </table>
					            
								<div class=button-container style="text-align :center">
									<input class="update" type="submit" id="update" value="수정">
								    <input type="button" class="delete-btn" id="btnDelete" value="회원탈퇴">
								</div>
							</form>
							
							
						</div>
					</div>
				</div>
			</section>
		</main>
		<%@ include file="../include/footer.jsp"%>
	</div>
	<!-- modal 추가 -->
	<%-- <c:if test="${user.kakaoYN eq false}"> --%>
		<div id="my_modal_delete" class="modal">
			<div class="modal-content">
				<span class="close1">&times;</span>
				<form action="/deleteUser" enctype="multipart/form-data" method="POST">
					<input type="password" name="pw" placeholder="비밀번호"
						class="custom-input">
					<p>정말로 삭제하시겠습니까?</p>
					<input type="submit" value="삭제" class="delete-btn">
				</form>
			</div>
		</div>
	<%-- </c:if> --%>
</body>

<script type="text/javascript">
	// input 상자의 값을 가져오는 함수
	function getInputValue() {
		return document.getElementById("fileInput").value;
	}

	// 입력 상자가 null인지 확인하고 처리하는 함수
	function handleInput() {
		var inputValue = getInputValue();

		// 입력 상자의 값이 null이 아닌 경우에만 실행
		if (inputValue !== null && inputValue !== "") {
			// 여기에 실행하고자 하는 코드를 작성
			console.log("Input is not null");
		}
	}

	// 모달 열기 버튼 클릭 시 이벤트 처리
	document.getElementById('btnDelete').addEventListener('click', function() {
		document.getElementById('my_modal_delete').style.display = 'block'; // 모달 보이기
	});

	//모달 닫기 (삭제) 
	var modal_delte = document.getElementById('my_modal_delete');

	var closeBtn1 = document.getElementsByClassName("close1")[0];

	function closeModal_delete() {
		modal_delte.style.display = "none"; // 모달 숨기기
	}

	closeBtn1.addEventListener('click', closeModal_delete);

	window.addEventListener('click', function(event) {
		if (event.target == modal_delte) {
			closeModal_delete();
		}
	});
	
	//프로필 수정 전 이메일 중복체크 및 유효성 검사
	const userEmailInput = document.getElementById('userEmail');
	const emailMsg = document.getElementById('emailMsg');
	const updateBtn = document.getElementById('update');

	userEmailInput.addEventListener('input', function () {
	    const email = userEmailInput.value;
	    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	 	// userEmail 입력란이 빈칸일 경우(공백제거)
	    if (email.trim() === '') {
	        emailMsg.textContent = ''; // 이메일 메시지 초기화
	        updateBtn.disabled = true; //수정 버튼 비활성화
	        return;
	    }

	 	// userEmail 유효하지 않은 이메일 주소일 경우
	    if (!emailPattern.test(email)) {
	        emailMsg.textContent = '유효하지 않은 이메일 주소입니다.';
	        emailMsg.style.color = 'red';
	        updateBtn.disabled = true; //수정 버튼 비활성화
	        return;
	    }

	 	//이메일 중복체크
	    $.ajax({
	        url: '/checkEmail',
	        method: 'GET',
	        data: { userEmail: email },
	        success: function (data) {
	        	emailMsg.textContent = data.emessage;
	            emailMsg.style.color = data.emessage.includes("사용가능한") ? "green" : "red";
	            updateBtn.disabled = !data.emessage.includes("사용가능한"); //수정 버튼 비활성화
	        }
	    });
	});
	
</script>

<style>
.member-info {
	background-color: #f0f0f0; /* 배경색 지정 */
	display: flex;
	align-items: center;
	margin: 50px;
	padding: 20px; /* 내부 여백 지정 */
	border-radius: 10px; /* 테두리 모서리 둥글게 만듦 */
}

.profile-picture img {
	width: 150px; /* 프로필 사진의 크기 조절 */
	height: 150px; /* 프로필 사진의 크기 조절 */
	border-radius: 50%; /* 프로필 사진을 원형으로 만듭니다. */
}

.details {
	margin-left: 20px; /* 회원 정보와 프로필 사진 사이의 간격 조절 */
}

.details h2 {
	font-size: 20px; /* 사용자 이름의 글꼴 크기 조절 */
	margin-bottom: 5px; /* 사용자 이름과 이메일 주소 사이의 간격 조절 */
}

.details p {
	font-size: 16px; /* 이메일 주소의 글꼴 크기 조절 */
	color: #666; /* 이메일 주소의 색상 변경 */
}

#my_modal_delete {
	display: none;
	width: 350px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
}

.close1 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.update {
	background-color: #4CAF50; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	padding: 12px 20px; /* 내부 여백 */
	border: none; /* 테두리 없음 */
	border-radius: 4px; /* 버튼 모서리 둥글게 */
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.delete-btn {
	background-color: #f44336; /* 삭제 버튼 배경색 */
	color: white; /* 삭제 버튼 글자색 */
	padding: 10px 20px; /* 내부 여백 */
	border: none; /* 테두리 없음 */
	border-radius: 4px; /* 버튼 모서리 둥글게 */
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

/* 버튼에 마우스를 올렸을 때의 스타일 */
.delete-btn:hover {
	background-color: #d32f2f;
}

.custom-input {
	width: 200px; /* 입력 상자의 너비 */
	padding: 10px; /* 내부 여백 */
	border: 1px solid #ccc; /* 테두리 스타일 및 색상 */
	border-radius: 4px; /* 입력 상자 모서리 둥글게 */
	font-size: 16px; /* 글꼴 크기 */
	outline: none; /* 포커스 시 테두리 제거 */
}

/* 입력 상자에 포커스를 받았을 때의 스타일 */
.custom-input:focus {
	border-color: #405448; /* 포커스 시 테두리 색상 변경 */
}

.custom-file-upload {
	display: inline-block;
	padding: 10px 20px;
	cursor: pointer;
	color: black;
	border: none;
	border-radius: 4px;
	font-size: 16px;
}

/* 파일 업로드 버튼에 마우스를 올렸을 때의 스타일 */
.custom-file-upload:hover {
	background-color: #0056b3;
}

/* 파일 업로드 버튼에 포커스를 받았을 때의 스타일 */
.custom-file-upload:focus {
	outline: none;
}

table {
	width: 100%;
	border-collapse: collapse;
}

.profile-picture {
	text-align: center;
	width: 350px;
	margin: 0px auto;
}

.profile-picture img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
}

.custom-file-upload {
	margin-top: 10px;
	margin-bottom: 5px;
	text-align: center;
}

.custom-input {
	width: 100%;
	padding: 5px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
}

.update, .delete-btn {
    padding: 10px 20px;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-right: 10px;
}
.update{
	/* background-color: #4CAF50; */
	background-color:#607d67; 
}
.delete-btn{
	background-color:#f44336; 
	/* background-color:#D45A63; */
}

.update:hover{
    background-color: #405448;
}
.delete-btn:hover{
	/* background-color:rgb(255, 51, 51); */
}
.update:disabled {
    background-color: #d2d2d2; 
    color: white; 
}
</style>
</html>
