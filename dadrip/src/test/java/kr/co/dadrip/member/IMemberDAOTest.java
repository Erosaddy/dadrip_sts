package kr.co.dadrip.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.persistence.IMemberDAO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class IMemberDAOTest {

	@Autowired
	private IMemberDAO mDao;
	
//	@Test
//	public void testInsertMember() throws Exception {
//		MemberDTO mDto = new MemberDTO();
//		mDto.setMember_id("zxz7648");
//		mDto.setNickname("Eros");
//		mDto.setMember_pw("691103Zxz!");
//		mDto.setEmail("zxz7648@naver.com");
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Date date = sdf.parse("1989/12/03");
//		
//		mDto.setBirthday(date);
//		mDto.setSex("1");
//		
//		mDao.insertMember(mDto);
//	}
//	
	@Test
	public void testLoginMember() throws Exception {
		
		MemberDTO mDto = new MemberDTO();
		mDto.setMember_id("zxz7648");
		mDto.setMember_pw("691103Zxz!");
		
		mDao.loginMember(mDto);
		log.info("mDto =============> : " + mDto);
	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		MemberDTO mDto = new MemberDTO();
//		mDto.setMember_id("narihwa113");
//		mDto.setNickname("Hwa");
//		mDto.setMember_pw("67flower");
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Date date = sdf.parse("1999/01/01");
//		
//		mDto.setBirthday(date);
//		mDto.setSex("2");
//		
//		int result = mDao.updateMember(mDto);
//		
//		log.info("result ==================> " + result);
//	}
	
//	@Test
//	public void testDelete() throws Exception {
//		int result = mDao.deleteMember("boomer3");
//		
//		log.info("result ===============> " + result);
//	}
	
//	@Test
//	public void testListAllMembers() throws Exception {
//		List<MemberDTO> memberList = mDao.listAllMembers();
//	}

}
