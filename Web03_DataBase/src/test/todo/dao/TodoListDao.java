package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoListDto;
import test.util.DbcpBean;

public class TodoListDao {
	private static TodoListDao dao;
	private TodoListDao() {}
	//자신의 참조값을 리턴해주는 static 메소드 
	public static TodoListDao getInstance() {
		if(dao==null) {
			dao=new TodoListDao();
		}
		return dao;
	}
	// 인자로 전달되는 번호에 해당하는 할일을 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			// 실행 할 sql 문 준비하기
			String sql="DELETE FROM todolist"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			// ? 에 바인딩 할 값이 있으면 바인딩 한다.
			pstmt.setInt(1, num);
			// sql 문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	// 할일 목록을 저장해주는 메소드
	public boolean insert(TodoListDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO todolist"
					+ " (num, content, regdate)"
					+ " VALUES(todolist_seq.NEXTVAL, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getContent());
			// sql문을 수행하고 변화된 row 의 갯수를 리턴받는다.(1)
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
			if(flag>0) {
				System.out.println("할일 목록을 추가 했습니다"); // 작업 성공이라는 의미에서 true 를 리턴한다.
				return true;
			}else {
				return false; // 작업 실패라는 의미에서 false 를 리턴한다
			}
		}
	}
	// 할일 목록을 리턴해주는 메소드 
	public List<TodoListDto> getList(){
		List<TodoListDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num,content,TO_CHAR(regdate, 'YYYYMMDD AM HH:MI') AS regdate"
					+ " FROM todolist"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TodoListDto dto=new TodoListDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}
}