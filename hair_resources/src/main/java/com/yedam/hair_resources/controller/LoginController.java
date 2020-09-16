package com.yedam.hair_resources.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.MemberDAO;
import com.yedam.hair_resources.model.MemberVo;


public class LoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login
				// 1.파라미터 보에 담고
				MemberVo memVo = new MemberVo();
				memVo.setId(request.getParameter("id"));
				memVo.setPw(request.getParameter("pw"));
				
				// 2.서비스 처리(db)
				// 싱글톤사용
				MemberVo resultVo = MemberDAO.getInstance().selectOne(memVo);

				// 3.결과저장
				String page = "";
				if (resultVo == null) { // 아이디없음
					request.setAttribute("errormsg", "noid");
					page = "/common/login.jsp";
				} else {
					if (memVo.getPw().equals(resultVo.getPw())) {
						request.getSession().setAttribute("login", resultVo);
						request.getSession().setAttribute("id", resultVo.getId());
						page = "codeList.do";
					} else { // 패스워드 불일치
						request.setAttribute("errormsg", "nopw");
						page = "/common/login.jsp";
					}
				}
				// 4.뷰페이지이동 포워드 리다이렉트 또는 뷰페이지 출력
				request.getRequestDispatcher(page).forward(request, response);
	}

}
