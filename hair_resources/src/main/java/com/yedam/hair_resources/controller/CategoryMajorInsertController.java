package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hair_resources.model.CodeDAO;
import com.yedam.hair_resources.model.CodeVo;

public class CategoryMajorInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo cVo = new CodeVo();
		try {
			BeanUtils.copyProperties(cVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		cVo.setPrimary_code("0F");
		cVo.setCode_name("자재대분류코드");
		String secCode = CodeDAO.getInstance().selectMaxSecondaryCode(cVo).getSecondary_code();
		int secCod = 0;
		if (secCode == null) {
			secCod = 1;
		} else {
			secCod = Integer.parseInt(secCode.substring(1)) + 1;
		}
		cVo.setSecondary_code("f" + new Integer(secCod).toString());

		CodeDAO.getInstance().insert(cVo);
		response.sendRedirect("/hair_resources/categoryList.do");
	}

}
