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
			// Connection Pool 에서 Connection 객체를 하나 가지고 온다.
			conn=new DbcpBean().getConn();
			// 실행할 sql 문 준비하기
			String sql="INSERT INTO board_desc"
					+ " (num,writer,title,content,regdate)"
					+ " VALUES(board_desc_seq.NEXTVAL,?,?,?,SYSDATE)";
			// ? 에 바인딩 할 값이 있으면 바인딩 한다.
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			// sql 문 수행하고 update or insert or delete 된 sql 문 결과
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
			System.out.println("컨텐츠 정보를 추가 했습니다");
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
					+ " SET writer=?, title=?, content=?, "
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getWriter());
			pstmt.setString(2,  dto.getTitle());
			pstmt.setString(3,  dto.getContent());
			pstmt.setInt(4,  dto.getNum());
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
			String sql="SELECT writer,title,content,regdate"
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
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
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
			String sql="SELECT num,writer,title,content,regdate"
					+ " FROM board_desc"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			// query 문 수행하고 결과 얻어오기
			rs=pstmt.executeQuery();
			// 반복문 돌면서 select 된 글정보 읽어오기
			while(rs.next()) {
				BoardDto dto=new BoardDto();
				// 글 하나의 정보를 담는다.
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
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