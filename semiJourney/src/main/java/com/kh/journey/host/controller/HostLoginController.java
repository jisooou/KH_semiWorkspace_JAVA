package com.kh.journey.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.journey.host.service.HostService;
import com.kh.journey.host.vo.HostVo;

@WebServlet("/host/login")
public class HostLoginController extends HttpServlet {
	
	private final HostService service;
	
	// Constructor
	public HostLoginController() {
		this.service = new HostService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/ju/host/login.jsp").forward(req, resp);
	} // doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			// 세션
			HttpSession session = req.getSession();
			
			// 데이터 작업
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			HostVo vo = new HostVo();
			vo.setId(id);
			vo.setPwd(pwd);
			
			// 서비스 호출
			HostVo loginHostVo = service.login(vo);
			
			// 결과
			if(loginHostVo != null) {
				session.setAttribute("alertMsg", "로그인 성공");
				session.setAttribute("loginHostVo", loginHostVo);
			} else {
				session.setAttribute("alertMsg", "로그인 실패");
			}
			
			resp.sendRedirect("/journey/home");
			
		} catch(Exception e) {
			
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	} // doPost
} // class