package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;

public class CodeListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isChoose = request.getParameter("isChoose");
		ArrayList<CodeVo> alist = null;
		if (isChoose == null || isChoose.equals("all")) {
			alist = CodeDAO.getInstance().selectAll();
		} else {
			CodeVo cVo = new CodeVo();
			cVo.setPrimary_code(isChoose);
			alist = CodeDAO.getInstance().selectByPrimaryCode(cVo);
		}
		request.setAttribute("alist", alist);
		
		if(request.getAttribute("plist") == null) {
			ArrayList<CodeVo> plist = CodeDAO.getInstance().primaryCodeDistinct();
			request.setAttribute("plist", plist);			
		}
		
		request.getRequestDispatcher("/common/codeList.jsp").forward(request, response);

	}

}
