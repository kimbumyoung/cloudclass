package org.study.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.study.domain.UserVO;
import org.study.persistence.UserDao;

@Service
public class UserServiceimpl implements UserService {

	@Inject
	UserDao dao;

	@Override
	public UserVO loginCheck(UserVO vo) throws Exception {
		
		System.out.println("service:"+ vo);
		return dao.loginCheck(vo);
	
	}

	@Override
	public String signUpIdCheck(String uid) throws Exception {

		return dao.signUpIdCheck(uid);
	}

	@Override
	public void signUp(UserVO vo) throws Exception {
		dao.signUp(vo);
	}
	

}
