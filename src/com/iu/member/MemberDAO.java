package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	//insert
	public int insert(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getKind());
		st.setString(6, memberDTO.getClassMate());
		int result= st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	
	
	//MemberList
	public List<MemberDTO> memberList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, M.* from "
				+ "(select * from member where "+kind+" like ? order by classmate asc) M) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		ArrayList<MemberDTO> ar = new ArrayList<>();
		MemberDTO memberDTO=null;
		while(rs.next()) {
			memberDTO=new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setKind(rs.getString("kind"));
			ar.add(memberDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	//리스트 만들기와 번호
	public int getCount(String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select count(id) from member "
				+ "where "+kind+" like ?";
		PreparedStatement st= con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	//delete

}
