package com.yedam.hair_resources.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.ResourcesMiddleGroupDAO;
import com.yedam.hair_resources.model.ResourcesMiddleGroupVo;

public class CategoryDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourcesMiddleGroupVo mVo = new ResourcesMiddleGroupVo();
		mVo.setMiddle_group_no(request.getParameter("no"));
		int r = ResourcesMiddleGroupDAO.getInstance().delete(mVo);
		response.getWriter().print(r);

	}
}
