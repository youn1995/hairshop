package com.yedam.hair_resources.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hair_resources.common.ConnectionManager;

public class CodeDAO {
	Connection conn;
	PreparedStatement pstmt;
	static CodeDAO instance;

	public static CodeDAO getInstance() {
		if (instance == null) {
			instance = new CodeDAO();
		}
		return instance;
	}

	// 한건조회
	public CodeVo selectOne(CodeVo resVo) {
		CodeVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT code_no, primary_code, code_name, secondary_code, code_info from code where code_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getCode_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVo = new CodeVo();
				resultVo.setCode_no(rs.getString(1));
				resultVo.setPrimary_code(rs.getString(2));
				resultVo.setCode_name(rs.getString(3));
				resultVo.setSecondary_code(rs.getString(4));
				resultVo.setCode_info(rs.getString(5));
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

	// primary_code로 조회
	public ArrayList<CodeVo> selectByPrimaryCode(CodeVo resVo) {
		ArrayList<CodeVo> list = new ArrayList<CodeVo>();
		CodeVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT code_no, primary_code, code_name, secondary_code, code_info from code where primary_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resVo.getPrimary_code());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new CodeVo();
				resultVo.setCode_no(rs.getString(1));
				resultVo.setPrimary_code(rs.getString(2));
				resultVo.setCode_name(rs.getString(3));
				resultVo.setSecondary_code(rs.getString(4));
				resultVo.setCode_info(rs.getString(5));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 전체조회
	public ArrayList<CodeVo> selectAll() {
		ArrayList<CodeVo> list = new ArrayList<CodeVo>();
		CodeVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT code_no, primary_code, code_name, secondary_code, code_info from code";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new CodeVo();
				resultVo.setCode_no(rs.getString(1));
				resultVo.setPrimary_code(rs.getString(2));
				resultVo.setCode_name(rs.getString(3));
				resultVo.setSecondary_code(rs.getString(4));
				resultVo.setCode_info(rs.getString(5));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
