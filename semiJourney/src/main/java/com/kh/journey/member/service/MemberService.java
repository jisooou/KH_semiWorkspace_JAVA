package com.kh.journey.member.service;

import static com.kh.journey.db.JDBCTemplate.close;
import static com.kh.journey.db.JDBCTemplate.commit;
import static com.kh.journey.db.JDBCTemplate.getConnection;
import static com.kh.journey.db.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.journey.member.dao.MemberDao;
import com.kh.journey.member.vo.MemberVo;


public class MemberService {
	
	private MemberDao dao = null;
	
	// Constructor
	public MemberService() {
		dao = new MemberDao();
	}
	
	// 로그 인
	public MemberVo login(MemberVo vo) throws Exception {
		
		// 비즈니스 로직
		
		// DAO 호출
		Connection conn = getConnection();
		MemberVo loginMemberVo = dao.login(conn, vo);
		
		close(conn);
		
		return loginMemberVo;
	} // login

	// 회원 가입
	public int join(MemberVo vo) throws Exception {
		
		// 비지니스 로직
		// 아이디 유효성 검사
		// 비밀번호 일치여부 검사
		if(!vo.getPwd().equals(vo.getPwd2())) {
			throw new Exception("비밀번호가 일치하지 않습니다.");
		}
		
		// DAO 호출
		Connection conn = getConnection();
		int result = dao.join(conn, vo);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	} // join
	
	// 회원 탈퇴
	public int quit(String no) throws Exception {
		
		// 비지니스 로직
		
		// DAO 호출
		Connection conn = getConnection();
		int result = dao.quit(conn, no);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	} // quit
	
	// 회원 정보 수정
	public int edit(MemberVo vo) throws Exception {
		
		// 비즈니스 로직
		if(!vo.getPwd().equals(vo.getPwd2())){
			throw new Exception("비밀번호 일치하지 않음");
		}
		
		// DAO 호출
		Connection conn = getConnection();
		int result = dao.edit(conn, vo);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	} // edit
} // class