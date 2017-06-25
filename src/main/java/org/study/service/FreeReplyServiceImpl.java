package org.study.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.FreeReplyVO;
import org.study.persistence.FreeBoardDAO;
import org.study.persistence.FreeReplyDAO;

@Service
public class FreeReplyServiceImpl implements FreeReplyService{

	@Inject
	private FreeReplyDAO replyDAO;
	
	@Inject
	private FreeBoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(FreeReplyVO vo) throws Exception{
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(),1);
	}
	
	@Override
	public List<FreeReplyVO> listReply(Integer bno) throws Exception{
		return replyDAO.list(bno);
	}
	
	@Override
	public void modifyReply(FreeReplyVO vo) throws Exception{
		replyDAO.update(vo);
	}
	
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception{
		int bno=replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return replyDAO.count(bno);
	}
	

}
