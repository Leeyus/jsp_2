package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	
	//get count
	public int getCount(String kind, String search) throws Exception  {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from notice "
				+ "where "+kind+" like ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public void noticeUpdate() throws Exception {
		
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
	public static void main(String[] args) throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		
		for(int i =0;i<150;i++) {
			NoticeDTO noticeDTO=new NoticeDTO();
			noticeDTO.setTitle("title"+i);
			noticeDTO.setContents("contents"+i);
			noticeDTO.setWriter("writer"+i);
			noticeDAO.noticeWriteForm(noticeDTO);
			if(i%10==0) {
				Thread.sleep(500);
			}
		}
		System.out.println("Done");
		/*int [] nums = new int[3];
		for(int n : nums) {
			System.out.println(n);//또다른 for문
		}*/
	}
	
	//insert
	public int noticeWriteForm(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setString(3, noticeDTO.getWriter());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
		
	}
		
		public NoticeDTO noticeSelectOne(int num) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql = "select * from notice where num=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			NoticeDTO noticeDTO= null;
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				noticeDTO=new NoticeDTO();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setContents(rs.getString(3));
			noticeDTO.setWriter(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
			}
			DBConnector.disConnect(rs, st, con);
			return noticeDTO;
		}
	
	
	public ArrayList<NoticeDTO> noticeList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select num, title,writer,reg_date, hit from notice "
				+ "where "+kind+" like ? "
				+ "order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		ArrayList<NoticeDTO>noticeDTO = new ArrayList<>();
		NoticeDTO nd =null;
		
		while(rs.next()) {
			nd  =new NoticeDTO();
			nd.setNum(rs.getInt("num"));
			nd.setTitle(rs.getString("title"));
			
			nd.setWriter(rs.getString("writer"));
			nd.setReg_date(rs.getDate("reg_date"));
			nd.setHit(rs.getInt("hit"));
			noticeDTO.add(nd);
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	
	}
	
	

}