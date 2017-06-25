package org.study.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.Criteria;
import org.study.domain.SboardVO;
import org.study.domain.SearchCriteria;

@Repository
public class SboardDAOImpl implements SboardDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "org.study.mapper.sboardMapper";
	
	@Override
	public void create(SboardVO vo) throws Exception {
		session.insert(namespace+".create",vo);
	}

	@Override
	public SboardVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read",bno);
	}
	@Override
	public void update(SboardVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete",bno);
	}
	@Override
	public List<SboardVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<SboardVO> listPage(int page) throws Exception {
		if(page <=0){
			page = 1;
		}
		page = (page -1) * 10;
		return session.selectList(namespace + ".listPage",page);
	}

	@Override
	public List<SboardVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria",cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging",cri);
	}

	@Override
	public List<SboardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String ,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace+".updateReplyCnt",paramMap);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace+".updateViewCnt",bno);
	}

	@Override
	public void deleteReply(Integer bno) throws Exception {
		session.delete(namespace+".deleteReply",bno);
		
	}

}
