package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";

	private static GuestbookDAO instance;
	
	public static GuestbookDAO getInstance() {
		if(instance==null) {
			synchronized(GuestbookDAO.class){
				instance = new GuestbookDAO();
			}
		}
		return instance;
	}//싱글톤
	
	
	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}// drive loading
	
	// Connection
		public void getConnection() {
			try {
				conn = DriverManager.getConnection(url, username, password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// Connection
	
		
	public void write(GuestbookDTO guestbookDTO) {
		
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);//생성
			
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			
			pstmt.executeUpdate();//실행
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(pstmt !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	}//write(GuestbookDTO guestbookDTO) 
	
	
	public List<GuestbookDTO> printAll(){
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		
		String sql = "select * from guestbook";
		
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getString("logtime"));

				list.add(guestbookDTO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
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
	
	
	
	
	
}
