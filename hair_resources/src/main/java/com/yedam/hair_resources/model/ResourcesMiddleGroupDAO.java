package com.yedam.hair_resources.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hair_resources.common.ConnectionManager;

public class ResourcesMiddleGroupDAO {
	Connection conn;
	PreparedStatement pstmt;
	static ResourcesMiddleGroupDAO instance;

	public static ResourcesMiddleGroupDAO getInstance() {
		if (instance == null) {
			instance = new ResourcesMiddleGroupDAO();
		}
		return instance;
	}

	// 한건조회
	public ResourcesMiddleGroupVo selectOne(ResourcesMiddleGroupVo resVo) {
		ResourcesMiddleGroupVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MIDDLE_GROUP_NO, MIDDLE_GROUP_CATEGORY, MIDDLE_GROUP_INFO, MAJOR_GROUP_NO FROM RESOURCES_MIDDLE_GROUP WHERE MIDDLE_GROUP_NO = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getMiddle_group_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVo = new ResourcesMiddleGroupVo();
				resultVo.setMiddle_group_no(rs.getString(1));
				resultVo.setMiddle_group_category(rs.getString(2));
				resultVo.setMiddle_group_info(rs.getString(3));
				resultVo.setMajor_group_no(rs.getString(4));
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
	public ArrayList<ResourcesMiddleGroupVo> selectAll() {
		ArrayList<ResourcesMiddleGroupVo> list = new ArrayList<ResourcesMiddleGroupVo>();
		ResourcesMiddleGroupVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MIDDLE_GROUP_NO, MIDDLE_GROUP_CATEGORY, MIDDLE_GROUP_INFO, MAJOR_GROUP_NO FROM RESOURCES_MIDDLE_GROUP";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new ResourcesMiddleGroupVo();
				resultVo.setMiddle_group_no(rs.getString(1));
				resultVo.setMiddle_group_category(rs.getString(2));
				resultVo.setMiddle_group_info(rs.getString(3));
				resultVo.setMajor_group_no(rs.getString(4));
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
	public int insert(ResourcesMiddleGroupVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO RESOURCES_MIDDLE_GROUP(MIDDLE_GROUP_NO, MIDDLE_GROUP_CATEGORY, MIDDLE_GROUP_INFO, MAJOR_GROUP_NO) "
					+ "VALUES (seq, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getMiddle_group_category());
			pstmt.setString(2, resVo.getMiddle_group_info());
			pstmt.setString(3, resVo.getMajor_group_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 수정
	public int update(ResourcesMiddleGroupVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE RESOURCES_MIDDLE_GROUP SET MIDDLE_GROUP_CATEGORY = ?, MIDDLE_GROUP_INFO = ?, MAJOR_GROUP_NO = ? "
					+ "WHERE RESOURCES_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getMiddle_group_category());
			pstmt.setString(2, resVo.getMiddle_group_info());
			pstmt.setString(3, resVo.getMajor_group_no());
			pstmt.setString(4, resVo.getMiddle_group_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 딜리트
	public int delete(ResourcesMiddleGroupVo resVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM RESOURCES_MIDDLE_GROUP WHERE RESOURCES_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getMiddle_group_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
}
