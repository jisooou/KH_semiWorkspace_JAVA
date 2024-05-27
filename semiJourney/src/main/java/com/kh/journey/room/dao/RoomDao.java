package com.kh.journey.room.dao;

import com.kh.journey.room.vo.RoomVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static com.kh.journey.db.JDBCTemplate.*;

public class RoomDao {
    public int insertRoom(Connection conn, RoomVo vo) {
        String sql = "INSERT INTO ROOM (NO, NAME, GRADE, IMG_01) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getNo());
            pstmt.setString(2, vo.getName());
            pstmt.setString(3, vo.getGrade());
            pstmt.setString(4, vo.getImg01());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
}
