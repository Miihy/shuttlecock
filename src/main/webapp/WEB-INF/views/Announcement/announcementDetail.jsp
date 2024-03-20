<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shuttle Cock</title>
<link rel="stylesheet" href="/css/mainstyle.css">
<link rel="stylesheet" href="/css/aside.css">
<link rel="stylesheet" href="/css/free.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
.contents {
	width: 80%;
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>

	<!-- main -->
	<main id="boardmain">
		<section id="contents">
			<div class="noticeboard">
				<div class="title">
					<div class="vline"></div>
					<div class="container2">
						<h3>공지사항 게시판</h3>
					</div>
				</div>


				<div class="post-info">
					<p class="post-title">
						<strong>${post.title}</strong>
					</p>
					<p class="post-metadata">
						<span class="post-info-text"> <strong>작성자:</strong>
							${post.userId}
						</span> <span class="post-info-text"> <strong>작성 시간:</strong>
							<fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd HH:mm" />
						</span> <span class="post-info-text"> <strong>조회:</strong>
							${post.hit}
						</span>
					</p>
				</div>


				<!-- 게시물 내용 표시 -->
				<div class="post-content" id="post-content" style="height: 500px;">${post.content}</div>

				<!-- 버튼들 -->
				<div class="post-buttons">
					<button type="button" class="btn btn-primary listBtn">목록</button>
					<c:if test="${sessionScope.userId eq post.userId or sessionScope.isAdmin eq true}">
						<button type="submit" class="btn btn-primary goBtn updateBtn">수정</button>
					</c:if>
					<c:if
						test="${sessionScope.userId eq post.userId or sessionScope.isAdmin eq true}">
						<button type="button" class="btn btn-primary goBtn delbtn">삭제</button>
					</c:if>
				</div>
			</div>
		</section>



	</main>

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>


</body>

<script>
$(document).ready(function() {
// 글수정
	$('.updateBtn').click(function() 
	{
		location.href = "<c:url value='/Announcement/update/${post.announcementNo}'/>";
	})
				
	
	$('.listBtn').click(function() 
	{
		location.href = '<c:url value="/Announcement/"/>';
	})
			
			
    // 삭제 버튼 클릭 이벤트를 처리합니다.
    $(".delbtn").click(function(e) 
    {
    	e.preventDefault();
    	
    	// 알림을 통해 사용자에게 삭제 여부를 확인할 수 있습니다.
      	var isConfirmed = confirm("게시글을 삭제하시겠습니까?");

        if (isConfirmed) 
        {
            // 액시오스를 사용하여 서버로 DELETE 요청을 보냅니다.
            axios.delete('/Announcement/deletepost/' + ${post.announcementNo})
            .then(function (response) 
            {
                console.log(response.data);
                alert("게시글이 삭제되었습니다.");
             	// 게시글 목록 페이지로 이동합니다.
                window.location.href = '/Announcement/';
            })
            .catch(function (error) 
            {
                console.error('Error during board deletion:', error);
                alert("게시글 삭제 실패");
            });
        }
    });
});

</script>
</html>