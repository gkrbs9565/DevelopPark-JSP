package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.dbconn;

public class BoardDAO {
	private static BoardDAO instance;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public int getListcount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;

		if (items == null && text == null)
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where" + items + "like '%" + text + "%'";

		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getListCount() 에러:" + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	// 테이블의 목록을 가져오는 함수 생성
	public ArrayList<BoardDTO> getBoardList(int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from board order by board_seq DESC";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegistDay(rs.getString("registDay"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setUpdateDay(rs.getString("updateDay"));

				list.add(board);
			}

		} catch (Exception e) {
			System.out.println("getBoardList() 에러 : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total_record = getListcount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;
		String sql = "";

		if (items == null && text == null) {
			sql = "select * from board order by board_seq desc";
		} else {
			sql = "select * from board where " + items + " like '%" + text + "%' order by board_seq desc";
		}
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegistDay(rs.getString("registDay"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setUpdateDay(rs.getString("updateDay"));

				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				// board
				else
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public String getLoginNmaeById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String name = ""; // 선택된 총 게시글의 갯수
		String sql = "select name from member where id = '" + id + "'";
		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				name = rs.getString(1);
		} catch (Exception e) {
			System.out.println("매개 변수 id를 가진 getLoginNameById(id) 에러(sql문) :" + e);
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("매개 변수 id를 가진 getLoginNameById(id) 에러(close문) :" + e);
			}
		}
		return name;
	}

	public void insertBoard(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into board(board_seq, id, name, subject, content, registDay, hit, ip, updateDay) values(board_seq.nextval, ?, ?, ?, ?,default,?,?, sysdate)";

		try {
			conn = dbconn.getConnection();

			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getSubject());
			System.out.println(dto.getContent());
			System.out.println(dto.getIp());

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, 0);
			pstmt.setString(6, dto.getIp());
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insert board 오류! : " + e);
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public BoardDTO getBoardByNum(int num, int pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;

		String sql = "select * from board where board_seq=?";

		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setRegistDay(rs.getString("registDay"));
				board.setUpdateDay(rs.getString("updateDay"));
			}

			sql = "update board set hit = hit + 1 where board_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
			System.out.println("pstmt.getBoardByNum() 실행");
		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			System.out.println("getBoardByNum() 에러 : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return board;
	}

	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "update board set subject=?, content=?, ip=?, updateDay=sysdate where board_seq=?";

			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getIp());
			pstmt.setInt(4, board.getNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateBoard() 에러" + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	public void DeleteBoardByNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";

		sql = "delete from board where board_seq = ?";

		try {
			conn = dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}