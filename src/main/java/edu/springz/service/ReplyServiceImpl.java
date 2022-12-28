package edu.springz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.springz.domain.Criteria;
import edu.springz.domain.ReplyVO;
import edu.springz.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	private ReplyMapper replyMapper;
	
	@Override
	public boolean modify(ReplyVO rvo) {
		return replyMapper.updateReply(rvo) == 1 ? true : false;
	}

	@Override
	public boolean remove(int rno) {
		return replyMapper.deleteReply(rno) == 1 ? true : false;
	}

	@Override
	public boolean register(ReplyVO rvo) {
		return replyMapper.insertReply(rvo) == 1 ? true : false;
	}

	@Override
	public ReplyVO view(int rno) {
		return replyMapper.selectReply(rno);
	}

	@Override
	public List<ReplyVO> list(int bno, Criteria cri) {
		return replyMapper.selectReplyAllPaging(bno, cri);
	}}
