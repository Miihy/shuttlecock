<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>아이디/비밀번호 찾기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    .tab_content {
        overflow: hidden;
        background-color: #f1f1f1;
        width: 400px;
        height: 400px;
        border-radius: 5px;
        margin: 0 auto;
    }
    .tab_content label.find-label {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 10px 5px 10px 5px;
        transition: 0.3s;
        border-radius: 5px 5px 0px 0px;
        display: inline-block;
        text-align: center;
    }
    .tab_content label.find-label:hover {
        background-color: #ddd;
    }
    .tab_content input[type="radio"] {
        display: none;
    }
    .tab_content input[type="radio"]:checked + label {
        background-color: #555;
        color: white;
    }
    .form-container, .form-container1 {
        max-width: 400px;
        height: 320px;
        margin: 42px auto 0px auto;
        padding: 20px 30px 20px 30px;
        background-color: #fff;
        border-radius: 0px 5px 5px 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h3 {
        text-align: center; /* Center aligning h3 */
        color: #333;
        margin-top: 0; /* Removing default top margin */
    }
    label.find-label {
        display: inline-block;
        width: 30%;
        text-align: center;
    }
    .container {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .container1 {
        display: flex;
        align-items: center;
        margin: 16px 0px 15px 14px;
    }
    .container label {
        width: 20%;
        text-align: right;
        margin-right: 20px;
    }
    .container1 label {
        width: 20%;
        text-align: right;
        margin-right: 20px;
    }
    input[type="text"],
    input[type="email"] {
        width: calc(80% - 50px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        background: #f8f8f8;
    }
    #sendNum {
    width: calc(60% - 35px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    background: #f8f8f8;
	}
    .button-container {
        text-align: center;
        display: flex; 
    	justify-content: center;
    	margin-top: 12px;
    }
    button[type="submit"]:not(.check) {
        width: 50%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #555;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }
    .button-con {
	    width: calc(30% - 15px); 
        display: flex; 
	    text-align: center;
    	justify-content: center;
	}
	.check{
		width: 70%;
		padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #555;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
	}
    .message-con{
            text-align: center;
            margin-top: 50px;
            font-weight: bold;
            height: 40px;
            overflow: hidden;
        }
     .message-con1{
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            overflow: hidden;
        }
    .message {
        text-align: center;
        line-height: 30px;
        font-weight: bold;
    }
    .line {
	    width: 100%;
	    height: 1px;
	    background-color: #ccc;
	    margin-top: 25px;
	    margin-bottom: 10px;
	}
	#confirmPw {
	width: calc(60% - 50px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    background: #f8f8f8;
}
.con {
    margin-bottom: 20px;
}

.con label {
    display: block;
    margin-bottom: 5px;
}

.con input[type="text"],
.con input[type="password"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-bottom: 1px solid #ccc; /* 밑줄 스타일 */
    outline: none;
}

.con input[type="text"]:focus,
.con input[type="password"]:focus {
    border-bottom: 1px solid #007bff; /* 포커스 시 밑줄 색상 변경 */
}
#newCheck:disabled {
    background-color: #d2d2d2; 
    color: white; 
}
</style>
</head>
<body>

<div class="tab_content">
    <input type="radio" name="tabmenu" id="tab_findIdSearch">
    <label for="tab_id" class="find-label" onclick="openTab('findIdSearch')">아이디 찾기</label>
    <input type="radio" name="tabmenu" id="tab_findPwSearch">
    <label for="tab_pw" class="find-label" onclick="openTab('findPwSearch')">비밀번호 찾기</label>
    

    <div id="findIdSearch" class="form-container">
        <h3>아이디 찾기</h3>
        <div class="container">
            <label for="username">이름</label>
            <input type="text" id="username" name="username" placeholder="이름을 입력하세요" required>
        </div>
        <div class="container">
            <label for="userEmail">이메일</label>
            <input type="email" id="Id_userEmail" name="Id_userEmail" placeholder="abc@example.com" required>
        </div>
        <div class="message-con" id="message" style="height: 40px;"></div>
        <div class="line"></div>
        <div class="button-container">
            <button type="submit" id="findIdBtn">아이디 찾기</button>
        </div>
    </div>

    <div id="findPwSearch" class="form-container">
        <h3>비밀번호 찾기</h3>
         <div class="container">
             <label for="userId">ID</label>
             <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
         </div>
         <div class="container">
          <label for="userEmail">이메일</label>
          <input type="email" id="Pw_userEmail" name="Pw_userEmail" placeholder="abc@example.com" required>
         </div>
         <div class="button-container">
             <button type="submit" id="sendEmail">이메일전송</button>
         </div>

		 <div class="message-con1" id="message"></div>
         <div class="line"></div>
         <div class="container1" style="display:none;">
        	<label for="sendNum">인증번호</label>
            <input type="text" id="sendNum" name="sendNum" placeholder="인증번호6자리입력" required>
         <div class="button-con">
             <button type="submit" class="check">확인</button>
         </div>
       	</div>
    </div>
    
	     <div id="resetPw" class="form-container1" style="display: none;">
	     <h3>새비밀번호 설정</h3>
	      <div class="con">
	          <label for="newPw">새비밀번호</label>
	          <input type="text" id="newPw" name="newPw" placeholder="새비밀번호를 입력해주세요" required>
	      </div>
	      <div class="con">
	          <label for="confirmNewPw">새비밀번호 확인</label>
	          <input type="text" id="confirmNewPw" name="confirmNewPw" placeholder="새비밀번호를 다시 입력해주세요" required>
	      </div>
	      <div class="message-con1" id="message">
	      	<span class="it" id="it1" style="font-size:10px;"></span>
		    <span class="it" id="it2" style="font-size:10px;"></span>
		    <span class="it" id="it3" style="font-size:10px;"></span>
		    <div class="it" id="it4" style="font-size:10px;"></div>
	      </div>
	      <div class="line"></div>
	      <div class="button-container">
	          <button type="submit" id="newCheck">확인</button>
	      </div>
	    </div>

</div>
<script>
	//아이디/비밀번호찾기 각 탭메뉴 설정
    function openTab(tabName) {
	//각 tab에 tabName으로 url을 부여함(findIdSearch/findPwSearch)
    window.history.pushState(null, null, '?tab=' + tabName);
    
	    var tabcontent = document.getElementsByClassName("form-container");
	    for (var i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
    	}
	    document.getElementById(tabName).style.display = "block";
    
    	//선택된 탭의 체크 추가
	    var tabRadio = document.getElementById('tab_' + tabName);
	    if (tabRadio) {
	        tabRadio.checked = true;
	    }
	}

	window.onload = function () {
		//url에서 "tab=" 부분을 제외한 tabName을 가져옴(findIdSearch/findPwSearch)
	    var tabName = window.location.search.substring(5);
	    if (tabName) {
	        openTab(tabName);
	    }
	}; 

	//아이디 찾기(ajax)
	$(document).ready(function() {
	    $("#findIdBtn").click(function() {
	        var username = $("#username").val();
	        var userEmail = $("#Id_userEmail").val();

	        if (!username.trim() || !userEmail.trim()) {
	            alert("이름과 이메일을 모두 입력해주세요.");
	            return; 
	        }

	        if (!validEmail(userEmail.trim())) {
	            alert("유효한 이메일 주소를 입력하세요.");
	            return;
	        }

	        
	        $.ajax({
	            url: "/findIdSearch",
	            type: "POST",
	            data: { username: username, userEmail: userEmail },
	            success: function(data) {
	                if (data) {
	                    $("#message").html("회원님의 아이디는 [ " + data + " ]입니다.");
	                } else {
	                    $("#message").html("해당하는 아이디가 없습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                alert("오류가 발생했습니다: " + xhr.responseText);
	            }
	        });
	    });

	
		//비밀번호 찾기(ajax)
	    $("#sendEmail").click(function() {
	        var userId = $("#userId").val();
	        var userEmail = $("#Pw_userEmail").val();

	        if (!userId.trim() || !userEmail.trim()) {
	            alert("아이디와 이메일을 모두 입력해주세요.");
	            return; 
	        }

	        if (!validEmail(userEmail.trim())) {
	            alert("유효한 이메일 주소를 입력하세요.");
	            return;
	        }
	        
	        $.ajax({
	            url: "/findPwSearch",
	            type: "POST",
	            data: { userId: userId, userEmail: userEmail },
	            success: function(data) {
	            	 if (data === "success") {
	                     alert("이메일이 성공적으로 전송되었습니다"); 
	                     $(".container1").show(); 
	                 } else { 
	                     alert("입력한 아이디와 이메일이 일치하지 않습니다"); 
	                     $(".container1").hide();
	                 }
	             },
	             error: function(xhr, status, error) {
	                  alert(xhr.responseText);
	                 $(".container1").hide(); 
	             }
	        });
	    }); 
		
		//이메일 유효성 검사
	    function validEmail(email) {
            var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
            return re.test(email);
        }
	    
	    //인증번호 확인
	    $(".check").click(function() {
	        var sendNum = $("#sendNum").val();
	        
	        $.ajax({
	            url: "/checkNum",
	            type: "POST",
	            data: { sendNum: sendNum },
	            success: function(data) {
	                if (data === "success") {
	                	 $("#findPwSearch").hide();
	                     $("#resetPw").show();
	                    alert("인증이 성공적으로 완료되었습니다.");
	                }else {
	                	 alert("인증번호가 일치하지 않습니다.");
	                }
	            }
	        });
	    });
	 });
	
	//탭메뉴를 누를 때 페이지 새로고침
	function resetPage() {
	    location.reload(); 
	}
	$(document).on("click", ".find-label", function() {
	    resetPage(); 
	});

	
	const firstNewPw = document.getElementById('newPw');	
	const secondNewPw = document.getElementById('confirmNewPw');
	const newCheckBtn = document.getElementById('newCheck');  
	const it1 = document.getElementById('it1');
	const it2 = document.getElementById('it2');
	const it3 = document.getElementById('it3');

	//새비밀번호를 입력할 때
	firstNewPw.addEventListener('input', function () {
	    const newPw = firstNewPw.value.trim();								
	    const confirmNewPw = secondNewPw.value.trim();
	    const newpwCheck = /^(?=.*[a-z])(?=.*[0-9!@#$%^&*?]).{6,20}$/;

	    if (!newPw) {
	        it1.innerHTML = '';
	    } else if (newPw.length < 6 || newPw.length > 20) {
	        it1.innerHTML = '❌ 6~20자';
	    } else {
	        it1.innerHTML = '✔️ 6~20자';
	    }
	    
	    if (!newPw) {
	        it2.innerHTML = '';
	    } else if (!/[a-zA-Z]/.test(newPw)) {
	        it2.innerHTML = '❌ 영문자 (A-Z 또는 a-z)';
	    } else {
	        it2.innerHTML = '✔️ 영문자 (A-Z 또는 a-z)';
	    }
	    
	    if (!newPw) {
	        it3.innerHTML = '';
	    } else if (!/[0-9!@#$%^&*?]/.test(newPw)) {
	        it3.innerHTML = '❌ 숫자 또는 특수문자 (!@#$%^&*?)';
	    } else {
	        it3.innerHTML = '✔️ 숫자 또는 특수문자 (!@#$%^&*?)';
	    }

	    if (newpwCheck.test(newPw)) {
	        secondNewPw.disabled = false;
	    } else {
	        secondNewPw.disabled = true;
	    }

	});
	//새 비밀번호 확인란에 입력할 때
	secondNewPw.addEventListener('input', function () {
    	const newPw = firstNewPw.value.trim();								
	    const confirmNewPw = secondNewPw.value.trim();
	    
	    //새 비밀번호가 확인란과 서로 일치하는지 확인
	    if (!newPw || !confirmNewPw) {
	        it4.innerHTML = '';
	    } else if (newPw === confirmNewPw) {
	        it4.innerHTML = '✔️ 비밀번호 일치';
	    } else {
	        it4.innerHTML = '❌ 비밀번호 불일치';
	    }

	    //모든 조건을 만족할 때 확인 버튼을 활성화
	    if (newpwCheck.test(newPw) && newPw === confirmNewPw) {
	        newCheckBtn.disabled = false;
	    } else {
	        newCheckBtn.disabled = true;
	    }

    });
	
	//새 비밀번호 변경(ajax)
	$("#newCheck").click(function() {
	    var newPw = $("#newPw").val();
	    var confirmNewPw = $("#confirmNewPw").val();
	    var userId = $("#findPwSearch #userId").val(); 

	    if (!newPw || !confirmNewPw) {
	        alert("새 비밀번호를 입력해주세요.");
	        return;
	    }
 
	    if (newPw !== confirmNewPw) {
	        alert("새 비밀번호와 확인된 비밀번호가 일치하지 않습니다.");
	        return;
	    }

	    $.ajax({
	        url: "/changePw",
	        type: "POST",
	        data: { userId: userId, pw: newPw },
	        success: function(data) {
	            if (data === "success") {
	                alert("비밀번호가 성공적으로 변경되었습니다.");
	                window.close();
	            } else {
	                alert("비밀번호 변경에 실패했습니다.");
	            }
	        }

	    });
	});
    
</script>

</body>
</html>
