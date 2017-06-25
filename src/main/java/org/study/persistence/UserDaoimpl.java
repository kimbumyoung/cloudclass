package org.study.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.UserVO;


@Repository
public class UserDaoimpl implements UserDao{

	@Inject
	private SqlSession session;
	
	private static String namespace="org.study.mapper.userMapper";
	
	@Override
	public UserVO loginCheck(UserVO vo) throws Exception {
		
		return session.selectOne(namespace+".loginCheck", vo);
	}

	@Override
	public String signUpIdCheck(String uid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".signUpIdCheck",uid);
	}

	@Override
	public void signUp(UserVO vo) throws Exception {

		 session.insert(namespace+".signUp",vo);
	}

}
