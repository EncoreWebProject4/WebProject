package com.gollajo.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gollajo.model.BoardsDAOImpl;

public class BoardDeleteController implements Controller {
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		String path = "boardList.do?page=1";
		String msg = "false";
		
		String boardIdx = request.getParameter("board_idx");
		System.out.println(boardIdx);
		try {
			BoardsDAOImpl.getInstance().deleteBoard(boardIdx);
			msg = "true";
		} catch (SQLException e) {
			
		}
		
		request.setAttribute("msg", msg);
		return new ModelAndView(path);
	}

}
