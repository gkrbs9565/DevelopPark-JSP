package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		System.out.println(RequestURI);
		System.out.println(contextPath);

		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (command.equals("/BoardList.do")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/boardList.jsp");

			rd.forward(request, response);
		} else if (command.equals("/boardWrite.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/writeForm.jsp");
			requestLoginName(request);

			rd.forward(request, response);

		} else if (command.equals("/BoardWriteAction.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/BoardList.do");
			requestBoardWrite(request);

			rd.forward(request, response);

		} else if (command.equals("/BoardViewAction.do")) {
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/view.jsp");

			rd.forward(request, response);
		} else if (command.equals("/BoardUpdateAction.do")) {
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardList.do");
			rd.forward(request, response);
		}else if (command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardList.do");
			rd.forward(request, response);
		}
	}

	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		int pageNum = 1;
		int limit = LISTCOUNT; // 5 상수

		// 페이지 번호가 있으면
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		boardlist = dao.getBoardList(pageNum);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardlist", boardlist);

		String items = request.getParameter("items");
		String text = request.getParameter("text");

		int total_record = dao.getListcount(items, text);

		boardlist = dao.getBoardList(pageNum, limit, items, text);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);

		int total_page;

		if (total_record % limit == 0) {
			total_page = total_record / limit;
		} else {
			total_page = (total_record / limit) + 1;
		}

		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
	}

	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNmaeById(id);
		request.setAttribute("name", name);
		request.setAttribute("id", id);
	}

	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO dto = new BoardDTO();
		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setHit(0);
		dto.setIp(request.getRemoteAddr());

		dao.insertBoard(dto);
	}

	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
	}

	public void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setUpdateDay(request.getParameter("updateDay"));

		board.setIp(request.getRemoteAddr());
		dao.updateBoard(board);
	}
	
	public void requestBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.DeleteBoardByNum(num);
	}
}