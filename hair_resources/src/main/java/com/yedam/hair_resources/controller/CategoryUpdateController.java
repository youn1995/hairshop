package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hair_resources.model.ResourcesMiddleGroupDAO;
import com.yedam.hair_resources.model.ResourcesMiddleGroupVo;

public class CategoryUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourcesMiddleGroupVo rVo = new ResourcesMiddleGroupVo();
		
		try {
			BeanUtils.copyProperties(rVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		System.out.println(rVo.getMiddle_group_no()+" : "+rVo.getSecondary_code()+" : "+rVo.getMiddle_group_info());
		
		int r = ResourcesMiddleGroupDAO.getInstance().update(rVo);
		response.sendRedirect("/hair_resources/categoryList.do");

	}

}
