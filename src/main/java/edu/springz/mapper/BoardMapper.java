package edu.springz.mapper;

import java.util.List;

import edu.springz.domain.BoardVO;
import edu.springz.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> selectBoardAllPaging(Criteria cri); //전체 게시물 목록 페이징
	public int totalCount(Criteria cri); //페이징용 전체 게시물 갯수
	public int updateBoard(BoardVO bvo); //게시물 수정
	public int deleteBoard(int bno); //게시물 삭제
	public int insertBoardSelectKey(BoardVO bvo); //사전에 bno 증가 후 insert
	public void insertBoard(BoardVO bvo); //게시물 등록
	public List<BoardVO> selectBoardAll(); //전체 게시물 목록
	public BoardVO selectBoard(int bno); //게시물 하나
	
}
