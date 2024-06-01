<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 및 결제</title>
<link rel="stylesheet" href="/journey/resources/css/book/bookNew.css">

<link rel="stylesheet" href="/journey/resources/css/layout/header.css">
<link rel="stylesheet" href="/journey/resources/css/layout/footer.css">

<!-- port -->

<!-- 포트원 결제 -->
<script defer src="https://cdn.iamport.kr/v1/iamport.js" defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script defer type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js" defer></script>
<!-- 포트원 결제 -->
<!-- <script src="https://cdn.portone.io/v2/browser-sdk.js"></script> -->
<script defer src="/journey/resources/js/book/bookNew.js"></script>
<script defer src="/journey/resources/js/layout/header.js"></script>
</head>

<%@ include file="/WEB-INF/views/layout/util.jsp"%>

<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<nav class="rsv_inner" id="navText">
		<div id="backImgBox">
			<img src="/journey/resources/img/book/back.png">
		</div>
		<div>
			<h1>확인 및 결제</h1>
		</div>
	</nav>

	<main class="main">
		<form action="/journey/book/new" id="temp-form"  class="temp-form" method="post">

			<input type="hidden" id="roomNo" name="roomNo" value="${vo.roomNo}"> <input
				type="hidden" id="inDate" name="inDate" value="${vo.inDate}"> <input
				type="hidden" id="outDate" name="outDate" value="${vo.outDate}"> <input
				type="hidden" id="guestCount" name="guestCount" value="${vo.guestCount}"> <input
				type="hidden" name="sum" value="${vo.sum}"> <input
				type="hidden" id="payMethodCode" name="payMethodCode" value="${vo.payMethodCode}">
			<input type="hidden" id="cardNo" name="cardNo" value="${vo.cardNo}">

			<section class="rsv_inner" id="section">
				<div id="sectionLeft">

					<div class="rsvInnerBox" id="reservationInformation">

						<div id="reservationInformationOutter">
							<h2>예약 정보</h2>
						</div>

						<div class="reservationInformationInner">
							<div>
								<div>
									<h3>날짜</h3>
								</div>

								<div id="days" class="days" id="checkInDate">
									<p id="stayPeriod">${vo.inDate}~${vo.outDate}</p>
								</div>
							</div>
							<div id="modifyDate">
								<span id="modifyDateText" role="button" onclick="editDate()">수정</span>
							</div>
						</div>
						<br>

						<div class="reservationInformationInner">
							<div>
								<div>
									<h3>인원</h3>
								</div>
								<div id="guestCount">${vo.guestCount}명</div>
							</div>
							<div id="modifyCntPeople">
								<span id="modifyCntPeopleText" role="button">수정</span>
							</div>
						</div>
					</div>

					<div class="rsvInnerBox" id="billingInformation">
						<div class="billingInformation" id="billingInformationTitle">
							<h2>결제수단</h2>
							<div class="billingInformation" id="payimgoutter">
								<div class="payimg">
									<img src="/journey/resources/img/book/visa.svg">
								</div>
								<div class="payimg">
									<img src="/journey/resources/img/book/amaxs.svg">
								</div>
								<div class="payimg">
									<img src="/journey/resources/img/book/npay.svg">
								</div>
								<div class="payimg">
									<img src="/journey/resources/img/book/kakaopay.png">
								</div>
							</div>
						</div>
						<section id="select_card">
							<div class="select">
								<div class="text" onclick="onClickSelect(event)">결제 방법 선택</div>
								<ul class="option-list">
									<c:forEach var="card" items="${cardVoList}">
										<li class="option" data-code="P1" data-no="${card.no}"
											data-code="P1" data-pwd="${card.pwd}"
											onclick="selectCard(event)" name="paymentMethod"><img
											src="/journey/resources/img/book/amaxs.svg">${card.no}|${card.cardNick}|
											${card.cardNum}|${card.pwd}</li>
									</c:forEach>
									<hr>
									<li>간편결제</li>
									<li class="option" onclick="selectCard(event)" data-code="P3"
										id="KAKAOPAY"><img
										src="/journey/resources/img/book/kakaopay.png"> KAKAO
										PAY</li>
									<li class="option" onclick="selectCard(event)" data-code="P3"
										id="TOSS-PAY"><img
										src="/journey/resources/img/book/Toss.png"> TOSS-PAY</li>
									<li class="option" onclick="selectCard(event)" data-code="P3"
										id="N-PAY"><img
										src="/journey/resources/img/book/npay.svg"> N-PAY</li>
									<hr>
									<li class="option" onclick="selectCard(event)" data-code="P2"
										id="deposit"><img
										src="/journey/resources/img/book/deposit.png"> 무통장입금</li>
								</ul>
							</div>
						</section>
						<div id="passwordSection" style="display: none;">
							<label for="passwordInput">비밀번호:</label> <input type="password"
								id="passwordInput">
							<button type="button" onclick="checkPassword()">확인</button>
							<div id="passwordError" style="color: red; display: none;">비밀번호가
								일치하지 않습니다</div>
							<div id="passwordSuccess" style="color: blue; display: none;">비밀번호가
								일치합니다</div>
						</div>

					</div>

					<div class="rsvInnerBox" id="sendMessageToHost">
						<div class="sendMessageToHost">
							<h2>호스트에게 메시지 보내기</h2>
						</div>
						<div class="sendMessageToHost">여행 목적, 동반 일행, 이 숙소를 선택한 이유 등을
							알려주세요.</div>
						<div class="sendMessageToHost">

							<div class="hostInformation">
								<div id="hostImgBox">
									<img id="hostImg"
										src="/journey/resources/upload/host/${vo.hostProfile}">
								</div>
								<div id="hostText">
									<div id="hostName">${vo.hostName}</div>
									<div>에어비앤비 가입 : ${vo.hostEnrollDate}</div>
								</div>
							</div>
						</div>
						<div class="sendMessageToHost">
							<textarea placeholder="안녕하세요. 숙소 도착 예정 시간은..."></textarea>
						</div>
					</div>
					<div class="rsvInnerBox" id="refundInfoText">
						<div class="refundInfoText">
							<h2>환불정책안내</h2>
						</div>
						<div class="refundInfoText">
							<span id="refundText">${refundPolicyText}</span> 그 이후에는 취소 시점에 따라
							환불액이 결정됩니다.
							<p>
								<span id="refundPolicy" role="button"><a
									href="javascript:openPop()"> 자세히 알아보기</a></span>
							</p>
						</div>
						<div id="passwordSection" style="display: none;">
							<label for="passwordInput">비밀번호:</label> <input type="password"
								id="passwordInput">
							<button type="button" onclick="checkPassword()">확인</button>
							<div id="passwordError" style="color: red; display: none;">비밀번호가
								일치하지 않습니다</div>
						</div>
						<div></div>
					</div>



					<div class="rsvInnerBox" id="rsvBtnText">
						아래 버튼을 선택하면 <span class="accommPolicy" role="button">호스트가
							설정한 숙소 이용규칙</span> , <span class="accommPolicy" role="button">게스트에게
							적용되는 기본 규칙</span> , <span class="accommPolicy" role="button">에어비앤비
							재예약 및 환불 정책</span> 에 동의하며, 피해에 대한 책임이 본인에게 있을 경우 에어비앤비가 <span
							class="accommPolicy" role="button">결제 수단으로 청구</span> 의 조치를 취할 수
						있다는 사실에 동의하는 것입니다. 호스트가 예약 요청을 수락하면 표시된 총액이 결제되는 데 동의합니다.
					</div>
					<div class="rsvInnerBox" id="rsvBtnBox">
						<button id="rsvBtn" type="submit">확인 및 결제</button>
					</div>
				</div>
			</section>
		</form>


		<aside id="aside">
			<div id="accommodationFeeDetails">
				<div id="paymentMethod">
					<div class="paymentMethod" id="roomInfo">
						<div id="roomImgBox">
							<img id="roomImg"
								src="/journey/resources/upload/room/${vo.roomImg}">
						</div>
						<div id="roomText">
							<div id="roomName">${vo.roomName}</div>
							<div>
								<span>'${vo.hostName}'님의 숙소</span>
							</div>
						</div>
					</div>
					<div class="paymentMethod">
						<h3>요금세부정보</h3>
						<div class="payInformation">
							<div class="result" id="result">₩${vo.weekdayPrice} x
								${vo.stayDay}박</div>
						</div>

						<div id="totalPayInfo" class="totalPayInfo">
							<div>
								<h3>총합계</h3>
							</div>
							<div id="totalPayInfoRight">
								<span id="sum" >${vo.sum}</span>
							</div>
						</div>
					</div>
				</div>
		</aside>
	</main>
	、

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<!-- 팝업창 -->
	<!-- 날짜수정 -->
	<div id="editDate_popup" class="popup">
		<div class="popup-content">
			<span class="closeBtn" onclick="close_editDate()">&times;</span>
			<h2>날짜 수정</h2>
			<div class="date-inputs">
				<div class="input-group">
					<label for="checkInDate">체크인 날짜</label> <input type="date"
						id="checkInDate" onchange="validateDates()">
				</div>
				<div class="input-group">
					<label for="checkOutDate">체크아웃 날짜</label> <input type="date"
						id="checkOutDate" onchange="validateDates()">
				</div>
			</div>
			<button id="saveDateBtn" class="saveDateBtn" onclick="saveDates()">수정</button>
		</div>
	</div>

	<!-- 인원수정 -->
	<div id="editPeople_popup" class="popup">
		<div class="popup-content">
			<span class="closeBtn" onclick="close_editPeople()">&times;</span>
			<h2>인원 수정</h2>
			<label for="peopleCountInput">인원:</label> <input type="number"
				id="peopleCountInput" min="1" max="10"><br>
			<button id="savePeopleBtn" class="savePeopleBtn">수정</button>
		</div>
	</div>



	<!-- 환불정책 -->
	<div id="popup_refundInfo" class="popup">
		<div class="popup-content">
			<span class="closeBtn" onclick="closePop()">&times;</span>
			<h2>환불정책</h2>
			<div class="refundInformation">
				<hr>
				<div>
					<div>전체 환불</div>
					<div>입실 1주일 이전가지는 100%를 환불받으실 수 있습니다.</div>
				</div>
				<div>
					<hr>
					<div>부분환불</div>
					<div>5일전 : 전체 숙박 요금 중 50%를 환불받으실 수 있습니다.</div>
					<div>3일전 : 전체 숙박 요금 중 30%를 환불받으실 수 있습니다.</div>
					<div>서비스 수수료는 전액 환불됩니다.</div>
					<hr>
					<div>환불 불가</div>
					<div>입실 2일전 부터는 환불이 불가능합니다.</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>