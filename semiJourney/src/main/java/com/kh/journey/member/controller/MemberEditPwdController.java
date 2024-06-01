package com.kh.journey.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.journey.member.service.MemberService;
import com.kh.journey.member.vo.MemberVo;

@WebServlet("/member/edit/password")
public class MemberEditPwdController extends HttpServlet {
	
	private final MemberService service;
	
	// Constructor
	public MemberEditPwdController() {
		this.service = new MemberService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/edit/password.jsp").forward(req, resp);
	} // doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {	
			// 데이터 꺼내기
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
		
			String no = loginMemberVo.getNo();
			String pwd = req.getParameter("pwd");
			String pwd2 = req.getParameter("pwd2");
			
			MemberVo vo = new MemberVo();
			vo.setNo(no);
			vo.setPwd(pwd);
			vo.setPwd2(pwd2);
			
			// 서비스 호출
			int result = service.editPwd(vo);
			
			// 결과
			if(result < 1) {
				session.setAttribute("alertMsg", "회원 정보 수정 실패");
				throw new Exception("회원 정보 수정 실패");
			}
			
			loginMemberVo.setName(pwd);
			req.removeAttribute("loginMemberVo");
			
			session.setAttribute("loginMemberVo", loginMemberVo);
			session.setAttribute("alertMsg", "회원 정보 수정 성공");
			
			resp.sendRedirect("/journey/home");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	} // doPost
} // class