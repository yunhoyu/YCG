package book;

import java.sql.*;
import java.util.*;

public class BookDAO {
	private Connection conn;           
    private ResultSet rs; 
    
    public BookDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/JSP";
            String dbID = "root";
            String dbPassword = "rootpw";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public int getNext()
    {
        String SQL = "SELECT bNo FROM BOOK ORDER BY bNo DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
        try {     
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) + 1; // 그 다음
            }
            return 1; // 첫 번째인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    
    public String getDate() // 현재시간을 넣어주기위해
    {
        String SQL = "SELECT NOW()"; // 현재시간을 나타내는 mysql
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""; // 데이터베이스 오류
    }
    
    public int write(String userID) {
        String SQL = "INSERT INTO BOOK VALUES (?,?,?,?,?)";
        String SQL2 = "SELECT showNo FROM jsp.SHOW ORDER BY showNo DESC";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
            rs = pstmt2.executeQuery();
            rs.next();
            int a = rs.getInt(1);
            
            pstmt.setInt(1, getNext());
            pstmt.setInt(2, a);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setInt(5, 14500);
            
            pstmt.executeUpdate();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    
    public Book getBook(String bNo)
    {
            String SQL = "SELECT * FROM book WHERE bNo = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, Integer.parseInt(bNo));
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                	Book book = new Book();
                	book.setbNo(rs.getInt(1));
                    book.setShowNo(rs.getInt(2));
                    book.setUserID(rs.getString(3));
                    book.setbDate(rs.getString(4));
                    book.setBcash(rs.getString(5));
                    return book;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
    public ArrayList<Book> getList()
    	{
        String SQL = "SELECT * FROM BOOK ORDER BY bNo DESC LIMIT 10"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다

        ArrayList<Book> list = new ArrayList<Book>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setbNo(rs.getInt(1));
                book.setShowNo(rs.getInt(2));
                book.setUserID(rs.getString(3));
                book.setbDate(rs.getString(4));
                book.setBcash(rs.getString(5));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
    public int delete(String bNo)
    	{
        String SQL = "delete from book where bNo = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(bNo));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    	}
}
