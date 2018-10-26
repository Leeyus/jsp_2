package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

public class QnaDAO {
	
	//reply
	public int reply(QnaDTO qnaDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setString(3, qnaDTO.getContents());
		st.setInt(4, qnaDTO.getRef());
		st.setInt(5, qnaDTO.getStep());
		st.setInt(6, qnaDTO.getDepth());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
		
	}
	
	//replyUpdate
	public int replyUpdate(QnaDTO parent) throws Exception{
		Connection con= DBConnector.getConnect();
		String sql="update qna set step=step+1 where ref=? and step>? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, parent.getRef());
		st.setInt(2, parent.getStep());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
	
	
	//selectOne
	public QnaDTO selectOne(int num)throws Exception{
		Connection con= DBConnector.getConnect();
		String sql = "select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		QnaDTO qnaDTO = null;
		if(rs.next()) {
			qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt(1));
			qnaDTO.setTitle(rs.getString(2));
			qnaDTO.setWriter(rs.getString(3));
			qnaDTO.setContents(rs.getString(4));
			qnaDTO.setReg_date(rs.getDate(5));
			qnaDTO.setHit(rs.getInt(6));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
	}
	
	
	
	//insert
	public int insert(QnaDTO qnaDTO)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,qna_seq.currval,0,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setString(3, qnaDTO.getContents());
		
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
		
		
	}
	
	
	
	
	
	//selectList
	public List<QnaDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from qna "
				+ "where "+kind+" like ? "
				+ "order by ref desc, step asc) Q) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs  = st.executeQuery();
		List<QnaDTO> ar = new ArrayList<>();
		QnaDTO qnaDTO = null;
		
		while(rs.next()) {
			qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			/*qnaDTO.setContents(rs.getString("contents"));*/
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			/*qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));*/
			qnaDTO.setDepth(rs.getInt("depth"));
			ar.add(qnaDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	//getcount
	public int getCount(String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from qna "
				+ "where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return result;
		
		
		
	}
	

}
