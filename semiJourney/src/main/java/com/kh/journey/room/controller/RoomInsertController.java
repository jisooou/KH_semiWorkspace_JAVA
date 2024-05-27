package com.kh.journey.room.controller;

import com.kh.journey.room.vo.RoomVo;
import com.kh.journey.room.service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/room/insert")
public class RoomInsertController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/room/insert.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 데이터 꺼내기
        String name = req.getParameter("name");
        String grade = req.getParameter("grade");
        String img01 = req.getParameter("img01");

        // NO 값을 UUID로 생성
        String no = UUID.randomUUID().toString();

        // 데이터 뭉치기
        RoomVo vo = new RoomVo(no, name, grade, img01);

        // 서비스 호출
        RoomService service = new RoomService();
        int result = 0;
		try {
			result = service.insertRoom(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // 결과에 따라 화면 선택
        if (result == 1) {
            resp.sendRedirect("/journey/home");
        } else {
            req.setAttribute("errorMsg", "Room insertion failed");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    }
}
