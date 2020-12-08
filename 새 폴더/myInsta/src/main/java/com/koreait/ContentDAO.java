package com.koreait;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import insta.db.DBConn;
import insta.db.SqlMapConfig;
import insta.member.MemberDAO;
import insta.member.MemberDTO;

public class ContentDAO {
	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	SqlMapConfig smc = new SqlMapConfig();
	SqlSessionFactory sessionf = smc.getSqlMapInstance();
	SqlSession sqlsession;

	public ContentDAO() {
		sqlsession = sessionf.openSession(true);
	
	}

	public List<Content> getContents(int start, int useridx) {
		sqlsession = sessionf.openSession(true);
		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();
		dataMap.put("useridx", useridx);
		dataMap.put("start", start);
		List<Content> conList = sqlsession.selectList("Content.selectContent", dataMap);
	
		sqlsession.close();
		return conList;
	}

	public int getCntLikes(int contentidx) {
		String sql;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT count(l_idx) FROM tb_like WHERE l_mcidx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return cnt;
	}

	public boolean getLikeById(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		boolean isOk = false;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT l_idx FROM tb_like WHERE l_mcidx=? AND l_useridx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			pstmt.setInt(2, useridx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isOk = true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return isOk;
	}

	public int editLike(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt = null;
		int result = -1;
		Connection conn = null;

		try {
			boolean isOk = getLikeById(contentidx, useridx);
			if (!isOk) {
				conn = DBConn.getConnection();
				sql = "INSERT INTO tb_like (l_mcidx, l_useridx) VALUES (?,?);";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
			
			} else {
				conn = DBConn.getConnection();
				sql = "DELETE FROM tb_like WHERE l_mcidx=? AND l_useridx=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
	
		return result;
	}

	public boolean getSaveById(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		boolean isOk = false;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT s_idx FROM tb_save WHERE s_mcidx=? AND s_useridx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			pstmt.setInt(2, useridx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isOk = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return isOk;
	}

	public int editSave(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt = null;
		int result = -1;
		Connection conn = null;

		try {
			boolean isOk = getSaveById(contentidx, useridx);
			if (!isOk) {
				conn = DBConn.getConnection();
				sql = "INSERT INTO tb_save (s_mcidx, s_useridx) VALUES (?,?);";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
			
			} else {
				conn = DBConn.getConnection();
				sql = "DELETE FROM tb_save WHERE s_mcidx=? AND s_useridx=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
	
		return result;
	}

	public List<CommentDTO> getComment(int mcidx) {
		sqlsession = sessionf.openSession(true);
		List<CommentDTO> comList = sqlsession.selectList("Content.selectComment", mcidx);
		sqlsession.close();
		return comList;
	}

	public int setComment(int co_useridx, int co_mcidx, String co_text) {
		sqlsession = sessionf.openSession(true);
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("co_useridx", String.valueOf(co_useridx));
		dataMap.put("co_mcidx", String.valueOf(co_mcidx));
		dataMap.put("co_text", co_text);
		sqlsession.insert("Content.insertComment", dataMap);
		sqlsession.close();
		return Integer.parseInt(String.valueOf(dataMap.get("id")));
	}

	public List<SearchDTO> getSearchList(int start, String tag) {
		sqlsession = sessionf.openSession(true);
		StringBuilder tagSB = new StringBuilder();
		if (tag.equals("")) {
			tagSB.append("%").append("").append("%");
		} else {
			tagSB.append("%#").append(tag).append(",%");
		}
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("start", start);
		dataMap.put("tag", tagSB.toString());
	
		List<SearchDTO> schList = sqlsession.selectList("Content.selectSearch", dataMap);
		
		sqlsession.close();
		return schList;
	}

	public String getCntComment(int mcidx) {
		sqlsession = sessionf.openSession(true);
		String cntComment = sqlsession.selectOne("Content.selectCNTComment", mcidx);
		sqlsession.close();
		return cntComment;
	}
	// 팔로잉 팔로우

	public int editFollowing(int fi_useridx, int fi_followingid) {

		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();

		dataMap.put("fi_useridx", fi_useridx);
		dataMap.put("fi_followingid", fi_followingid);
		int result = getFollowingById(fi_useridx, fi_followingid);

		sqlsession = sessionf.openSession(true);
		if (result == 0) {
			sqlsession.insert("Content.insertFollowing", dataMap);

		} else {
			sqlsession.delete("Content.deleteFollowing", dataMap);

		}

		sqlsession.close();
		return result;
	}

	public int getFollowingById(int useridx, int followingid) {
		sqlsession = sessionf.openSession(true);
		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();
		dataMap.put("useridx", useridx);
		dataMap.put("followingid", followingid);
		int result = Integer.parseInt(sqlsession.selectOne("Content.selectFollowingById", dataMap));
		sqlsession.close();
		return result;
	}

	// 멤버 목록가져오기
	public List<MemberDTO> getMemberList(int start) {
		sqlsession = sessionf.openSession(true);
		List<MemberDTO> memberList = sqlsession.selectList("Content.selectMemberList", start);
		sqlsession.close();
		return memberList;
	}

	public List<MemberDTO> getMemberLists(int start) {

		sqlsession = sessionf.openSession(true);
		List<MemberDTO> memberList = sqlsession.selectList("Content.selectMemberLists", start);
		sqlsession.close();
		return memberList;
	}

	// 태그 게시물 수 가져오기
	public String getCntTag(String tag) {
		sqlsession = sessionf.openSession(true);
		StringBuilder tagSB = new StringBuilder();
		if (tag.equals("")) {
			tagSB.append("%").append("").append("%");
		} else {
			tagSB.append("%#").append(tag).append(",%");
		}
		String cntTag = sqlsession.selectOne("Content.selectCNTTag", tagSB.toString());
		sqlsession.close();
		return cntTag;
	}

	// mc_idx, m_userid as mc_useridx, mc_content, mc_regdate, mc_location,
	// mc_imageurl 가져오기
	public List<Content> getOneContent(int b_idx) {
		sqlsession = sessionf.openSession(true);
		List<Content> conList = sqlsession.selectList("Content.selectOneContent", b_idx);
		
		sqlsession.close();
		return conList;
	}

	// 댓글 삭제
	public void deleteComment(int co_idx) {
		sqlsession = sessionf.openSession(true);
		sqlsession.delete("Content.deleteComment", co_idx);
		sqlsession.close();
	}

	public List<MemberDTO> getSearchMem(String userStr) {
		sqlsession = sessionf.openSession(true);
		List<MemberDTO> memList = sqlsession.selectList("Content.selectSearchMem", userStr);
		sqlsession.close();
		return memList;
	}

	// 마이페이지

	public List<Content> getMyContents(int idx) {
		sqlsession = sessionf.openSession(true);
		List<Content> conList = sqlsession.selectList("Content.selectMypageComment", idx);
		
		sqlsession.close();
		return conList;
	}

	public List<Content> getSaveContent(int b_idx) {
		sqlsession = sessionf.openSession(true);
		List<Content> conList = sqlsession.selectList("Content.selectSaveContent", b_idx);

		sqlsession.close();
		return conList;
	}

	public List<Content> getTageContent(String userid) {
		sqlsession = sessionf.openSession(true);
		List<Content> conList = sqlsession.selectList("Content.selectTageContent", userid);
	
		sqlsession.close();
		return conList;
	}

	public List<MemberDTO> getOtherpage(String userid) {
		sqlsession = sessionf.openSession(true);
		List<MemberDTO> conList = sqlsession.selectList("Content.selectOtherPage", userid);
		
		sqlsession.close();
		return conList;
	}

	// 나의 팔로우 수들
	public int getCntFollow(int mIdx) {
		sqlsession = sessionf.openSession(true);
		int cnt = sqlsession.selectOne("Content.selectCntFollow", mIdx);

		sqlsession.close();
		return cnt;
	}

	// 나를 팔로우하는 팔로워의 수
	public int getCntFollower(int mIdx) {
		sqlsession = sessionf.openSession(true);
		int cnt = sqlsession.selectOne("Content.selectCntFollower", mIdx);

		sqlsession.close();
		return cnt;
	}

	// 메인피드 회전목마
	public List<Content> getContentsForIssue() {
		sqlsession = sessionf.openSession(true);

		List<Content> conList = sqlsession.selectList("Content.selectContentsForIssue");

		sqlsession.close();
		return conList;
	}

	// 유저 인덱스에 따른 게시물 수
	public int getCntContentById(int userIdx) {
		sqlsession = sessionf.openSession(true);
		int cnt = sqlsession.selectOne("Content.selectCntContent", userIdx);
		sqlsession.close();
		return cnt;
	}
	// 회원 탈퇴 
	public void withdrawal(int idx) {
		sqlsession = sessionf.openSession(true);
		sqlsession.selectOne("Content.withdrawal", idx);
		sqlsession.close();
	}
}
