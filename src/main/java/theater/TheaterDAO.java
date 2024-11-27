package theater;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TheaterDAO {
    private Connection conn;           
    private ResultSet rs; 
    
    public TheaterDAO(){ 
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
        String SQL = "SELECT tNo FROM THEATER ORDER BY tNo DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
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
    
    public int write(String tName, String col, String row) {
        String SQL = "INSERT INTO theater VALUES (?,?,?,?)";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, getNext());
            pstmt.setString(2, tName);
            pstmt.setString(3, col);
            pstmt.setString(4, row);

            pstmt.executeUpdate();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    
    public Theater getTheater(String tNo)
    {
            String SQL = "SELECT * FROM theater WHERE tNo = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, Integer.parseInt(tNo));
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Theater theater = new Theater();
                    theater.settNo(rs.getInt(1));
                    theater.settName(rs.getString(2));
                    theater.setCol(rs.getString(3));
                    theater.setRow(rs.getString(4));
                    return theater;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
    
public int delete(String showNo)
{
        String SQL = "select tNo from theater,jsp.show where theater.tNo = jsp.show.tNo and showNo = ?";
        String SQL2 = "delete from theater where tNo = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
            pstmt.setInt(1, Integer.parseInt(showNo));
            rs = pstmt.executeQuery();
            rs.next();
            
            pstmt2.setInt(1,rs.getInt(1));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
