package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.domain.Board;
import com.web.domain.Reply;
import com.web.service.BoardService;
import com.web.utils.PagingVO;

@Controller
public class IndexController {

	@Autowired
	private BoardService s;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		return "board";
	}

	@RequestMapping(value = "/mainBoard", method = RequestMethod.GET)
	public String mainBoard() {

		return "mainBoard";
	}
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {

		return "update";
	}


//	@RequestMapping(value = "/saveBoard", method = RequestMethod.GET)
//	public String saveBoard() {
//
//		return "saveBoard";
//	}

//	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
//	public String deleteBoard() {
//
//		return "deleteBoard";
//	}
//
//	@RequestMapping(value = "/tempBoard", method = RequestMethod.GET)
//	public String tempBoard() {
//
//		return "tempBoard";
//	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "write";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view() {
		return "view";
	}


	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	@ResponseBody
	public List<Board> boardList() {
		return s.getBoard();
	}

	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	@ResponseBody
	public Board boardList(@RequestParam("idx") int idx) {
		return s.getBoardOne(idx);
	}

	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> replyList(@RequestParam("idx") int boardIdx) {
		return s.getReply(boardIdx);
	}

	@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
	public String writeReply(@RequestParam("idx") int idx, @RequestParam("replyIdx") int replyIdx,
			@RequestParam("contents") String contents) {
		s.addReply(new Reply(0, idx, replyIdx, contents));
		return "redirect:view?idx=" + idx;
	}
	
	/*박민지 수정*/
	

	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String writeAction(HttpServletRequest req, @RequestParam("file") MultipartFile file,
			@RequestParam("title") String title, @RequestParam("contents") String contents, @RequestParam("status") String status,
			@RequestParam("writer") String writer)
			throws IllegalStateException, IOException {
		String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/images" ;
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(PATH + file.getOriginalFilename()));
		}		
		Board tt = new Board(0, title, contents, writer, 0, PATH , status, 0, PATH);		
		
		s.addBoard(tt);
		return "index";
	}
	
	
	@RequestMapping(value = "/boardDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("idx") int idx) {
		s.boardDelete(idx);
		return "redirect:deleteBoard";
	}
	
	
	 @GetMapping(value= "/deleteBoard")
		public String deleteBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		 	String deleteStatus = "D";
			int total = s.countBoard(deleteStatus);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", s.getBoardDelete(vo));
			return "deleteBoard";
		}
	 
	 @GetMapping(value= "/tempBoard")
		public String tempBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		 	String tempStatus = "T";
			int total = s.countBoard(tempStatus);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", s.getBoardTemp(vo));			
			return "tempBoard";
		} 
	 @GetMapping(value= "/saveBoard")
		public String saveBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			String saveStatus = "C";
			int total = s.countBoard(saveStatus);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", s.getBoardSave(vo));		
			return "saveBoard";
		}
	 @RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
		@ResponseBody	
		public HashMap<String,List<Board>> dashBoard() {
		  HashMap<String,List<Board>> map = new HashMap<String,List<Board>>();
		 	List<Board> tempBoard = s.getTempBoard();
		 	List<Board> saveBoard = s.getSaveBoard();
		 	List<Board> deleteBoard = s.getDeleteBoard();
		 	map.put("temp", tempBoard);
		 	map.put("save", saveBoard);
		 	map.put("del", deleteBoard);
		 	
			return map;
		}			
	 @RequestMapping(value = "/countDashBoard", method = RequestMethod.GET)
		@ResponseBody	
		public ArrayList<Integer> countDashBoard() {
		 	int tempBoard = s.countTemp();
		 	int saveBoard = s.countSave();
		 	int deleteBoard = s.countDelete();
		 	ArrayList<Integer> num = new ArrayList<Integer>();
		 	num.add(tempBoard);
		 	num.add(saveBoard);
		 	num.add(deleteBoard);
		 	
			return num;
		}
	 
	 @RequestMapping(value = "/updateAction", method = RequestMethod.POST)
		public String updateAction(HttpServletRequest req, @RequestParam("file") MultipartFile file,
				@RequestParam("title") String title, @RequestParam("contents") String contents,@RequestParam("idx") int idx,
				@RequestParam("writer") String writer)
				throws IllegalStateException, IOException {
			String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/images" ;
			
			if (!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(PATH + file.getOriginalFilename()));
			}
			
			s.boardUpdate(new Board(idx, title, contents, writer, 0, PATH , PATH, 0, PATH));
			return "redirect:saveBoard";
		}
	 @RequestMapping(value = "/SearchboardList", method = RequestMethod.GET)
	 @ResponseBody
		public List<Board> boardList(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage
				, @RequestParam(value="keywordInput", required=false) String keywordInput
				, @RequestParam(value="searchType", required=false) String searchType) {
		 	
		 	String check = "C";
		 	int total = s.countBoard(check);
		 	
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
		 	model.addAttribute("viewAll", s.searchBoard(vo, keywordInput, searchType));
		 	System.out.println(vo);
		 	System.out.println(keywordInput);
		 	System.out.println(searchType);
			return s.searchBoard(vo, keywordInput, searchType);
		}
			

	
}
