package com.yedam.hair_resources.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hair_resources.common.ConnectionManager;

public class ResourcesDAO {
	Connection conn;
	PreparedStatement pstmt;
	static ResourcesDAO instance;

	public static ResourcesDAO getInstance() {
		if (instance == null) {
			instance = new ResourcesDAO();
		}
		return instance;
	}

	// 한건조회
	public ResourcesVo selectOne(ResourcesVo resVo) {
		ResourcesVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT RESOURCES_NO, RESOURCES_NAME, RESOURCES_IMAGE, RESOURCES_DIVISION, MIDDLE_GROUP_NO, RESOURCES_info"
					+ " FROM RESOURCES WHERE RESOURCES_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getResources_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVo = new ResourcesVo();
				resultVo.setResources_no(rs.getString(1));
				resultVo.setResources_name(rs.getString(2));
				resultVo.setResources_image(rs.getString(3));
				resultVo.setResources_division(rs.getString(4));
				resultVo.setMiddle_group_no(rs.getString(5));
				resultVo.setResources_info(rs.getString(6));
			} else {
				System.out.println("No data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}

	// 전체조회
	public ArrayList<ResourcesVo> selectAll() {
		ArrayList<ResourcesVo> list = new ArrayList<ResourcesVo>();
		ResourcesVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT RESOURCES_NO, RESOURCES_NAME, RESOURCES_IMAGE, RESOURCES_DIVISION, MIDDLE_GROUP_NO, RESOURCES_info"
					+ " FROM RESOURCES";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new ResourcesVo();
				resultVo.setResources_no(rs.getString(1));
				resultVo.setResources_name(rs.getString(2));
				resultVo.setResources_image(rs.getString(3));
				resultVo.setResources_division(rs.getString(4));
				resultVo.setMiddle_group_no(rs.getString(5));
				resultVo.setResources_info(rs.getString(6));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 인서트
	public int insert(ResourcesVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO RESOURCES(RESOURCES_NO, RESOURCES_NAME, RESOURCES_IMAGE, RESOURCES_DIVISION, MIDDLE_GROUP_NO, RESOURCES_info) "
					+ "VALUES (seq, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getResources_name());
			pstmt.setString(2, resVo.getResources_image());
			pstmt.setString(3, resVo.getResources_division());
			pstmt.setString(4, resVo.getMiddle_group_no());
			pstmt.setString(5, resVo.getResources_info());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 수정
	public int update(ResourcesVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE RESOURCES SET RESOURCES_NAME = ?, RESOURCES_IMAGE = ?, RESOURCES_DIVISION = ?, MIDDLE_GROUP_NO = ?, RESOURCES_info = ?"
					+ "WHERE RESOURCES_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getResources_name());
			pstmt.setString(2, resVo.getResources_image());
			pstmt.setString(3, resVo.getResources_division());
			pstmt.setString(4, resVo.getMiddle_group_no());
			pstmt.setString(5, resVo.getResources_no());
			pstmt.setString(6, resVo.getResources_info());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 딜리트
	public int delete(ResourcesVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM RESOURCES WHERE RESOURCES_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getResources_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
}
