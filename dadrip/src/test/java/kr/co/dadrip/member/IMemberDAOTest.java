package kr.co.dadrip.member;

import java.util.ArrayList;
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
//		mDto.setMember_id("boom3");
//		mDto.setNickname("jojo");
//		mDto.setMember_pw("3456qwer");
//		mDto.setEmail("party@gmail.com");
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Date date = sdf.parse("2000/03/03");
//		
//		mDto.setBirthday(date);
//		mDto.setGender("M");
//		
//		mDao.insertMember(mDto);
//	}
//	
//	@Test
//	public void testLoginMember() throws Exception {
//		MemberDTO mDto = mDao.loginMember("zxz7648", "691103abc!");
//		log.info("mDto =============> : " + mDto);
//	}
	
	@Test
	public void testListAllMembers() throws Exception {
		List<MemberDTO> memberList = mDao.listAllMembers();
	}

}
