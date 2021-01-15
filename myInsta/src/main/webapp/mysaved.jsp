<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.koreait.CommentDTO"%>
<%@page import="com.koreait.Content"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="mainTitle.jsp" %>
<%
	int useridx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	List<Content> conList = contentDAO.getSaveContent(useridx);
%>
</head>
<body>
<div id="wrap">
<form id="h_reform" method="post" action="myupdate_ok.jsp" enctype="multipart/form-data">
	<%@ include file="mainHead.jsp" %>
    <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div id="page_myPage"> 
     			<%@ include file="myPageHeader.jsp" %>
     			<div id="p_myList">
                            <a class="p_myL" href="./mypage.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="게시물" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path clip-rule="evenodd" d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z" fill-rule="evenodd"></path>
                                    </svg>
                                    <span class="p_mLText">게시물</span>
                                </span>
                            </a>
                            <a class="p_myL " href="./myupdate.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="게시물올리기" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M41 10c-2.2-2.1-4.8-3.5-10.4-3.5h-3.3L30.5 3c.6-.6.5-1.6-.1-2.1-.6-.6-1.6-.5-2.1.1L24 5.6 19.7 1c-.6-.6-1.5-.6-2.1-.1-.6.6-.7 1.5-.1 2.1l3.2 3.5h-3.3C11.8 6.5 9.2 7.9 7 10c-2.1 2.2-3.5 4.8-3.5 10.4v13.1c0 5.7 1.4 8.3 3.5 10.5 2.2 2.1 4.8 3.5 10.4 3.5h13.1c5.7 0 8.3-1.4 10.5-3.5 2.1-2.2 3.5-4.8 3.5-10.4V20.5c0-5.7-1.4-8.3-3.5-10.5zm.5 23.6c0 5.2-1.3 7-2.6 8.3-1.4 1.3-3.2 2.6-8.4 2.6H17.4c-5.2 0-7-1.3-8.3-2.6-1.3-1.4-2.6-3.2-2.6-8.4v-13c0-5.2 1.3-7 2.6-8.3 1.4-1.3 3.2-2.6 8.4-2.6h13.1c5.2 0 7 1.3 8.3 2.6 1.3 1.4 2.6 3.2 2.6 8.4v13zM34.6 25l-9.1 2.8v-3.7c0-.5-.2-.9-.6-1.2-.4-.3-.9-.4-1.3-.2l-11.1 3.4c-.8.2-1.2 1.1-1 1.9.2.8 1.1 1.2 1.9 1l9.1-2.8v3.7c0 .5.2.9.6 1.2.3.2.6.3.9.3.1 0 .3 0 .4-.1l11.1-3.4c.8-.2 1.2-1.1 1-1.9s-1.1-1.2-1.9-1z"></path>
                                    </svg>
                                    <span class="p_mLText">게시물올리기</span>
                                </span>
                            </a>
                            <a class="p_myL p_Using" href="./mysaved.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="저장됨" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M43.5 48c-.4 0-.8-.2-1.1-.4L24 29 5.6 47.6c-.4.4-1.1.6-1.6.3-.6-.2-1-.8-1-1.4v-45C3 .7 3.7 0 4.5 0h39c.8 0 1.5.7 1.5 1.5v45c0 .6-.4 1.2-.9 1.4-.2.1-.4.1-.6.1zM24 26c.8 0 1.6.3 2.2.9l15.8 16V3H6v39.9l15.8-16c.6-.6 1.4-.9 2.2-.9z"></path>
                                    </svg>
                                    <span class="p_mLText">저장됨</span>
                                </span>
                            </a>
                            <a class="p_myL" href="./mytagged.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="태그됨" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path>
                                    </svg>
                                    <span class="p_mLText">태그됨</span>
                                </span>
                            </a>
                        </div>
                        <div id="p_myContent">
                        <%
							if(conList.size() == 0){
						%>
                            <div class="ts_Box">
                                <div class="t_Box">
                                    <div class="t_bImg">
                                        <img src="images/save_icon.PNG" alt="저장 아이콘">
                                    </div>
                                    <h2>저장</h2>
                                    <p>다시 보고 싶은 사진과 동영상을 저장하세요. 콘텐츠를 저장해도 다른 사람에게 알림이 전송되지 않으며, 저장된 콘텐츠는 회원님만 볼 수 있습니다.</p>
                                </div>
                            </div>
						
						<%
							}
							for(int i=0; i<conList.size(); i++){
							
						%>
							<ul class="p_myCBox">
								<li>
									<a class="" href="contentPage.jsp?b_idx=<%=conList.get(i).getMc_idx()%>">
									<img class="p_myCBoxImg" alt="" src="./uploads/<%=conList.get(i).getMc_imageurl()%>">									
									</a>
								</li>
							</ul>
						<%
							}
						%>
                        </div>
                        
                        
     			
             <!-- End -->   
            </div>
        </div>
    </div>
	<%@ include file="mainFooter.jsp" %>
</form>
</div>
</body>
</html>