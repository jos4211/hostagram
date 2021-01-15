package com.koreait;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CommentServlet
 */


public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int co_useridx = (int) session.getAttribute("idx");
		int co_mcidx = Integer.parseInt(request.getParameter("contentidx"));
		String co_text = request.getParameter("cotext");
		System.out.println(co_mcidx+"cotext는"+co_text);
		ContentDAO dao = new ContentDAO();
		
		dao.setComment(co_useridx, co_mcidx, co_text);
	}

}
