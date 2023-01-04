package edu.springz.mapper;


import java.util.List;

import edu.springz.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public int deleteAttach(String uuid); //첨부파일 삭제
	public int insertAttach(BoardAttachVO rvo); //첨부파일 등록

	public List<BoardAttachVO> selectAttachAll(int bno); //게시물 하나에 대한 첨부파일 목록
	
}
