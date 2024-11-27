package user;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import book.Book;
 
public class UserDAO {
    
    private Connection conn;            // DB에 접근하는 객체
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public UserDAO(){ 
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
    
    public int login(String userID, String userPassword) {
        String SQL = "SELECT userPW FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB 오류
        
    }
    
    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserEmail());
            pstmt.setString(4, user.getUserAge());
            pstmt.setString(5, user.getUserNumber());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public User getUser(String userID)
    {
            String SQL = "SELECT * FROM user WHERE userID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, Integer.parseInt(userID));
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                	User user = new User();
                	user.setUserID(rs.getString(1));
                    user.setUserPassword(rs.getString(2));
                    user.setUserEmail(rs.getString(3));
                    user.setUserAge(rs.getString(3));
                    user.setUserNumber(rs.getString(4));
                    
                    return user;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
}
