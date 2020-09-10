package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hair_resources.model.ResourcesMiddleGroupDAO;
import com.yedam.hair_resources.model.ResourcesMiddleGroupVo;

public class CategoryInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourcesMiddleGroupVo middleVo = new ResourcesMiddleGroupVo();
		try {
			BeanUtils.copyProperties(middleVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		int r =0;
		r = ResourcesMiddleGroupDAO.getInstance().insert(middleVo);
		
		if(r == 0) {
			request.setAttribute("resultInsert", "등록실패");
		} else {
			request.setAttribute("resultInsert", "등록완료");
		}
		
		response.sendRedirect("/hair_resources/categoryList.do");
	}

}
