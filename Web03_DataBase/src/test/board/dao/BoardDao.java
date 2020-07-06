package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	// 1. 자신의 참조값을 저장할 수 있는 private 필드
	private static BoardDao dao;
	// 2. 외부에서 객체 생성하지 못하도록
	private BoardDao() {}
	// 3. 참조값을 리턴해주는 메소드
	public static BoardDao getInstance() {
		if(dao==null) { // 최초 호출 시, null 이므로
			dao=new BoardDao(); // 객체를 생성해서 static 필드에 담는다.
		}
		return dao;
	}
	// 글 하나의 정보를 저장하는 메소드
	public boolean insert(BoardDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO board_desc"
					+ " (num, writer, title, content, regdate"
					+ " VALUES(board_desc_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getWriter());
			pstmt.setString(2,  dto.getTitle());
			pstmt.setString(3,  dto.getContent());
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
		if(flag>0) {
			return true; // 작업 성공
		} else {
			return false; // 작업 실패
		}
	}
	// 글 하나의 정보를 수정하는 메소드
	public boolean update(BoardDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE board_desc"
					+ " set writer=?, title=?, content=?, regdate=?"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getWriter());
			pstmt.setString(2,  dto.getTitle());
			pstmt.setString(3,  dto.getContent());
			pstmt.setString(4,  dto.getRegdate());
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
		if(flag>0) {
			return true; // 작업 성공
		} else {
			return false; // 작업 실패
		}
	}
	// 글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM board_desc"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
		if(flag>0) {
			return true; // 작업 성공
		} else {
			return false; // 작업 실패
		}
	}
	// 글 하나의 정보를 리턴하는 메소드
	public BoardDto getData(int num) {
		// 글 하나의 정보를 담을 BoardDto
		BoardDto dto=null;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num, writer, title, content, regdate"
					+ " FROM board_desc"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// query 문 수행하고 결과 얻어오기
			rs=pstmt.executeQuery();
			// 반복문 돌면서 select 된 글정보 읽어오기
			while(rs.next()) {
				// BoardDto 객체 생성해서
				dto=new BoardDto();
				// 글 하나의 정보를 담는다.
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setWriter(rs.getString("title"));
				dto.setWriter(rs.getString("content"));
				dto.setWriter(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
		return dto;
	}
	// 글 전체 목록을 리턴하는 메소드 (글 번호에 대해 내림차순 정렬)
	public List<BoardDto> getList(){
		// 글 전체 목록을 담을 객체 생성
		List<BoardDto> list=new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num, writer, title, content, TO_CHAR(regdate, 'YYYY\"년\"MM\"월\"DD\"일\" AM HH:MI'') AS regdate"
					+ " FROM board_desc"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			// query 문 수행하고 결과 얻어오기
			rs=pstmt.executeQuery();
			// 반복문 돌면서 select 된 글정보 읽어오기
			while(rs.next()) {
				// 글 정보를 list 에 담아 보세요.
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String regdate=rs.getString("regdate");
				// BoardDto 객체를 생성해서 글 하나의 정보를 담는다.
				BoardDto dto=new BoardDto();
				// 글 하나의 정보를 담는다.
				dto.setNum(num);
				dto.setWriter(writer);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setRegdate(regdate);
				// BoardDto 객체를 List 에 누적 시킨다.
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
}