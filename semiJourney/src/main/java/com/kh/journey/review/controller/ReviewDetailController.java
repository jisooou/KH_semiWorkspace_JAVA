package com.kh.journey.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.journey.review.service.ReviewService;
import com.kh.journey.review.vo.ReviewVo;

@WebServlet("/review/detail")
public class ReviewDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String roomNoStr = req.getParameter("roomNo");
			int roomNo = Integer.parseInt(roomNoStr); // 정수로 변환

			ReviewService rs = new ReviewService();
			List<ReviewVo> voList = rs.selectReviewList(roomNo);

			// 결과
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/WEB-INF/views/review/detail.jsp").forward(req, resp);
		} catch (

		Exception e) {
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