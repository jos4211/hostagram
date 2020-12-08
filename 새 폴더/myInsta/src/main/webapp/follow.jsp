<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memberList" value="${contentDAO.getMemberList(0) }" />
<jsp:useBean class="insta.member.MemberDAO" id="mem_dao" />
<c:set var="memberDao" value="<%=mem_dao %>" />
<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
  $(() => {
    const setbtnActions1 = function () {
        $(".btnFolloing").on("click", function () {
			const btnFi = $(this);
			const followingid=$(this).next().val();
			console.log(followingid);
            axios
                .post("./FollowServlet", "followingid=" + followingid)
                .then(function (response) {
                    if (btnFi.val() == "팔로우") {
                       btnFi.val("팔로잉").css("backgroundColor", "white").css("color", "black");
                    } else if (btnFi.val() == "팔로잉") {
                       btnFi.val("팔로우").css("backgroundColor", "#3897f0").css("color", "white").css("border", "1px solid #3897f0");
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
        });
    };
    setbtnActions1();
});

</script>
<%@ include file="mainTitle.jsp"%>
</head>

<body>
	<div id="wrap">
		<form id="h_reform" action="./main_search.jsp" method="GET"
			name="searchform">
			<%@ include file="mainHead.jsp"%>
			<!-- 내용부분 -->
			<div id="container">
				<div class="main_rolling_pc box_inner">
					<!-- 이 아래부터는 각자알아서 알맞게 -->
					<div class="visualRoll">


						<main class="explore">
							<h2 class=extitle>활동</h2>
							<section class="people">
								<ul class="people__list">




									<c:forEach var="item" items="${memberList}" varStatus="status">
										<c:if test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
										<li class="people__person">
											<div class="people__column">
												<div class="people__avatar-container">
													<a href="./other/otherperson.jsp?userid=${item.m_userid }"> <img src="./uploads/${memberDao.profile(item.m_idx,'') }"
														class="people__avatar" />
													</a>
												</div>
												<div class="people__info">
													<span class="people__username"> <a href="./other/otherperson.jsp?userid=${item.m_userid }">
															${item.m_userid } </a> <img src="" />
													</span> <span class="people__full-name">${item.m_username }</span>
													<p class="people__full-name">회원님을 위한 추천</p>
												</div>
											</div>
											<div class="people__column">
												<c:if
													test="${0<contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
													<input type="button" value="팔로잉" style="background-Color: white; color:black;" class="btnFolloing" />
												</c:if>
												<c:if
													test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
													<input type="button" value="팔로우" class="btnFolloing" />
												</c:if>
												<input type="hidden" name="mIdx" value="${item.m_idx}">
											</div>
										</li>
									</c:if>
									</c:forEach>
									<li class="people__person">
										<div class="people__column">
											<a href="./mainfeed.jsp"> <input type="button"
												id="startbutton" value="시작하기" />
											</a>
										</div>
									</li>
								</ul>
							</section>
						</main>

					</div>
				</div>
			</div>
			<!-- End -->
	</div>
	</div>
	</div>
	<%@ include file="mainFooter.jsp"%>
	</form>
	</div>
</body>
</html>