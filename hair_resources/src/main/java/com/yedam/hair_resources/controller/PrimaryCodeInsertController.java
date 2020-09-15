package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;
import net.sf.json.JSONObject;

public class PrimaryCodeInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String code_name = request.getParameter("code_name");
		String code_info = request.getParameter("code_info");
		
		ArrayList<CodeVo> list = CodeDAO.getInstance().primaryCodeDistinct();
		int fTemp = 0;
		char eTemp = 'A';
		for(CodeVo cVo : list) {
			int fs = Integer.parseInt(cVo.getPrimary_code().substring(0,1));
			char es = cVo.getPrimary_code().substring(1).charAt(0);
			
			if(fs >= fTemp) {
				fTemp = fs;
			}
			
			if((int) es >= 65 && (int) es <= 90){
				if((int) es >= (int) eTemp) {
					eTemp = es;
				}
			}
		}
		
		if((int) eTemp == 90) {
			if(fTemp == 9) {
				System.out.println("더이상못만듬");
			} else {
				fTemp++;
				eTemp = 'A';
			}
		} else {
			eTemp = (char) ((int) eTemp + 1);
		}
		
		String primary_code = String.valueOf(fTemp) + String.valueOf(eTemp);
		String secondary_code = String.valueOf(eTemp).toLowerCase() + "1";
		
		CodeVo cVo = new CodeVo();
		cVo.setPrimary_code(primary_code);
		cVo.setCode_name(code_name);
		cVo.setSecondary_code(secondary_code);
		cVo.setCode_info(code_info);
		int r = CodeDAO.getInstance().insert(cVo);
		
		if(r != 0) {
			cVo = CodeDAO.getInstance().selectByPCSC(cVo);
		}
		
		String result = JSONObject.fromObject(cVo).toString();
		
		response.getWriter().print(result);
		
		
	}

}
