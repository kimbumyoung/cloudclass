package org.study.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.study.domain.BoardVO;
import org.study.persistence.BoardDao;
import org.study.service.BoardService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class mybatisTest {
	
	
	@Inject
	BoardService service;
	
	@Test
	public void test() throws Exception{
		System.out.println(service);
		/*for(BoardVO vo : dao.listAll()){
			System.out.println(vo);
		}*/

	}
	


}
