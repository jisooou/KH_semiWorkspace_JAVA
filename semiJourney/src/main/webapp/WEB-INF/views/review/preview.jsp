<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL core 라이브러리 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신리뷰</title>
<link rel="stylesheet" href="../resources/css/reviewList.css">

<link rel="stylesheet" href="/journey/resources/css/layout/header.css">
<link rel="stylesheet" href="/journey/resources/css/layout/footer.css">

<script defer src="/journey/resources/js/layout/header.js"></script>
</head>

<%@ include file="/WEB-INF/views/layout/util.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	
	<main>
		<section class="review-section">
			<div class="review-container">
				<h2>최신리뷰 6개</h2>
				<hr>
				<table class="review-table">
					<thead>
						<tr>
							<th>프로필</th>
							<th>작성자</th>
							<th>평점</th>
							<th>날짜</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${voList}" var="vo">
							<tr>
								<td><img width="100px" height="100px" alt="profile"
									src="/app/resources/upload/${vo.profile}"></td>
								<td>${vo.writerName}</td>
								<td>${vo.starAvg}</td>
								<td>${vo.enrollDate}</td>
								<td>${vo.content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<button class="reviewListBtn" href="http://127.0.0.1:8888/journey/review/list?roomNo=${roomNo}">리뷰 더보기</button>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

</body>
</html>