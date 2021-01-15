package com.koreait;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.koreait.CommentDTO;
import com.koreait.Content;

public class GetSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		int start = Integer.parseInt(request.getParameter("start"));
		String tag = String.valueOf(request.getParameter("tag"));
		System.out.println("서블릿스타트:" + start);

		response.getWriter().write(getJSON(start, tag));
	}

	protected String getJSON(int start, String tag) throws IOException {
		ContentDAO dao = new ContentDAO();
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode result = mapper.createArrayNode();
		List<SearchDTO> artList = dao.getSearchList(start, tag);
		ObjectNode article = mapper.createObjectNode();
		for (int i = 0; i < artList.size(); i++) {
			article.put("idx", artList.get(i).getMc_idx());
			article.put("img", artList.get(i).getMc_imageurl());
			article.put("like", dao.getCntLikes(artList.get(i).getMc_idx()));
			article.put("comment", dao.getCntComment(artList.get(i).getMc_idx()));
			result.add(article);
			article = mapper.createObjectNode();
		}
		ObjectNode setResult = mapper.createObjectNode();
		setResult.set("result", result);
		String strResult = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(setResult);
		System.out.println(strResult);
		return strResult;
	}

	protected ArrayNode convertList(List<SearchDTO> list)
			throws JsonGenerationException, JsonMappingException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode anode = mapper.valueToTree(list);

		return anode;
	}

}
