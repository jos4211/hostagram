<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="mainTitle.jsp"%>
</head>
<body>
	<div id="wrap">
		<form action="./main_search.jsp" method="GET" name="searchform">
			<%@ include file="mainHead.jsp"%>
		</form>
		<!-- 내용부분 -->
		<div class="dm_inner" id="container">
			<div class="main_rolling_pc box_inner ">
				<!-- 이 아래부터는 각자알아서 알맞게  -->
				<div class="dm_main">
					<div class="dm_box">
						<div class="dm_chatlist">
							<div class="dm_transmission">
								<div class="dm_trantxt">Driect</div>
								<button class="btn_tranimg"></button>
							</div>
							<div class="dm_chatroom"></div>
						</div>
						<div class="dm_chatting">
							<div class="dm_tranimg"></div>
							<h2>내 메시지</h2>
							<p>친구들에게 사진과 메시지를 보내보세요.</p>
							<button class="btn_transmission" type="button">메시지 보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>