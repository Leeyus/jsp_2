package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	
	public void noticeUpdate()throws Exception {
		Connection con= DBConnector.getConnect();
		String sql = "update notice set ";
		
	}
	
	
	
	public int noticeDeleteProcess(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="delete notice where num=? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	
	
	public int noticeWriteForm(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setString(3, noticeDTO.getWriter());
		st.setInt(4, noticeDTO.getHit());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
		
	}
		
		public NoticeDTO noticeSelectOne(int num) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql = "select * from notice where num=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			ResultSet rs = st.executeQuery();
			NoticeDTO noticeDTO= new NoticeDTO();
			rs.next();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setContents(rs.getString(3));
			noticeDTO.setWriter(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
			DBConnector.disConnect(rs, st, con);
			return noticeDTO;
			
			
		}
	
	
	public ArrayList<NoticeDTO> noticeList() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		ArrayList<NoticeDTO>noticeDTO = new ArrayList<>();
		
		while(rs.next()) {
			NoticeDTO nd  =new NoticeDTO();
			nd.setNum(rs.getInt(1));
			nd.setTitle(rs.getString(2));
			nd.setContents(rs.getString(3));
			nd.setWriter(rs.getString(4));
			nd.setReg_date(rs.getDate(5));
			nd.setHit(rs.getInt(6));
			noticeDTO.add(nd);
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	
	}
	
	

}
