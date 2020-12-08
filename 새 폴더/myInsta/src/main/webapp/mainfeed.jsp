<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<%@ page import="java.sql.*" %>


<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>
<%
request.setCharacterEncoding("UTF-8");
int m_idx1=0;
if(session.getAttribute("idx")!=null){
m_idx1 = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
}
%>
<c:set var="memberLists" value="${contentDAO.getMemberLists(0) }" />
<c:set var="contentList" value="${contentDAO.getContentsForIssue() }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="mainTitle.jsp" %>
<link rel="stylesheet" href="./cssmain/common.css"/>
<script src="./js/heart_script.js"></script>
</head>
<body>
	<div id="wrap">
		<form id="h_reform" action="./main_search.jsp" method="GET"
			name="searchform">
<header id="header">
	<div class="header_area box_inner clear">
		<nav>
			<div class="header_img">
				<a href="mainfeed.jsp"> <img class="h_imgsize"
					src="images/hostagram.png">
				</a>
			</div>
			<div class="header_search">
				<form id="h_reform" action="./main_search.jsp" method="GET"
					name="searchform">
					<input class="h_Search" type="text" name="tag" placeholder="검색">
				</form>
			</div>
			<div class="header_meun">
				<div class="h_meun">
					<div class="h_meunlist">
						<a href="mainfeed.jsp"> <svg aria-label="홈" class="ico_btn"
								fill="#262626" height="22" viewBox="0 0 48 48" width="22">
                            <path
									d="M45.5 48H30.1c-.8 0-1.5-.7-1.5-1.5V34.2c0-2.6-2.1-4.6-4.6-4.6s-4.6 2.1-4.6 4.6v12.3c0 .8-.7 1.5-1.5 1.5H2.5c-.8 0-1.5-.7-1.5-1.5V23c0-.4.2-.8.4-1.1L22.9.4c.6-.6 1.6-.6 2.1 0l21.5 21.5c.3.3.4.7.4 1.1v23.5c.1.8-.6 1.5-1.4 1.5z"></path>
                        </svg>
						</a>
					</div>
					<div class="h_meunlist">
						<a href="./main_search.jsp?tag="> <svg aria-label="타임라인"
								class="ico_btn" fill="#262626" height="24" viewBox="0 0 48 48"
								width="24">
                            <path clip-rule="evenodd"
									d="M24 0C10.8 0 0 10.8 0 24s10.8 24 24 24 24-10.8 24-24S37.2 0 24 0zm0 45C12.4 45 3 35.6 3 24S12.4 3 24 3s21 9.4 21 21-9.4 21-21 21zm10.2-33.2l-14.8 7c-.3.1-.6.4-.7.7l-7 14.8c-.3.6-.2 1.3.3 1.7.3.3.7.4 1.1.4.2 0 .4 0 .6-.1l14.8-7c.3-.1.6-.4.7-.7l7-14.8c.3-.6.2-1.3-.3-1.7-.4-.5-1.1-.6-1.7-.3zm-7.4 15l-5.5-5.5 10.5-5-5 10.5z"
									fill-rule="evenodd"></path>
                        </svg>
						</a>
					</div>
					<div class="h_meunlist">
						<a class="m_like" href="#"> 
						<div class="hd_heart">
                  			<img class="hd_heartimg" alt="활동피드" src="./images/2.PNG">
                        </div>
							<div class="hd_heart_sub">
								<%
									

									System.out.println("m_idx = " + m_idx1);
									Connection conn1 = null;
									PreparedStatement pstmt1 = null;
									ResultSet rs1 = null;

									String sql1 = "";
									String url1 = "jdbc:mariadb://localhost:3306/insta";
									String uid1 = "root";
									String upw1 = "1234";

									try {
										Class.forName("org.mariadb.jdbc.Driver");
										conn1 = DriverManager.getConnection(url1, uid1, upw1);
										if (conn1 != null) {
											sql1 = "SELECT m2.m_userid AS me , m1.m_userid AS otherfollow, m1.m_filepath AS otherpf,  tb_following.fi_useridx  FROM tb_following";
											sql1 += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
											sql1 += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_followingid = ?";
											pstmt1 = conn1.prepareStatement(sql1);
											pstmt1.setInt(1, m_idx1);
											rs1 = pstmt1.executeQuery();
											while (rs1.next()) {
										int followingid = rs1.getInt("fi_useridx");
										System.out.println("followingid = " + followingid);
									%>
								<div class="sub_prices">
									<!-- <input type="hidden" value="no" class="sub_hide"> -->
									<div class="pr1">
										<a href="./other/otherperson.jsp?userid=<%=rs1.getString("otherfollow")%>"><img src='./uploads/<%=rs1.getString("otherpf") %>' alt="img"></a>
									</div>
									<div class="pr2">
										<p><%=rs1.getString("otherfollow")%></p>
										<p>님이 회원님을 팔로우하기 시작했습니다</p>
									</div>
									<div class="pr3">
										<p>
											<input type="button" value="팔로잉" class="f_btn">
										</p>
									</div>
								</div>
								<%
										}
									}
									} catch (Exception e1) {
										e1.printStackTrace();
									}
									%>
							</div>
						</a>
					</div>
					<div class="h_meunlist">
						<a class="m_like" href="mypage.jsp"> <span
							class="mpage_img mypage" role="link" tabindex="0"
							style="width: 22px; height: 22px;"> <img alt="프로필 사진"
								class="my_p" draggable="false"
								src="./uploads/${sessionScope.profile}">
						</span>
						</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>
			<!-- 내용부분 -->
			<div id="container">
				<div class="main_rolling_pc box_inner">
					<!-- 이 아래부터는 각자알아서 알맞게 -->
					<div id="main_feed">
						<div id="feed_roll">
							<div id="feed_box"></div>
							<div class="widget_box" id="widget_container">
								<div class="widget" id="widget">
									<div class="widget_my_box">
										<div class="widget_my_img">
											<a class="off_story" href="./mypage.jsp"> <a
												class="on_story" href="./mypage.jsp"> <img
													src="./uploads/${sessionScope.profile}"
													alt="" />
											</a>
											</a>
										</div>
										<div class="widget_my_account">
											<div>
												<a id="myaccountId" href="./mypage.jsp">${sessionScope.id }</a>
											</div>
											<div class="my_account_name">${sessionScope.name }</div>
										</div>
									</div>
									<div class="widget_hotissue_box">
										<div class="wget_hotissue_header">
											<a href="#">추천</a>
										</div>
										<div class="wget_hot_categories">
											<div class="hot_category">
												<a href="./main_search.jsp?tag=여행">여행</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=예술">예술</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=음식">음식</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=style">스타일</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=건축">건축</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=영화">TV 및 영화</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=예술">예술</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=음악">음악</a>
											</div>
										</div>
										<div class="wget_hot_carousel">
											<div class="carousel_imgs" style="right: 0px;">
												<c:forEach var="item" items="${contentList }">
													<div>
														<a href="./contentPage.jsp?b_idx=${item.mc_idx }"><img
															src="uploads/${item.mc_imageurl }"
															onerror="this.onerror=null;this.src='https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg';"
															alt="" /></a>
													</div>

												</c:forEach>
											</div>

											<div class="carousel_nav">
												<div class="car_nav_btnBefore">
													<span class="nav_btnBefore"></span>
												</div>
												<div class="car_nav_btnNext">
													<span class="nav_btnNext"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="widget_recommend_box">
										<div class="wget_recommend_header">
											<p>회원님을 위한 추천</p>
											<a href="follow.jsp" class="recommend_btnAll">모두 보기</a>
										</div>
										<div class="wget_recommend_list">

											<c:forEach var="item" items="${memberLists }">
												<c:if
													test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
													<div class="recom_list_item" style="margin-bottom: 5px;">
														<div class="recom_item_img">
														<!-- 복붙 -->
															<a class="off_story" href="./other/otherperson.jsp?userid=${item.m_userid }"> <a class="on_story" 
															href="./other/otherperson.jsp?userid=${item.m_userid }"> <img
																	src="uploads/${item.m_filepath}"
																	alt="" />
																	
															</a>
															</a>
														</div>
														<div class="recom_item_account">
															<div>
																<a href="./other/otherperson.jsp?userid=${item.m_userid }">${item.m_userid }</a>
															</div>
															<!-- 복붙 끝 -->
															<div class="recom_account_reason">회원님을 위한 추천</div>
														</div>
														<div class="recom_item_btnFollow">
															<c:if
																test="${0<contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
																<button class="item_btnFollow"
																	style="background-Color: white; color: black;">팔로잉</button>
															</c:if>
															<c:if
																test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
																<button class="item_btnFollow">팔로우</button>
															</c:if>
															<input type="hidden" name="mIdx" value="${item.m_idx }">
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<footer id="mainfooter">
										<div class="mainfooter_area box_inner clear"
											style="width: 100%; text-align: left; padding: 0px;">
											<div class="mainf_area1">
												<ul>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://about.instagram.com/about-us">소개</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/">도움말</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://about.instagram.com/blog/">홍보 센터</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/developer/">API</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/about/jobs/">채용 정보</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/directory/hashtags/">해시태그</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/519522125107875">개인정보처리방법</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/581066165581870">약관</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/explore/locations/">위치</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/directory/profiles/">인기계정</a></li>
													<li><a style="color: rgb(200, 200, 200);" href="">언어</a></li>
												</ul>
											</div>
											<div class="f_area2">© 2020 HOSTAGRAM FROM 호스타그램</div>
										</div>
									</footer>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>


	</div>
</body>
</html>
