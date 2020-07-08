package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	private MemberDao() {}
	//자신의 참조값을 리턴해주는 static 메소드 
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	//회원 한명의 정보를 수정반영하는 메소드
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	// 인자로 전달되는 번호에 해당하는 할일을 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			// 실행 할 sql 문 준비하기
			String sql="DELETE FROM member"
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
	// insert
	public boolean insert(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getName());
			pstmt.setString(2,  dto.getAddr());
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
				System.out.println("member 추가 했습니다"); // 작업 성공이라는 의미에서 true 를 리턴한다.
				return true;
			}else {
				return false; // 작업 실패라는 의미에서 false 를 리턴한다
			}
		}
	}
	//회원 목록을 리턴해주는 메소드 
	public List<MemberDto> getList(){
		List<MemberDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num,name,addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
	//회원 한명의 정보를 리턴해주는 메소드
		public MemberDto getData(int num) {
			//회원 한명의 정보를 담을 MemberDto 
			MemberDto dto=null;
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//DBConnect 객체를 이용해서 Connection 객체의 참조값을 얻어온다.
				conn=new DbcpBean().getConn();
				//실행할 sql 문
				String sql="SELECT name,addr"
						+ " FROM member"
						+ " WHERE num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				//query 문 수행하고 결과 얻어오기
				rs=pstmt.executeQuery();
				//반복문 돌면서 select 된 회원정보  읽어오기
				while(rs.next()) {
					//MemberDto 객체 생성해서 
					dto=new MemberDto();
					//회원 한명의 정보를 담는다. 
					dto.setNum(num);
					dto.setName(rs.getString("name"));
					dto.setAddr(rs.getString("addr"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					//객체를 사용했던 순서 역순으로 닫아준다.
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {}
			}		
			
			return dto;
		}
}