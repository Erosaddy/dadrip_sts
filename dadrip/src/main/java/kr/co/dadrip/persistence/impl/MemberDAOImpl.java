package kr.co.dadrip.persistence.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.persistence.IMemberDAO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Repository
@Log4j
@RequiredArgsConstructor
public class MemberDAOImpl implements IMemberDAO {

	private final SqlSession sqlSession;

	private static final String NAMESPACE = "kr.co.dadrip.memberMapper";

	@Override
	public int insertMember(MemberDTO mDto) {
		return sqlSession.insert(NAMESPACE + ".insertMember", mDto);
	}
	
	@Override
	public MemberDTO loginMember(MemberDTO mDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".loginMember", mDto);
	}


	@Override
	public MemberDTO selectMember(String member_id) {
		return sqlSession.selectOne(NAMESPACE + ".selectMember", member_id);
	}

	@Override
	public int updateMember(MemberDTO mDto) {
		return sqlSession.update(NAMESPACE + ".updateMember", mDto);
	}

	@Override
	public int deleteMember(String member_id) {
		return sqlSession.delete(NAMESPACE + ".deleteMember", member_id);
	}

	@Override
	public List<MemberDTO> listAllMembers() {
		return sqlSession.selectList(NAMESPACE + ".listAllMembers");
	}

	@Override
	public int idCheck(String member_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".idCheck", member_id);
	}

	@Override
	public int emailCheck(String email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".emailCheck", email);
	}

}
