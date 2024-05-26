<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 등록</title>

</head>
<body>

	<header>
		<h1>숙소 정보 수정</h1>
	</header>

	<main>
		<form action="/journey/accom/edit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${vo.no}"> 
			<input type="hidden" name="existingImgUrl" value="${vo.imgUrl}">
			<div>
				<label for="name">숙소 이름:</label> 
				<input type="text" id="name" name="name" value="${vo.name}" required>
			</div>
			<div>
				<label for="address">주소:</label> 
				<input type="text" id="address" name="address" value="${vo.address}" required>
			</div>
			<div>
				<label for="swimYn">수영장 여부:</label> 
				<select id="swimYn" name="swimYn" required>
					<option value="Y" ${vo.swimYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.swimYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="spaYn">스파 여부:</label> 
				<select id="spaYn" name="spaYn" required>
					<option value="Y" ${vo.spaYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.spaYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="disabledYn">장애인 시설 여부:</label>
				<select id="disabledYn" name="disabledYn" required>
					<option value="Y" ${vo.disabledYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.disabledYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="parkingYn">주차장 여부:</label> 
				<select id="parkingYn" name="parkingYn" required>
					<option value="Y" ${vo.parkingYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.parkingYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="elevatorYn">엘리베이터 여부:</label> 
				<select id="elevatorYn" name="elevatorYn" required>
					<option value="Y" ${vo.elevatorYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.elevatorYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="breakfastYn">조식 제공 여부:</label> 
				<select id="breakfastYn" name="breakfastYn" required>
					<option value="Y" ${vo.breakfastYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.breakfastYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="smokeYn">흡연 가능 여부:</label> 
				<select id="smokeYn" name="smokeYn" required>
					<option value="Y" ${vo.smokeYn == 'Y' ? 'selected' : ''}>Yes</option>
					<option value="N" ${vo.smokeYn == 'N' ? 'selected' : ''}>No</option>
				</select>
			</div>
			<div>
				<label for="imgUrl">이미지 업로드:</label> 
				<input type="file" id="imgUrl" name="imgUrl"> 
				<img src="/journey/resources/upload/${vo.imgUrl}" alt="현재 이미지" width="100">
			</div>
			<button type="submit">수정</button>
		</form>
	</main>

</body>
</html>