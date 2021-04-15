package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String writeAction(HttpServletRequest req, @RequestParam("file") MultipartFile file,
			@RequestParam("title") String title, @RequestParam("contents") String contents)
			throws IllegalStateException, IOException {
		String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/images" ;
		System.out.println(PATH);
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(PATH + file.getOriginalFilename()));
		}

		s.addBoard(new Board(0, title, contents, file.getOriginalFilename(), 0, PATH , PATH, 0, PATH));
		return "index";
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
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("idx") int idx) {
		s.boardDelete(idx);
		return "test";
	}
	 @GetMapping(value= "saveBoard")	 
		public String saveBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			int total = s.countBoard();			
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
			model.addAttribute("viewAll", s.selectBoard(vo));
			return "saveBoard";
		}
	 @GetMapping(value= "/tempBoard")
		public String tempBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			int total = s.countBoard();
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
			model.addAttribute("viewAll", s.selectBoard(vo));
			return "tempBoard";
		}
	 @RequestMapping(value= "/deleteBoard", method = RequestMethod.GET)
		public String deleteBoard(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			int total = s.countBoard();
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
			model.addAttribute("viewAll", s.selectBoard(vo));
			return "deleteBoard";
		}



	
}
