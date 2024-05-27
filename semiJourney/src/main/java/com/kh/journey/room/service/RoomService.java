package com.kh.journey.room.service;

import com.kh.journey.room.dao.RoomDao;
import com.kh.journey.room.vo.RoomVo;
import static com.kh.journey.db.JDBCTemplate.*;

import java.sql.Connection;

public class RoomService {
    private final RoomDao dao = new RoomDao();

    public int insertRoom(RoomVo vo) throws Exception {
        Connection conn = getConnection();
        int result = dao.insertRoom(conn, vo);
        if (result == 1) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
}
