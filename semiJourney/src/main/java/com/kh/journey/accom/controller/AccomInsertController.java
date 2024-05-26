package com.kh.journey.accom.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.journey.accom.service.AccomService;
import com.kh.journey.accom.vo.AccomVo;
import com.kh.journey.host.vo.HostVo;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10, 
		maxRequestSize = 1024 * 1024 * 50, 
		fileSizeThreshold = 1024 * 1024* 10
)
@WebServlet("/accom/insert")
public class AccomInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/accom/insert.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();
			HostVo loginHostVo = (HostVo) session.getAttribute("loginHostVo");

			if (loginHostVo == null) {
				throw new Exception("[호스트] 로그인이 필요합니다.");
			}

//			데이터 꺼내기 
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String swimYn = req.getParameter("swimYn");
			String spaYn = req.getParameter("spaYn");
			String disabledYn = req.getParameter("disabledYn");
			String parkingYn = req.getParameter("parkingYn");
			String elevatorYn = req.getParameter("elevatorYn");
			String breakfastYn = req.getParameter("breakfastYn");
			String smokeYn = req.getParameter("smokeYn");
			Part imgUrl = req.getPart("imgUrl");

			String changeName = "";
			if (imgUrl.getSize() > 0) {
				String originFileName = imgUrl.getSubmittedFileName();
				InputStream is = imgUrl.getInputStream();

				String path = "D:\\dev\\semiWorkspace\\semiJourney\\src\\main\\webapp\\resources\\upload\\";
				String random = UUID.randomUUID().toString();
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				changeName = System.currentTimeMillis() + "_" + random + ext;
				FileOutputStream fos = new FileOutputStream(path + changeName);

				byte[] buf = new byte[1024];
				int size = 0;
				while ((size = is.read(buf)) != -1) {
					fos.write(buf, 0, size);
				}

				is.close();
				fos.close();
			}

//	         데이터 뭉치기 
			AccomVo vo = new AccomVo();
			vo.setHostNo(loginHostVo.getNo());
			vo.setName(name);
			vo.setAddress(address);
			vo.setSwimYn(swimYn);
			vo.setSpaYn(spaYn);
			vo.setDisabledYn(disabledYn);
			vo.setParkingYn(parkingYn);
			vo.setElevatorYn(elevatorYn);
			vo.setBreakfastYn(breakfastYn);
			vo.setSmokeYn(smokeYn);
			vo.setImgUrl(changeName);
			vo.setHostName(loginHostVo.getName());
			vo.setHostPhone(loginHostVo.getPhone());

//	         서비스 호출
			AccomService as = new AccomService();
			int result = as.insert(vo);

//	         결과 처리
			if (result == 1) {
				req.setAttribute("resultMsg", "숙소 정보 등록 성공!!!");
			} else {
				req.setAttribute("resultMsg", "숙소 정보 등록 실패...");
			}
			resp.sendRedirect("/journey/accom/list");

		} catch (Exception e) {
			System.out.println("[ERROR-M0001] : " + e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}

	}

}
