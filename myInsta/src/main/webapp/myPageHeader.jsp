<%@page import="insta.db.DBConn"%>
<%@page import="com.koreait.ContentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.sql.*"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="./js/myPageHeader_script.js"></script>
<script type="text/javascript">
$(document).ready(function (e){
    $("#filebtn").change(function(e){

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
   
    
    function preview(arr){
      arr.forEach(function(f){      
        //div에 이미지 추가
        var str = '<div class="popcss1"><li>';
        $(".filecss").removeClass("disno");
        $(".filecss").addClass("on");
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러

            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100% />';
            str += '</li></div>';
            $(str).appendTo('.p_mTi');
            $(".filecss").addClass("on");
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100% height=100% />';
          $(str).appendTo('.p_mTi');
          $(".filecss").addClass("on");
        }
      });//arr.forEach
    }
  });
</script>

<style>
.p_lText, .p_lText2 {
	font-size: 16px;
	border: none;
	background: none;
	height: 21px;
}
</style>
<div id="p_myTitle">
	<form method="post" action="profile_edit.jsp" enctype="multipart/form-data">
	<div id="p_mTimg">
		<div class="p_mTi">
			<label class="p_mTiBtn" for="filebtn">
				<img alt="프로필 사진추가" src="./uploads/${sessionScope.profile}">
			</label>
				<input type="file" name="f_file" id="filebtn">
		</div>
			<p> <input type="submit" value="변경" class="filecss disno" ></p>
	</div>
	</form>
	<section id="p_myTName">
		<div id="p_myTN1">
			<h2>${sessionScope.id}</h2>
			<a class="p_myTN" href="./edit/edit1.jsp"><button
					class="p_myTNpa p_myTNBtn" type="button">프로필 편집</button></a>
			<div class="p_myTNpa2">
				<button class="p_myTNpa2Btn" type="button" id="mybtn">
					<svg aria-label="옵션" class="ico_btn" fill="#262626" height="24"
						viewBox="0 0 48 48" width="24">
                             <path clip-rule="evenodd"
							d="M46.7 20.6l-2.1-1.1c-.4-.2-.7-.5-.8-1-.5-1.6-1.1-3.2-1.9-4.7-.2-.4-.3-.8-.1-1.2l.8-2.3c.2-.5 0-1.1-.4-1.5l-2.9-2.9c-.4-.4-1-.5-1.5-.4l-2.3.8c-.4.1-.8.1-1.2-.1-1.4-.8-3-1.5-4.6-1.9-.4-.1-.8-.4-1-.8l-1.1-2.2c-.3-.5-.8-.8-1.3-.8h-4.1c-.6 0-1.1.3-1.3.8l-1.1 2.2c-.2.4-.5.7-1 .8-1.6.5-3.2 1.1-4.6 1.9-.4.2-.8.3-1.2.1l-2.3-.8c-.5-.2-1.1 0-1.5.4L5.9 8.8c-.4.4-.5 1-.4 1.5l.8 2.3c.1.4.1.8-.1 1.2-.8 1.5-1.5 3-1.9 4.7-.1.4-.4.8-.8 1l-2.1 1.1c-.5.3-.8.8-.8 1.3V26c0 .6.3 1.1.8 1.3l2.1 1.1c.4.2.7.5.8 1 .5 1.6 1.1 3.2 1.9 4.7.2.4.3.8.1 1.2l-.8 2.3c-.2.5 0 1.1.4 1.5L8.8 42c.4.4 1 .5 1.5.4l2.3-.8c.4-.1.8-.1 1.2.1 1.4.8 3 1.5 4.6 1.9.4.1.8.4 1 .8l1.1 2.2c.3.5.8.8 1.3.8h4.1c.6 0 1.1-.3 1.3-.8l1.1-2.2c.2-.4.5-.7 1-.8 1.6-.5 3.2-1.1 4.6-1.9.4-.2.8-.3 1.2-.1l2.3.8c.5.2 1.1 0 1.5-.4l2.9-2.9c.4-.4.5-1 .4-1.5l-.8-2.3c-.1-.4-.1-.8.1-1.2.8-1.5 1.5-3 1.9-4.7.1-.4.4-.8.8-1l2.1-1.1c.5-.3.8-.8.8-1.3v-4.1c.4-.5.1-1.1-.4-1.3zM24 41.5c-9.7 0-17.5-7.8-17.5-17.5S14.3 6.5 24 6.5 41.5 14.3 41.5 24 33.7 41.5 24 41.5z"
							fill-rule="evenodd"></path>
                         </svg>
				</button>
				<div id="popup">
					<div id="popmenu">
						<button class="">
							<a href="./edit/edit2.jsp">비밀번호 변경</a>
						</button>
						<button class="mybtn2">
							<a href="#">문제신고</a>
						</button>
						<button class="">
							<a href="./login/login.jsp">로그 아웃</a>
						</button>
						<button class="">
							<a href="#">취소</a>
						</button>
					</div>
				</div>

				<div id="popup2">
					<div id="popmenu2">
						<div class="pop2_header">
							<div class="pop2_h1">
								<h1>문제 신고</h1>
							</div>
							<div class="pop2_b">
								<button class="pop2_btn" type="button" class="btn">
									<svg aria-label="닫기" class="btn_a" fill="#262626" height="24"
										viewBox="0 0 48 48" width="24">
					                <path clip-rule="evenodd"
											d="M41.1 9.1l-15 15L41 39c.6.6.6 1.5 0 2.1s-1.5.6-2.1 0L24 26.1l-14.9 15c-.6.6-1.5.6-2.1 0-.6-.6-.6-1.5 0-2.1l14.9-15-15-15c-.6-.6-.6-1.5 0-2.1s1.5-.6 2.1 0l15 15 15-15c.6-.6 1.5-.6 2.1 0 .6.6.6 1.6 0 2.2z"
											fill-rule="evenodd"></path></svg>
								</button>
							</div>
						</div>
						<div class="pop2_box">
							<!-- 복붙 -->
									<!--  <form id="h_reform" name="regform" method="post" action="report_ok.jsp">-->
							<div class="texta_box">
								<textarea class="P1TbB" id="reportText" placeholder="발생한 문제를 간단하게 설명해주세요."></textarea>
							</div>
							<div class="pop2_btns">
								<button class="pop2_b1" id="reportBtn" type="button">신고 보내기</button>
							</div>
							<div class="pop2_text">
								<div class="t">회원님의 Instagram 사용자 이름과 브라우저 정보가 자동으로 신고에
									포함됩니다.</div>
							</div>
									<!--  </form> -->
						</div>
					</div>
				</div>
						<div id="reportOk">
					        <div id="reportOk_menu">
					            <div class="reportOk_box">신고가 접수 되었습니다.</div>
					            <button type="button" id="ok_btn">확인</button>
					        </div>
					    </div>
							<script>
						    $("#reportBtn").click(function(){
						    	if($("#reportText").val() != ""){
							    	let xhr = new XMLHttpRequest();
							    	let text = $("#reportText").val();
							    	xhr.open("GET", "./report?id=<%=session.getAttribute("id")%>&text="+text, true);
							    	xhr.send();
							    	$("#popup2").fadeOut();
							    	$("#reportOk").fadeIn();
						    	}
						    });
						    	$("#ok_btn").click(function(){
							    		$("#reportOk").fadeOut();
							    });
						    
							</script>
						<!-- 복붙 끝 -->

			</div>
		</div>
		<%
			ContentDAO cdao = new ContentDAO();
		%>
		<ul id="p_myTN1">
			<li class="p_myTN1_list"><span class="p_lText0">게시물 <span
					class="p_lNum"><%=cdao.getCntContentById(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%></span>
			</span></li>
			<li class="p_myTN1_list"><button class="p_lText" href="#"
					style="cursor: pointer;">
					팔로워 <span class="p_lNum cntfollower"> <%=cdao.getCntFollower(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%>
					</span>
				</button></li>
			<div class="fp">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<button class="exit_btn">&times;</button>
							</div>
						</div>
						<div class="pop_body">
							<ul>
								<div class="body_ing myFollower">
									<%
										request.setCharacterEncoding("UTF-8");
									int m_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));

									System.out.println("m_idx = " + m_idx);
									Connection conn = null;
									PreparedStatement pstmt = null;
									ResultSet rs = null;

									String sql = "";
									String url = "jdbc:mariadb://localhost:3306/insta";
									String uid = "root";
									String upw = "1234";

									try {
										Class.forName("org.mariadb.jdbc.Driver");
										conn = DriverManager.getConnection(url, uid, upw);
										if (conn != null) {
											sql = "SELECT m2.m_userid AS me , m1.m_userid AS otherfollow, m1.m_filepath As profile, tb_following.fi_useridx  FROM tb_following";
											sql += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
											sql += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_followingid = ?";
											pstmt = conn.prepareStatement(sql);
											pstmt.setInt(1, m_idx);
											rs = pstmt.executeQuery();
											while (rs.next()) {
										int followingid = rs.getInt("fi_useridx");
										System.out.println("followingid = " + followingid);
									%>
									<li><input type="hidden" value="<%=rs.getString("otherfollow")%>">
										<div class="ing_li">
											<div class="li_img">
												<a href="other/otherperson.jsp?userid=<%=rs.getString("otherfollow")%>"><img src="./uploads/<%=rs.getString("profile")%>" alt="프사"></a>
											</div>
											<div class="li_id">
												<p><%=rs.getString("otherfollow")%></p>
											</div>
											<div class="li_btn">
												<%
													if (cdao.getFollowingById(m_idx, followingid) > 0) {
												%>
												<input type="button" style="cursor: pointer;" value="팔로잉"
													class="fw_btn">

												<%
													} else {
												%>
												<input type="button" value="팔로우" class="fw_btn"
													style="background-color: #0095f6; color: white; cursor: pointer;">

												<%
													}
												%>
												<input type="hidden" value="<%=followingid%>">
											</div>
										</div>
									</li>
									<%
										}
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
								</div>
							</ul>

							<!--	<div class="body_h1">
								 <h1>회원님을 위한 추천</h1>
							</div>
							<ul>
								<div class="body_ing">
									<li>
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="./images/person_icon.jpg" alt="프사"></a>
											</div>
											<div class="li_id">
												<p>id</p>
											</div>
											<div class="li_btn li_btn2">
												<input type="button" value="팔로우" class="fw_btn">
											</div>

										</div>
									</li>
								</div>
							</ul>-->

						</div>
					</div>
				</div>
			</div>
			<li class="p_myTN1_list"><button class="p_lText2" href="#"
					style="cursor: pointer;">
					팔로우 <span class="p_lNum cntfollow"> <%=cdao.getCntFollow(m_idx)%></span>
				</button></li>
			<div class="fp2">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<button class="exit_btn">&times;</button>
							</div>
						</div>
						<div class="pop_body">
							<ul>
								<div class="body_ing myFollow">
									<%
										try {
										Class.forName("org.mariadb.jdbc.Driver");
										conn = DriverManager.getConnection(url, uid, upw);
										if (conn != null) {
											sql = "SELECT m1.m_userid AS me , m2.m_userid AS ifollow, tb_following.fi_followingid, m2.m_filepath as profile FROM tb_following";
											sql += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
											sql += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_useridx = ?";
											pstmt = conn.prepareStatement(sql);
											pstmt.setInt(1, m_idx);
											rs = pstmt.executeQuery();
											while (rs.next()) {
										int followingid = rs.getInt("fi_followingid");
										System.out.println("followingid = " + followingid);
									%>
									<li class="<%=rs.getString("ifollow")%>"><input
										type="hidden" value="<%=rs.getString("ifollow")%>">
										<div class="ing_li">
											<div class="li_img">
												<a href="other/otherperson.jsp?userid=<%=rs.getString("ifollow")%>"><img src="./uploads/<%=rs.getString("profile") %>" alt="#"></a>
											</div>
											<div class="li_id">
												<p><%=rs.getString("ifollow")%></p>
											</div>
											<div class="li_btn">
												<%
													if (cdao.getFollowingById(m_idx, followingid) > 0) {
												%>
												<input type="button" style="cursor: pointer;" value="팔로잉"
													class="fw_btn">
												<%
													} else {
												%>
												<input type="button" value="팔로우" class="fw_btn"
													style="background-color: #0095f6; color: white; cursor: pointer;">

												<%
													}
												%>
												<input type="hidden" value="<%=followingid%>">
											</div>
										</div></li>
									<%
										}
									}
									} catch (Exception e) {
										e.printStackTrace();
									}finally {
										DBConn.close(conn, pstmt, rs);
									}
									%>
								</div>
							</ul>
							<!--  
                <div class="body_h1">
                    <h1>회원님을 위한 추천</h1>
                </div>
                <ul>
                    <div class="body_ing">
                        <li>
                            <div class="ing_li">
                                <div class="li_img">
                                    <a href="#"><img src="./images/person_icon.jpg" alt="#"></a>
                                </div>
                                <div class="li_id">
                                    <p>id</p>
                                </div>
                                <div class="li_btn li_btn2">
                                    <button class="fw_btn">팔로우</button>
                                </div>
                            </div>
                        </li>
                    </div>
                </ul>
                -->
						</div>
					</div>
				</div>
			</div>

		</ul>
		<div id="p_myTN3">
			<h1 class="rhpdm"><%=session.getAttribute("intro")%></h1>
		</div>
	</section>
</div>