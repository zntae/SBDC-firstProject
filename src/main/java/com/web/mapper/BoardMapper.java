package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.domain.Board;
import com.web.domain.Reply;
import com.web.utils.PagingVO;

@Repository("BoardMapper")
public interface BoardMapper {
	public boolean addBoard(Board b);
	public List<Board> getBoard();
	public Board getBoardOne(int idx);
	public boolean addReply(Reply r);
	public List<Reply> getReply(int boardIdx);
	public boolean boardDelete(int idx);
	public int countBoard(String status);
	public List<Board> selectBoard(PagingVO vo);
	public List<Board> getBoardDelete(PagingVO vo);
	public List<Board> getBoardTemp(PagingVO vo);
	public List<Board> getBoardSave(PagingVO vo);
	public boolean addBoardTemp(Board b);
	public boolean boardUpdate(Board b);
	public List<Board> getTempBoard();
	public List<Board> getSaveBoard();
	public List<Board> getDeleteBoard();
	public int countTemp();
	public int countSave();
	public int countDelete();
}

