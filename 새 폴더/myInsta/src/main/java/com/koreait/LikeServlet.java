package com.koreait;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int useridx = (int) session.getAttribute("idx");
		int contentidx = Integer.parseInt(request.getParameter("contentidx"));
		ContentDAO dao = new ContentDAO();
		dao.editLike(contentidx, useridx);
	}

}
