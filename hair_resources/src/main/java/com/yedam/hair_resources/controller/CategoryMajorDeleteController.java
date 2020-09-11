package com.yedam.hair_resources.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;
import com.yedam.hair_resources.model.ResourcesMiddleGroupDAO;
import com.yedam.hair_resources.model.ResourcesMiddleGroupVo;

public class CategoryMajorDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo cVo = new CodeVo();
		cVo.setCode_no(request.getParameter("no"));
		int r = CodeDAO.getInstance().delete(cVo);
		response.getWriter().print(r);
	}

}
