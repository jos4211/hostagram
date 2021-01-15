package insta.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import insta.db.DBConn;


public class BoardDAO {
	
	public List<BoardDTO> selectBoard(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT mc_idx, mc_useridx, mc_content, mc_regdate, mc_filepath, mc_imageurl, "
					+ "mc_taggedid,mc_taggedname FROM tb_myContent order by mc_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setMcIdx(rs.getInt("mc_idx"));
				board.setMcUseridx(rs.getInt("mc_useridx"));
				board.setMcContent(rs.getString("mc_content"));
				board.setMcRegdate(rs.getString("mc_regdate"));
				board.setMcFilepath(rs.getString("mc_filepath"));
				board.setMcImageurl(rs.getString("mc_imageurl"));
				board.setMcTaggedid(rs.getString("mc_taggedid"));
				board.setMcTaggedname(rs.getString("mc_taggedname"));
				boardList.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	public BoardDTO insertBoard(BoardDTO boardDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		String[] generatedColumns = {"mem_idx"};
		try {

			conn = DBConn.getConnection();
			String sql = "INSERT INTO tb_myContent(mc_useridx, mc_content,  mc_imageurl, mc_taggedid, mc_taggedname) "
					+ " values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql, generatedColumns);
			pstmt.setInt(1, boardDTO.getMcUseridx());
			pstmt.setString(2, boardDTO.getMcContent());
		//	pstmt.setString(3, boardDTO.getMcRegdate());
			pstmt.setString(3, boardDTO.getMcImageurl());
			pstmt.setString(4, boardDTO.getMcTaggedid());
			pstmt.setString(5, boardDTO.getMcTaggedname());
			rows = pstmt.executeUpdate();
		
			try (ResultSet geneResultKey = pstmt.getGeneratedKeys()){
				if(geneResultKey.next()) {
					boardDTO.setMcIdx(geneResultKey.getInt("bIdx"));
				}
			}
			if(rows >= 1) {
				System.out.println("INSERT 성공!");
				boardDTO = this.updateFilePath(boardDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return boardDTO;
	}
	
	public BoardDTO selectView(BoardDTO boardDTO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = new BoardDTO();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT mc_idx, mc_useridx, mc_content, mc_regdate, mc_imageurl, mc_taggedid, mc_taggedname FROM tb_myContent WHERE mc_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, board.getMcIdx());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setMcIdx(rs.getInt("mc_idx"));
				board.setMcUseridx(rs.getInt("mc_useridx"));
				board.setMcContent(rs.getString("mc_content"));
				board.setMcRegdate(rs.getString("mc_regdate"));
				board.setMcImageurl(rs.getString("mc_imageurl"));
				board.setMcTaggedid(rs.getString("mc_taggedid"));				
				board.setMcTaggedname(rs.getString("mc_taggedname"));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return board;
	}
	
	public BoardDTO updateFilePath(BoardDTO boardDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			String sql = "UPDATE tb_myContent SET mc_imageurl=? WHERE mc_idx=?";
			pstmt = conn.prepareStatement(sql);
			String tmp = "/" + FileService.getToday() + "/" + boardDTO.getMcIdx() + ".dev";
			boardDTO.setMcFilepath(tmp);
			pstmt.setString(1, tmp);
			pstmt.setInt(2, boardDTO.getMcIdx());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return boardDTO;
	}
	
	// 게시물 삭제		
			public void deleteBoard(int b_idx) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				try {
					conn = DBConn.getConnection();
					String sql = " DELETE FROM tb_mycontent WHERE mc_idx = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, b_idx);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					DBConn.close(conn, pstmt);
				}
			}
}
