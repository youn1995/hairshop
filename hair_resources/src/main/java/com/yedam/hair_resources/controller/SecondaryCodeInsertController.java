package com.yedam.hair_resources.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;

import net.sf.json.JSONObject;

public class SecondaryCodeInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String primary_code = request.getParameter("primary_code");
		String code_info = request.getParameter("code_info");
		
		String[] str = new String[2]; 
		str = primary_code.split(", ");
		primary_code = str[0];
		String code_name = str[1];
		
		CodeVo cVo = new CodeVo();
		cVo.setPrimary_code(primary_code);
		cVo.setCode_name(code_name);
		cVo.setCode_info(code_info);
		
		String secCode = CodeDAO.getInstance().selectMaxSecondaryCode(cVo).getSecondary_code();
		int secCod = 0;
		if (secCode == null) {
			secCod = 1;
		} else {
			secCod = Integer.parseInt(secCode) + 1;
		}
		cVo.setSecondary_code(cVo.getPrimary_code().substring(1).toLowerCase() + new Integer(secCod).toString());

		int r = CodeDAO.getInstance().insert(cVo);
		
		if(r != 0) {
			cVo = CodeDAO.getInstance().selectByPCSC(cVo);
		}

		String result = JSONObject.fromObject(cVo).toString();
		
		response.getWriter().print(result);
		
		
	}

}
