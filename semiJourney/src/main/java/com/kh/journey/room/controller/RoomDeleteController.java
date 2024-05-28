package com.kh.journey.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.journey.room.service.RoomService;

@WebServlet("/room/delete")
public class RoomDeleteController extends HttpServlet {
	
	private final RoomService service;
	
	// Constructor
	public RoomDeleteController() {
		service = new RoomService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			// service 호출
			int result = service.delete();
			
			if(result < 1) {
				throw new Exception("객실 삭제 실패");
			}
			
			resp.sendRedirect("/journey/home");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	} // doPost
} // class