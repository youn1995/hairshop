package com.yedam.hair_resources.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml 역활과 동일
//@WebServlet(name = "front", urlPatterns = "*.do", initParams = { @WebInitParam(name = "charset", value = "UTF-8") })

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String charset = null; //web.xml에서 파람불러오기위해 하는작업
	HashMap<String, Controller> list = null; //url요청과 controller maping

	@Override
	public void init(ServletConfig config) throws ServletException { //최초 메모리 로딩시점에 한번만 실행됨
		charset = config.getInitParameter("charset");  //web.xml에서 파람 불러오기위해 하는작업 utf-8
		list = new HashMap<String, Controller>();
		list.put("/resourcesList.do", new ResourcesListController()); // 요청이 들어오면 뭘실행해야하는지를 url과 sub controller를 매핑함
		list.put("/categoryList.do", new CategoryListController());
		list.put("/categoryInsert.do", new CategoryInsertController());
		list.put("/categoryMajorInsert.do", new CategoryMajorInsertController());

	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(charset); //web.xml에 있는거 읽어서 인코딩해라는 뜻
		String uri = request.getRequestURI(); //  /frontWeb/memberInsert.do
		String contextPath = request.getContextPath(); //frontWeb subString으로 뒤에것만 가져옴
		String path = uri.substring(contextPath.length()); // /memberInsert.do
		Controller subController = list.get(path); //해당 path를 키값을 가지고 value를 찾고 그걸 실행
		subController.execute(request, response); //실행
	}



	
}
