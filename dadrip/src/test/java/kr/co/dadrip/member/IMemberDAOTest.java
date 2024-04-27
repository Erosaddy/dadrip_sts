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
//		mDto.setMember_id("narihwa");
//		mDto.setNickname("Lee");
//		mDto.setMember_pw("flower");
//		mDto.setEmail("narihwa@hanmail.net");
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Date date = sdf.parse("1969/11/03");
//		
//		mDto.setBirthday(date);
//		mDto.setSex("2");
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
//	public void testListAllMembers() throws Exception {
//		List<MemberDTO> memberList = mDao.listAllMembers();
//	}

}
