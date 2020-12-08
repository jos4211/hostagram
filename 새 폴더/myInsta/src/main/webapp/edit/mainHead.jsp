<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="../js/heart_script.js"></script>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
int m_idx1 = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
%>
<style>
.hd_heart1 { position: relative; width: 30px;}
.hd_heart_sub1 {
    max-height: 360px;
    min-height: 100px;
    border: 1px solid #f1f1f1;
    background-color: white;
    border-radius: 6px;
    box-shadow: 1px 1px 1px 1px rgba(38, 38, 38, .1);
    display: none; 
    position: absolute;
    top: 42px;
    left: -257px;
    width: 470px;}
.hd_heart_sub1 .sub_prices { display: flex; border: none;   }
.hd_heart_sub1 .sub_prices { width: 98%; height: 63px;  padding: 10px 16px 12px; box-sizing: border-box; border-bottom: 1px solid #ccc; }
.hd_heart_sub1 .sub_prices .pr1 a img { display: inline-block; width: 30px; height: 30px; border-radius: 25px;}
.hd_heart_sub1 .sub_prices .pr1 { width: 13%; height: 100%; padding-top: 5px;}
.hd_heart_sub1 .sub_prices .pr2 { width: 75%; height: 100%; font-size: 16px; line-height: 20px;}
.hd_heart_sub1 .sub_prices .pr3 { width: 10%; height: 100%;}
.hd_heart_sub1 .sub_prices .pr3 input[type='button'] { width: 62px; height: 30px; background-color: white; font-size: 14px; font-weight: bold;
border: 1px solid #ccc; border-radius: 4px;}
.hd_heart_sub1.on {
    z-index: 29;
    display: inline-block;
}
</style>
<header id="header">
	<div class="header_area box_inner clear">
		<nav>
			<div class="header_img">
				<a href="../mainfeed.jsp"><img class="h_imgsize"
					src="images/hostagram.png">
				</a>
			</div>
			<div class="header_search">
				<form id="h_reform" action="../main_search.jsp?tag=" method="GET"
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
						<a href="../main_search.jsp?tag="> <svg aria-label="타임라인"
								class="ico_btn hd_heart1" fill="#262626" height="24" viewBox="0 0 48 48"
								width="24">
                            <path clip-rule="evenodd"
									d="M24 0C10.8 0 0 10.8 0 24s10.8 24 24 24 24-10.8 24-24S37.2 0 24 0zm0 45C12.4 45 3 35.6 3 24S12.4 3 24 3s21 9.4 21 21-9.4 21-21 21zm10.2-33.2l-14.8 7c-.3.1-.6.4-.7.7l-7 14.8c-.3.6-.2 1.3.3 1.7.3.3.7.4 1.1.4.2 0 .4 0 .6-.1l14.8-7c.3-.1.6-.4.7-.7l7-14.8c.3-.6.2-1.3-.3-1.7-.4-.5-1.1-.6-1.7-.3zm-7.4 15l-5.5-5.5 10.5-5-5 10.5z"
									fill-rule="evenodd"></path>
                        </svg>
						</a>
					</div>
					<div class="h_meunlist">
						<a class="m_like" href="#">
                  		<div class="hd_heart1">	
								<img class="hd_heartimg1" alt="활동피드" src="../images/2.PNG">
							</div>
							<div class="hd_heart_sub1">
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
										<a href="../other/otherperson.jsp?userid=<%=rs1.getString("otherfollow")%>"><img src='../uploads/<%=rs1.getString("otherpf") %>' alt="img"></a>
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
						<a class="m_like" href="../mypage.jsp"> <span
							class="mpage_img mypage" role="link" tabindex="0"
							style="width: 22px; height: 22px;"> <img alt="프로필 사진"
								class="my_p" draggable="false"
								src="../uploads/${sessionScope.profile}">
						</span>
						</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>