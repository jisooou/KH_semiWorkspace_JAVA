package com.kh.journey.accom.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.journey.accom.service.AccomService;
import com.kh.journey.accom.vo.AccomVo;
import com.kh.journey.host.vo.HostVo;

@WebServlet("/accom/edit")
public class AccomEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		숙소 정보 불러오기
		try {
			String no = req.getParameter("no");
			
			AccomService as = new AccomService();
			AccomVo vo = as.getAccomByNo(no);
			
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/WEB-INF/views/accom/edit.jsp").forward(req, resp);
			
		}catch(Exception e) {
	        System.out.println(e.getMessage());
	        e.printStackTrace();
	        req.setAttribute("errMsg", e.getMessage());
	        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	}

//	숙소 정보 수정하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

//			데이터 꺼내기 			
			String no = req.getParameter("no");
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
			
			
			System.out.println("no: " + no);
	        System.out.println("name: " + name);
	        System.out.println("address: " + address);
	        System.out.println("swimYn: " + swimYn);
	        System.out.println("spaYn: " + spaYn);
	        System.out.println("disabledYn: " + disabledYn);
	        System.out.println("parkingYn: " + parkingYn);
	        System.out.println("elevatorYn: " + elevatorYn);
	        System.out.println("breakfastYn: " + breakfastYn);
	        System.out.println("smokeYn: " + smokeYn);
	        System.out.println("imgUrl: " + imgUrl);


			String changeName = "";
			if (imgUrl != null && imgUrl.getSize() > 0) {
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
			}else {
				changeName = req.getParameter("existingImgUrl");
			}

//	         데이터 뭉치기 
			AccomVo vo = new AccomVo();
			vo.setNo(no);
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


//			서비스 호출
			AccomService as = new AccomService();
			int result = as.edit(vo);
			
//			결과
			if(result != 1) {
				throw new Exception("숙소 정보 수정 실패...");
			}
			resp.sendRedirect("/journey/accom/list");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	}

}
