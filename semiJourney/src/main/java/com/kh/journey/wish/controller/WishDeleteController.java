package com.kh.journey.wish.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.journey.wish.service.WishService;
import com.kh.journey.wish.vo.WishVo;

@WebServlet("/wish/delete")
public class WishDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			
			//데이터 꺼내기
			String no = req.getParameter("no");
//			loginMemberVo 확인하기 
			String memberNo = ((MemberVo)session.getAttribute("loginMemberVo")).getNo();
			
			WishVo wishVo = new WishVo();
		 	wishVo.setNo(no);
            wishVo.setMemNo(memberNo);
			
			//서비스 호출 
			WishService ws = new WishService();
			int result = ws.delete(wishVo);
			
			if(result != 1) {
				throw new Exception("위시리스트 삭제 실패했습니다.");
			}
			
			//결과 
			session.setAttribute("alertMsg", "위시리스트 삭제 성공했습니다.");
			resp.sendRedirect("/journey/wish/list");
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
		
	}

}
