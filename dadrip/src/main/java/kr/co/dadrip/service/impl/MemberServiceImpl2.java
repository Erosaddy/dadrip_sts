//package kr.co.dadrip.service.impl;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import kr.co.dadrip.domain.MemberDTO;
//import kr.co.dadrip.persistence.IMemberDAO;
//import kr.co.dadrip.service.IMemberService;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.log4j.Log4j;
//
//@Service
//@Log4j
//@RequiredArgsConstructor
//public class MemberServiceImpl2 implements IMemberService {
//	
//	private final IMemberDAO mDao;
//	
//	@Override
//	public boolean register(MemberDTO mDto) throws Exception {
//		return mDao.insertMember(mDto) == 1;
//	}
//
//	@Override
//	 /**
//     * @return null이면 로그인 실패
//     * 람다식 사용함.
//     */
//    public MemberDTO login(String member_id, String member_pw) {
//        return mDao.selectMember(member_id)
//                .filter(m -> m.getMember_pw().equals(member_pw))
//                .orElse(null);
//    }
//
//	@Override
//	public MemberDTO memberInfo(String member_id) throws Exception {
//		MemberDTO mDto = mDao.selectMember(member_id);
//		return mDto;
//	}
//
//	@Override
//	public boolean modify(MemberDTO mDto) throws Exception {
//		return mDao.updateMember(mDto) == 1;
//	}
//
//	@Override
//	public boolean delete(String member_id) throws Exception {
//		return mDao.deleteMember(member_id) == 1;
//	}
//
//	@Override
//	public List<MemberDTO> memberList() throws Exception {
//		return mDao.listAllMembers();
//	}
//
//	@Override
//	public int idCheck(String member_id) throws Exception {
//		return mDao.idCheck(member_id);
//	}
//
//	@Override
//	public int emailCheck(String email) throws Exception {
//		return mDao.emailCheck(email);
//	}
//
//	
//
//}
