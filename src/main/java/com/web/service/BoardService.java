package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.domain.Board;
import com.web.domain.BoardDTO;
import com.web.domain.Reply;
import com.web.mapper.BoardMapper;
import com.web.utils.PagingVO;

@Service
public class BoardService {
	@Autowired private BoardMapper m;
	public boolean addBoard(Board b) {
		return m.addBoard(b);
	}

	public List<Board> getBoard(){
		return m.getBoard();
	}
	public Board getBoardOne(int idx) {
		return m.getBoardOne(idx);
	}
	public boolean addReply(Reply r) {
		return m.addReply(r);
	}
	public List<Reply> getReply(int boardIdx) {
		return m.getReply(boardIdx);
	}
	
	public boolean boardDelete(int idx) {
		return m.boardDelete(idx);
	}
	public int countBoard(String status) {
		return m.countBoard(status);
	}
	public int countBoard() {
		return m.countBoard();
	}
	public List<Board> selectBoard(PagingVO vo) {
		return m.selectBoard(vo);
	}
	public List<Board> getBoardDelete(PagingVO vo) {
		return m.getBoardDelete(vo);
	}
	public List<Board> getBoardTemp(PagingVO vo) {
		return m.getBoardTemp(vo);
	}
	public List<Board> getBoardSave(PagingVO vo) {
		return m.getBoardSave(vo);
	}
	public boolean addBoardTemp(Board b) {
		return m.addBoardTemp(b);
	}
	public List<Board> getTempBoard(){
		return m.getTempBoard();
	}
	public List<Board> getSaveBoard(){
		return m.getSaveBoard();
	}
	public List<Board> getDeleteBoard(){
		return m.getDeleteBoard();
	}
	public int countTemp() {
		return m.countTemp();
	}
	
	public int countSave() {
		return m.countSave();
	}
	
	public int countDelete() {
		return m.countDelete();
	}
	public boolean boardUpdate(Board b) {
		return m.boardUpdate(b);
	}
	public List<Board> searchBoard(PagingVO vo, String keywordInput, String searchType) {
		BoardDTO tt = new BoardDTO(vo, keywordInput, searchType);
	 	System.out.println(vo);
	 	System.out.println(keywordInput);
	 	System.out.println(searchType);
		return m.searchBoard(tt);
	}
}
