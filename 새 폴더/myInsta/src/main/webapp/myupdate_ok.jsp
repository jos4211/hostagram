<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page import="insta.board.FileService"%>
<%
	FileService fs = new FileService();
	int maxSize = 10 * 1024 * 1024; // 10MB
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024]; // 한번에 읽어들일 버퍼의 크기

	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format,
				new DefaultFileRenamePolicy());
		int mc_useridx = (int)session.getAttribute("idx");
		String mc_content = multi.getParameter("mc_content");
		String mc_taggedid = multi.getParameter("mc_taggedid");
		String mc_taggedname = multi.getParameter("mc_taggedname");
		uploadFile = multi.getFilesystemName("mc_file"); // form의 input file객체이며, 실제로 업로드된 파일명

		System.out.println("mc_useridx : " + mc_useridx);
		System.out.println("mc_content : " + mc_content);
		System.out.println("mc_taggedid : " + mc_taggedid);
		System.out.println("mc_taggedname : " + mc_taggedname);
		System.out.println("uploadFile : " + uploadFile);

		File file = new File(savePath + "/" + uploadFile);
		out.println("file : " + file);
		if(fs.fileUpload(mc_useridx, mc_content, mc_taggedid, mc_taggedname, file)){
			response.sendRedirect("mypage.jsp");
		}else{
			out.print("<script>history.back();</script>");
		}

	}catch(Exception e){
		e.printStackTrace();
	}
%>
