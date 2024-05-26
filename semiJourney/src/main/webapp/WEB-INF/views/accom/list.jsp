<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 목록</title>

<link rel="stylesheet" href="/journey/resources/css/accomList.css">
</head>
<body>
	<div class="accom-container">
		<h1>숙소 목록</h1>
		<c:choose>
			<c:when test="${not empty voList}">
				<c:forEach var="vo" items="${voList}">
					<div id="${vo.no}" class="accom-list">
						<img src="/journey/resources/upload/${vo.imgUrl}" alt="숙소 사진">
						<div class="accom-detail">
							<span class="status">등록 중</span>
							<h3>${vo.name}</h3>
							<p>${vo.address}</p>

							<form action="/journey/accom/edit" method="get">
								<input type="hidden" name="no" value="${vo.no}">
								<button type="submit">수정하기</button>
							</form>

							<form action="/journey/accom/delete" method="post">
								<input type="hidden" name="no" value="${vo.no}">
								<button type="submit">삭제</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</c:when>

			<c:otherwise>
				<p>등록된 숙소가 없습니다.</p>
			</c:otherwise>

		</c:choose>
	</div>
</body>
</html>