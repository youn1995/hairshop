package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;
import com.yedam.hair_resources.model.ResourcesMiddleGroupDAO;
import com.yedam.hair_resources.model.ResourcesMiddleGroupVo;

public class CategoryListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo codeVo = new CodeVo();
		codeVo.setPrimary_code("0F");
		ArrayList<CodeVo> clist = CodeDAO.getInstance().selectByPrimaryCode(codeVo);
		request.setAttribute("clist", clist);
		
		ArrayList<CodeVo> codeList = CodeDAO.getInstance().selectAll();
		request.setAttribute("codelist", codeList);
		
		ArrayList<ResourcesMiddleGroupVo> list = ResourcesMiddleGroupDAO.getInstance().selectAll();
		request.setAttribute("mglist", list);
		request.getRequestDispatcher("/resources/categoryList.jsp").forward(request, response);
	}

}
