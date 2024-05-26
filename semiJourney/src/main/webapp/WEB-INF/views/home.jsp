<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 정석</title>

<link rel="stylesheet" href="/journey/resources/css/home.css">
<script defer src="/journey/resources/js/home.js"></script>

<link rel="stylesheet" href="/journey/resources/css/layout.css">
<script defer src="/journey/resources/js/layout.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<!-- 회원가입 창 -->
	<div class="join-content" id="join-content">
		<form action="/journey/member/join" method="post" enctype="multipart/form-data" class="join-box">
			<h3>회원가입 완료하기</h3>
			<hr>
			<h4>실명</h4>
			<input type="text" size="22" name="name" placeholder="신분증에 기재된 이름(예:길동)" required>
			<br> 
			<h6>
				정부 발급 신분증에 기재된 이름과 일치해야 합니다. 평소 다른 이름을 사용하는 경우, <u>선호하는 이름</u>을
				입력하세요.
			</h6>
			<h4>생년월일</h4>
			<input type="text" name="birth-date" required>
			<h6>18세 이상인 성인만 회원으로 가입할 수 있습니다. 생일은 여행의 정석의 다른 회원에게 공개되지 않습니다.</h6>
			<h4>Contact Info</h4>
			전화번호 : <input type="tel" name="phone"
				placeholder="01012345678" required> <br> 이메일 : <input
				type="email" name="email" placeholder="kh11@gmail.com" required>
			<div class="id-checkDup">
				<h4>아이디</h4>
				<input type="text" name="id" required> <input type="button"
					value="중복 확인">
			</div>
			<h4>비밀번호</h4>
			<input type="password" name="pwd" required>
			<h4>비밀번호 확인</h4>
			<input type="password" name="pwd2" required>
			<h4>프로필 이미지</h4>
			<input type="file" name="profile" > <br>
			<hr>
			<br>
			<div class="checkbox-container">
				<h5>개인정보 수집 및 이용에 동의합니다.</h5>
				<input type="checkbox" required>
			</div>
			<div class="checkbox-container">
				<h5>마케팅 이메일 수신을 원합니다(선택).</h5>
				<input type="checkbox">
			</div>
			<br>
			<hr>
			<br>
			<h4>
				동의 및 계속하기를 선택하여 여행의 정석 <u>서비스 약관</u>, <u>결제 서비스 약관</u>, <u>위치기반서비스
					이용약관</u>, <u>차별 금지 정책</u>, <u>개인정보 처리방침</u>에 동의합니다.
			</h4>
			<input type="submit" value="동의 및 계속하기" class="join-submit-button">
		</form>
	</div>
	<!--  -->

	<!-- 로그인 창 -->
	<div class="login-content" id="login-content">
		<form action="/journey/member/login" method="post" class="login-box">
			<h3>로그인</h3>
			<hr>
			<h2>여행의 정석에 오신 것을 환영합니다.</h2>
			<br> <input id="login-id" type="text" name="id" placeholder="아이디" required>
			<br> <br> <input id="login-password" type="password" name="pwd"
				placeholder="비밀번호" required>
			<!-- 비밀번호 보기 -->
			<button type="button" class="show-password" onclick="showPassword()">비밀번호
				보기</button>
			<br> <br> <input type="submit" value="로그인"
				class="login-submit-button"> <br>
			<h4>
				<u>비밀번호를 잊으셨나요?</u>
			</h4>
		</form>
	</div>
	<!--  -->

	<nav>
		<div class="search">
			<button class="search-item" onclick="showPlaceSearch()">
				<span>여행지</span> <span id="search-destination">여행지 검색</span>
			</button>
			<div class="divider"></div>
			<!-- 이 부분 캘린더 추가 -->
			<button class="search-item" id="checkin-button"
				onclick="showCalendar('checkin')">
				<span>체크인</span> <span>날짜 추가</span>
			</button>
			<div class="divider"></div>
			<!-- 이 부분 캘린더 추가 -->
			<button class="search-item" id="checkout-button"
				onclick="showCalendar('checkout')">
				<span>체크아웃</span> <span>날짜 추가</span>
			</button>
			<div class="divider"></div>
			<button class="search-item" onclick="showTravelerSearch()">
				<span>여행자</span> <span>게스트 추가</span>
			</button>
			<button type="submit" class="search-icon">
				<img src="/journey/resources/img/search.png" alt="검색 아이콘">
			</button>

			<div class="search-place" id="search-place">
				<h5 class="search-place-letter">지역으로 검색하기</h5>
				<button class="search-place-button">
					<img src="/journey/resources/img/place-search.png" alt="유연한 검색">
					<span>유연한 검색</span>
				</button>
				<br>
				<h5 class="search-place-letter">한국</h5>
				<br>
				<div class=search-place-name>
					<button onclick="updateSearchBar('서울')">서울</button>
					<button onclick="updateSearchBar('부산')">부산</button>
					<button onclick="updateSearchBar('속초')">속초</button>
					<button onclick="updateSearchBar('강릉')">강릉</button>
					<button onclick="updateSearchBar('전주')">전주</button>
					<button onclick="updateSearchBar('대구')">대구</button>
					<button onclick="updateSearchBar('경주')">경주</button>
					<button onclick="updateSearchBar('여수')">여수</button>
					<button onclick="updateSearchBar('서귀포')">전남</button>
					<button onclick="updateSearchBar('대전')">대전</button>
					<button onclick="updateSearchBar('제주도')">제주도</button>
					<button onclick="updateSearchBar('인천')">인천</button>
					<button onclick="updateSearchBar('서울')">경기</button>
					<button onclick="updateSearchBar('서울')">대전</button>
					<button onclick="updateSearchBar('서울')">충북</button>
					<button onclick="updateSearchBar('서울')">경남</button>
				</div>
			</div>
		</div>

		<div class="traveler" id="traveler">
			<div class="traveler-option">
				<span>성인</span> <span class="age-info">13세 이상</span>
				<div class="people-count">
					<button class="decrease">-</button>
					<span class="count">0</span>
					<button class="increase">+</button>
				</div>
			</div>
			<div class="traveler-option">
				<span>어린이</span> <span class="age-info">2~12세</span>
				<div class="people-count">
					<button class="decrease">-</button>
					<span class="count">0</span>
					<button class="increase">+</button>
				</div>
			</div>
			<div class="traveler-option">
				<span>유아</span> <span class="age-info">2세 미만</span>
				<div class="people-count">
					<button class="decrease">-</button>
					<span class="count">0</span>
					<button class="increase">+</button>
				</div>
			</div>
			<div class="traveler-option">
				<span>반려동물</span>
				<!-- <span class="age-info">보조동물을 동반하시나요?</span> -->
				<div class="people-count">
					<button class="decrease">-</button>
					<span class="count">0</span>
					<button class="increase">+</button>
				</div>
			</div>
		</div>
	</nav>


	<!-- <br><hr id="line"><br> -->

	<section>
		<div class="theme">
			<button id="theme-detail">
				<img src="/journey/resources/img/sea.svg" alt="테마"> <span
					id="theme-name">해변 바로 앞</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/hanok.svg" alt="테마"> <span
					id="theme-name">한옥</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/view.svg" alt="테마"> <span
					id="theme-name">최고의 전망</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/pool.svg" alt="테마"> <span
					id="theme-name">멋진 수영장</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/camping.svg" alt="테마"> <span
					id="theme-name">캠핑장</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/wierd.svg" alt="테마"> <span
					id="theme-name">기상천외한</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/world.png" alt="테마"> <span
					id="theme-name">속세를 벗어난</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/top.svg" alt="테마"> <span
					id="theme-name">세상의 꼭대기</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/farm.svg" alt="테마"> <span
					id="theme-name">농장</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/surfing.svg" alt="테마"> <span
					id="theme-name">서핑</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/cabin.svg" alt="테마"> <span
					id="theme-name">통나무집</span>
			</button>
			<button id="theme-detail">
				<img src="/journey/resources/img/countryside.png" alt="테마"> <span
					id="theme-name">한적한 시골</span>
			</button>
		</div>
	</section>

	<div class="main">
		<div class="image-container">
			<div class="accomodation">
				<img
					src="https://cdn.travelview.co.kr/travelview/2021/01/21020223/post_41596968_30400772_4.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img src="https://ppss.kr/wp-content/uploads/2023/06/1-1-2.jpeg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://digitalchosun.dizzo.com/site/data/img_dir/2020/07/06/2020070680034_2.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://static.wixstatic.com/media/66a42d_330ccf54067345bc8bcb525b1a05156a~mv2.jpg/v1/fill/w_602,h_480,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/GFXS8145-Pano.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://mblogthumb-phinf.pstatic.net/MjAyMTA5MDZfMTIg/MDAxNjMwOTI3NjY3OTAx.Pvai0H6Gd37tT4sTp12Nz8gDK6skinSIv5_UcRvu7KEg.P5SD62MQP5UlbbEEnwp59_qx3jrkng3FqkYlVtreFNEg.JPEG.so_hee510/IMG_4458.jpg?type=w800"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://a.cdn-hotels.com/gdcs/production97/d585/64d53349-591e-46f8-af08-d9dc0649ea1a.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://yaimg.yanolja.com/v5/2021/12/27/11/1280/61c9a852b80a75.50854466.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img src="https://image6.yanolja.com/makers/SK4JH2imjjw7wIpn"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://d3edy9y3v7d67c.cloudfront.net/rooms/10764/images/960/i87122.jpg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://a0.muscache.com/im/pictures/57a113aa-57a6-4a54-b0ec-1c4e6ef70164.jpg?im_w=1920"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://cdn.onews.tv/news/photo/202403/201148_242757_5858.jpeg"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://a0.muscache.com/im/pictures/miso/Hosting-33759190/original/bd1f00ce-741f-4e34-9dca-1b05e6df65ce.jpeg?im_w=720"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
			<div class="accomodation">
				<img
					src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/167238542406438811.jpeg?w=960&h=960&c=c"
					alt="숙소 사진">
				<div class="heart-icon" onclick="clickHeart(this)">
					<img class="heart-empty"
						src="/journey/resources/img/emptyheart.svg" alt="빈 찜 하트"> <img
						class="heart-filled" src="/journey/resources/img/pinkheart.png"
						alt="찜 하트">
				</div>
				<div id="place-name">한국 애월읍, 제주시</div>
				<div id="place-score">★ 4.79</div>
				<div id="place">협재해수욕장</div>
				<div id="place-date">₩273,882 / 박</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<!-- -----------------캘린더------------------------------------ -->
	<div class="calendar-modal" id="calendar-modal">
		<div class="calendar-content">
			<div class="calendar-header">
				<button id="prev-month">&lt;</button>
				<span id="current-month"></span>
				<button id="next-month">&gt;</button>
			</div>
			<div class="calendar-body" id="calendar-body">
				<!-- Calendar grids will be dynamically inserted here -->
			</div>
			<div class="calendar-footer">
				<button id="close-calendar">닫기</button>
			</div>
		</div>
	</div>
	<!-- ----------------------------------------------------------------- -->

	<footer class="footer">
		<div class="footer-content">
			<div class="footer-column">
				<h4>에어비앤비 지원</h4>
				<ul>
					<li><a href="https://www.airbnb.co.kr/help">도움말 센터</a></li>
					<li><a href="https://www.airbnb.co.kr/help/article/3218">에어커버</a></li>
					<li><a href="https://www.airbnb.co.kr/against-discrimination">차별
							반대</a></li>
					<li><a href="https://www.airbnb.co.kr/accessibility">장애인
							지원</a></li>
					<li><a href="https://www.airbnb.co.kr/help/article/2701">예약
							취소 옵션</a></li>
					<li><a href="https://www.airbnb.co.kr/help/article/3290">이웃
							민원 신고</a></li>
				</ul>
			</div>
			<div class="footer-column">
				<h4>호스팅</h4>
				<ul>
					<li><a
						href="https://www.airbnb.co.kr/host/homes?from_footer=1">당신의
							공간을 여정하세요</a></li>
					<li><a
						href="https://www.airbnb.co.kr/host/homes?from_footer=1">호스트를
							위한 에어커버</a></li>
					<li><a href="https://www.airbnb.co.kr/resources/hosting-homes">호스팅
							자료</a></li>
					<li><a
						href="https://community.withairbnb.com/t5/custom/page/page-id/CommunityCenterNotFound">커뮤니티
							포럼</a></li>
					<li><a href="https://www.airbnb.co.kr/help/article/1387">책임감
							있는 호스팅</a></li>
					<li><a href="https://www.airbnb.co.kr/ambassadors/joinaclass">무료
							호스팅 클래스 참여하기</a></li>
				</ul>
			</div>
			<div class="footer-column">
				<h4>여정</h4>
				<ul>
					<li><a href="https://news.airbnb.com/">뉴스룸</a></li>
					<li><a href="https://www.airbnb.co.kr/release">새로운 기능</a></li>
					<li><a href="https://careers.airbnb.com/">채용정보</a></li>
					<li><a href="https://investors.airbnb.com/home/default.aspx">투자자
							정보</a></li>
					<li><a
						href="https://ko.airbnb.org/?_set_bev_on_new_domain=1715824984_ZWY5ZmRiZjk5MTg0">여정
							긴급 속보</a></li>
				</ul>
			</div>
		</div>
		<div class="footer-language">
			<span>한국어 (KR)</span> <span>₩ KRW</span>
		</div>
		<div class="footer-sns">
			<img src="/journey/resources/img//facebook.png" alt="facebook">
			<img src="/journey/resources/img/twitter.png" alt="twitter"> <img
				src="/journey/resources/img/instagram.png" alt="instagram"> <img
				src="/journey/resources/img/blog.png" alt="blog">
		</div>
		<div class="footer-bottom">
			<span>© 2024 여정, Inc.</span>
			<div class="footer-link">
				<a href="">개인정보 처리방침</a> <a href="">이용약관</a> <a href="">사이트맵</a> <a
					href="">한국의 변경된 환불 정책</a> <a href="">회사 세부정보</a>
			</div>
		</div>
	</footer>

</body>
</html>