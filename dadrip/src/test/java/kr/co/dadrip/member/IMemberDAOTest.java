package kr.co.dadrip.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
//		mDto.setMember_id("boomer3");
//		mDto.setNickname("Leak");
//		mDto.setMember_pw("flower69");
//		mDto.setEmail("boomer3@hanmail.net");
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
//	@Test
//	public void testLoginMember() throws Exception {
//		MemberDTO mDto = mDao.loginMember("zxz7648", "691103Zxz!");
//		log.info("mDto =============> : " + mDto);
//	}
	
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
