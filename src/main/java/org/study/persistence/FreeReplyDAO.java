package org.study.persistence;

import java.util.List;

import org.study.domain.FreeReplyVO;


public interface FreeReplyDAO {

	public List<FreeReplyVO> list(Integer bno) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public void create(FreeReplyVO vo) throws Exception;
	
	public void update(FreeReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;

	public int getBno(Integer rno) throws Exception;
}