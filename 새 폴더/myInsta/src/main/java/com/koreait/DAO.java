package com.koreait;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (conn == null) {
			final String url = "jdbc:mariadb://localhost:3306/ajax";
			final String id = "root";
			final String pw = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);

		}
		return conn;
	}
}

class ArticleDB {

//	public List<Article> getArticle(int start) {
//		List<Article> artList = new ArrayList<Article>();
//		String sql;
//		PreparedStatement pstmt;
//		ResultSet rs;
//		Connection conn;
//		Article art;
//		try {
//			System.out.println("자바 스타트:"+start);
//			conn = DAO.getConnection();
//			sql = "SELECT art_idx, art_content, art_img	FROM tb_article LIMIT " + start + ", 5;";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				art = new Article();
//				art.setArt_idx(rs.getInt("art_idx"));
//				art.setArt_content(rs.getString("art_content"));
//				art.setArt_img(rs.getString("art_img"));
//				artList.add(art);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return artList;
//	}

}
