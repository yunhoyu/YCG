package show;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShowDAO {
	private Connection conn;           
    private ResultSet rs; 
    
    public ShowDAO(){ 
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
        String SQL = "SELECT showNo FROM jsp.SHOW ORDER BY showNo DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
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
    
    public int write(String mNo, String showDate) {
        String SQL = "INSERT INTO jsp.SHOW VALUES (?,?,?,?)";
        String SQL2 = "SELECT tNo FROM THEATER ORDER BY tNo DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
            rs = pstmt2.executeQuery();
            rs.next();
            int a = rs.getInt(1);
            
            pstmt.setInt(1, getNext());
            pstmt.setInt(2, Integer.parseInt(mNo));
            pstmt.setInt(3, a);
            pstmt.setString(4, showDate);

            pstmt.executeUpdate();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    
    public Show getShow(String showNo)
    {
            String SQL = "SELECT * FROM jsp.show WHERE tNo = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, Integer.parseInt(showNo));
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Show show = new Show();
                    show.setShowNo(rs.getInt(1));
                    show.setmNo(rs.getInt(2));
                    show.setShowNo(rs.getInt(3));
                    show.setShowDate(rs.getString(4));
                    return show;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
    
public int delete(String showNo)
{
        String SQL = "delete from jsp.show where showNo = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(showNo));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
