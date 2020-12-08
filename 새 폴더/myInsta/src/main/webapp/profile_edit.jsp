<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="insta.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page import="insta.board.FileService"%>
<%@ page import="java.sql.*"%>
<%
Calendar c = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	MemberDTO memberDTO = new MemberDTO();
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mariadb://localhost:3306/insta";
	String uid = "root";
	String upw = "1234";

	FileService fs = new FileService();
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	
	int maxSize = 10 * 1024 * 1024;
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024];
	
	try {
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format,
				new DefaultFileRenamePolicy());
		uploadFile = multi.getFilesystemName("f_file");
		File file = new File(fs.SAVE_PATH+"/"+uploadFile);
		
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null) {
			sql = "UPDATE tb_member SET m_filepath = ? WHERE m_idx = ?";
			pstmt = conn.prepareStatement(sql);
			String tmp = "/" + FileService.getToday() + "/" + idx+sdf.format(c.getTime()) + ".dev";
			memberDTO.setM_filepath(tmp);
			pstmt.setString(1, tmp);
			pstmt.setInt(2, idx);
			System.out.println("tmp = " + tmp);
		
			int result = pstmt.executeUpdate();
			
			if(result >= 0) {
		
			}
			File dir = new File(fs.SAVE_PATH + "/" + FileService.getToday() + "/");
			session.setAttribute("profile",tmp);
			if(!dir.isDirectory()) {
				dir.mkdir();	System.out.println("여기오나");
			}
			System.out.println("여기오나2");
			if(file.isFile()) {
				System.out.println(fs.SAVE_PATH + tmp);
				File newFile = new File(fs.SAVE_PATH + tmp);
				file.renameTo(newFile);
				System.out.println("여기오나3");
			}
			%>
<script>
	alert("성공");
	location.href = "mypage.jsp";
</script>
<%
			}else {
				%>
<script>
	alert("실패");
	history.back();
</script>
<%
			}
		
				
	}catch(Exception e) {
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>