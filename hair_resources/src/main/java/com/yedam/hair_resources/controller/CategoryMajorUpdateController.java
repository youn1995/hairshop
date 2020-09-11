package com.yedam.hair_resources.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;

public class CategoryMajorUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo cVo = new CodeVo();
		cVo.setCode_no(request.getParameter("no"));
		cVo.setCode_info(request.getParameter("text"));
		int r = CodeDAO.getInstance().update(cVo);
		response.getWriter().print(r);
		
	}

}
