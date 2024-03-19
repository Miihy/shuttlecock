<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/loginstyle.css">
<link rel="stylesheet" href="/css/aside.css">
</head>

<body>
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		<%@ include file="../include/header.jsp"%>
		<main id="boardmain">
			<section id="contents">


				<div class="noticeboard">
					<div class="page-title">
						<div class="vline"></div>
						<div class="container2">
							<h3>회원 리스트</h3>
						</div>
					</div>

					<div id="board-list">
						<div class="container2">
							
							<form id="mainForm" class="row justify-content-center g-3"
								action="/admin" method="GET" onsubmit="checkKeyword()">
								<div class="col-auto">
								<select
									class="selectbox" id="selectbox" name="selectbox"
									onchange="chageLangSelect()">
									<option value="${pageInfo.pageRequest.category}">게시물</option>
									<option value="${pageInfo.pageRequest.category}">좋아요</option>
									<option value="${pageInfo.pageRequest.category}">댓글</option>
								</select>
									<label for="keyword" class="visually-hidden">Search</label> <input
										type="text" class="form-control" id="searchKeyword"
										placeholder="SearchKeyword" name="searchKeyword"
										value="${pageInfo.pageRequest.searchKeyword}">
									<!-- hidden -->
									<input name="pageNum" type="hidden"
										value="${pageInfo.pageRequest.pageNum}">
									<input
										name="amount" type="hidden"
										value="${pageInfo.pageRequest.amount}">
								</div>
								<div class="col-auto">
									<input type="submit" class="btn btn-primary mb-3"
										value="Search" />
								</div>
							</form>


							<table class="board-table" style="width: 90%; margin: 0 auto;">
								<thead>
									<tr>
										<th scope="col" class="th-like">이름</th>
										<th scope="col" class="th-title">이메일(아이디)</th>
										<th scope="col" class="th-writer">이름</th>
										<th scope="col" class="th-date">사진</th>
										<th scope="col" class="th-hit">성별</th>
										<th scope="col" class="th-like">작성게시글</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${userSearchList}">
										<tr>
											<th scope="row">${user.username}</th>
											<td><a href="/admin/${user.userId}">${user.userEmail}
													(${user.userId})</a></td>
											<td>${user.userImageName}</td>
											<td>${user.gender}</td>
											<td>${user.writeCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- Paging -->
							<!-- https://getbootstrap.com/docs/5.3/layout/columns/#alignment -->
							<!-- https://getbootstrap.com/docs/5.3/components/pagination/#disabled-and-active-states -->
							<div class="row justify-content-center">
								<div class="col-auto">
									<nav class="page navigation">
										<ul class="pagination">
											<c:if test="${pageInfo.prev}">
												<li class="page-item"><a class="page-link"
													aria-label="Previous"
													href="/main?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}">Prev</a>
												</li>
											</c:if>
											<c:forEach var="num" begin="${pageInfo.startPage}"
												end="${pageInfo.endPage}">
												<li
													class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
													<a class="page-link"
													href="/main?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
												</li>
											</c:forEach>
											<c:if test="${pageInfo.next}">
												<li class="page-item next"><a class="page-link"
													aria-label="next"
													href="/main?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}">Next</a>
												</li>
											</c:if>
										</ul>
									</nav>
								</div>
							</div>
						</div>




						<%-- 					<c:forEach items="${userList}" var="user">
						<b> <a href="admin/${user.userId}">${user.userId}</a>
						</b>
					</c:forEach> --%>
			</section>
		</main>
		<%@ include file="../include/footer.jsp"%>
	</div>

</body>
<script type="text/javascript">
	//step01 : 페이징 버튼 클릭시 지정 url 요청 갈수 있도록 이벤트 등록
	Array.from(document.getElementsByClassName('page-link'))
		.forEach((pagingButton) => {
			pagingButton.addEventListener('click', function(e) {
				e.preventDefault();
				// step02 : 등록 후, action : '/main' 으로 요청 시, keyword 값 유무에 따라 queryString 변경
				// step03 : 요청
				let mainForm = document.getElementById('mainForm');
				
				// 현재 페이지 값으로 변경하여 /main 요청하도록 지정
				mainForm.pageNum.value = e.target.innerHTML;
				
				if(mainForm.searchKeyword.value === '' || mainForm.searchKeyword.value === null) {
					mainForm.searchKeyword.remove();
				}
				
				mainForm.action = '/admin';
				mainForm.method = 'GET';
				mainForm.submit();
			})
	})

	function checkKeyword() {
		let mainForm = document.getElementById('mainForm');
		if(mainForm.searchKeyword.value === null || mainForm.searchKeyword.value === '') {
			mainForm.searchKeyword.remove();
		}
	}
	
	
	
</script>

<style>
.noticeboard {
	width: 100%;
}

.mainTitle {
	text-align: center;
}

.whyBtn {
	margin-left: 46%;
}

.whyBtn1 {
	margin-left: 69%;
}

.del-btn {
	margin-left: 95%
}

.paging {
	margin-left: auto;
	margin-right: auto;
	display: table;
}

.whyBtn {
	margin-left: 80%;
	margin-top: 30px;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}

/*---검색버튼--- */
.search-wrap {
	overflow: hidden; /*부모요소에 히든 */
	margin-bottom: 20px;
	margin-right: 200px;
}

.search-btn, .search-input, .search-select {
	float: right; /*우측 플로팅 */
}

.search-input {
	width: 140px;
}

#search-select {
	width: 80px;
}
</style>
</html>