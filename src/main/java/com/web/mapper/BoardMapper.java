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
	public int countBoard();
	public List<Board> selectBoard(PagingVO vo);
}
