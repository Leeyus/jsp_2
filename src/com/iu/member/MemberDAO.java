package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	
	//Delete
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
	
	
	
	//Update
	public int update(MemberDTO memberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update member set pw=?, name=?, email=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getEmail());
		st.setString(4, memberDTO.getId());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
		
	}
	
	
	
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
	
	
	//selectOne
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		MemberDTO mDTO = null;
		if(rs.next()) {
			mDTO=new MemberDTO();
			mDTO.setId(rs.getString("id"));
			mDTO.setName(rs.getString("name"));
			mDTO.setEmail(rs.getString("email"));
			mDTO.setKind(rs.getString("kind"));
			mDTO.setClassMate(rs.getString("classmate"));
		}
		DBConnector.disConnect(rs, st, con);
		return mDTO;
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
	
	

}
