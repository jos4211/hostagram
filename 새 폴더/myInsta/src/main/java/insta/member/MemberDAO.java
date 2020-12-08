package insta.member;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import insta.db.DBConn;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Statement stmt;
	MemberDTO member;

	public int join(MemberDTO member) {
		int result = 0;
		String sql = "INSERT INTO tb_member(m_userid,m_password,m_username,m_email) VALUES (?,PASSWORD(?),?,?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println(member.getM_userid());
			pstmt.setString(1, member.getM_userid());
			pstmt.setString(2, member.getM_password());
			pstmt.setString(3, member.getM_username());
			pstmt.setString(4, member.getM_email());
			if (pstmt.executeUpdate() != 0) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println(e + "=> memberInsert fail");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 0;

	}

	public int idCheck(String id, String email) {
		String sql = "SELECT m_idx FROM tb_member WHERE m_userid=?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}

			sql = "SELECT m_idx FROM tb_member WHERE m_email=?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}

	public MemberDTO login(MemberDTO member) {
		String sql = "SELECT m_idx , m_userid, m_username, m_filepath,m_intro FROM tb_member WHERE (m_userid=? OR m_email=?) "
				+ "AND m_password=PASSWORD(?)";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_userid());
			pstmt.setString(2, member.getM_userid());
			pstmt.setString(3, member.getM_password());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setM_idx(Integer.parseInt(rs.getString("m_idx")));
				member.setM_userid(rs.getString("m_userid"));
				member.setM_username(rs.getString("m_username"));
				member.setM_filepath(rs.getString("m_filepath"));				
				member.setM_intro(rs.getString("m_intro"));
				
				
				
				
				
		
				
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return null;
	}

	public int emailCheck(String m_email) {
		String sql = "SELECT m_email FROM tb_member WHERE m_email=? ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}

	public int idCheck(String m_userid) {
		String sql = "SELECT m_userid FROM tb_member WHERE m_userid=? ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}

	public String findPw(String id) {
		String sql = "SELECT m_email FROM tb_member WHERE (m_userid=? OR m_email=?) ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String email = rs.getString("m_email");
				return email;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return null;
	}

	public int changePw(String email, String password) {
		String sql = "UPDATE  tb_member SET m_password=PASSWORD(?) WHERE m_email=? ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}

	public ArrayList<MemberDTO> getMemberlist() {
		ArrayList<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		String sql = "select m_userid,m_username,m_filepath from tb_member";
		try {// 실행
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO memberDTO = new MemberDTO();

				memberDTO.setM_userid(rs.getString("m_userid"));
				memberDTO.setM_username(rs.getString("m_username"));
				memberDTO.setM_filepath(rs.getString("m_filepath"));

				memberlist.add(memberDTO);
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return memberlist;
	}// getMemberlist

	public ArrayList<MemberDTO> getMemberlist(String keyWord) {

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		try {// 실행

			String sql = "select * from tb_member";

			if (keyWord != null && !keyWord.equals("")) {
				sql += "where m_userid = '%" + keyWord.trim() + "%'";
			} else {// 모든 레코드 검색
				sql += "order by id";
			}
			System.out.println("sql = " + sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				;

				memberDTO.setM_userid(rs.getString(1));
				memberDTO.setM_username(rs.getString(2));

				list.add(memberDTO);
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return list;
	}

	public String profile(int idx, String userid) {
		String sql = "SELECT m_filepath FROM tb_member WHERE m_userid=? OR m_idx=?";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String profile = rs.getString("m_filepath");
				return profile;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return null;
	}
	
	
	
	

	public int passwordCheck(MemberDTO member) {
		String sql = "SELECT m_password FROM tb_member WHERE m_userid=?";
		System.out.println(sql);
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getM_userid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}
		
	public int changePw2(MemberDTO member) {
		int cnt=0;
		String sql = "UPDATE tb_member SET m_password=PASSWORD(?) WHERE m_userid=?";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_password());
			pstmt.setString(2, member.getM_userid());
			 cnt=pstmt.executeUpdate();			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		System.out.print(cnt);
		return cnt;
	}
	public int profiledit(MemberDTO member) {
		
		int cnt=0;
		String sql = "UPDATE tb_member SET m_username=?,m_intro=? where m_userid=?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_username());
			pstmt.setString(2, member.getM_intro());
			pstmt.setString(3, member.getM_userid());											
			 cnt=pstmt.executeUpdate();			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		System.out.print(cnt);
		return cnt;			
	}
	

	public String infoprofile(String id) {
		String sql = "SELECT m_filepath FROM tb_member WHERE m_userid=?";
		String profile= "";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				profile = rs.getString("m_filepath");
						
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return profile;
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	
public int modifypassword(String id,String m_password,String m_passwordre) {
	
	conn = DBConn.getConnection();
	String sql="update tb_member set m_password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_password);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	
	
	
}
*/	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


