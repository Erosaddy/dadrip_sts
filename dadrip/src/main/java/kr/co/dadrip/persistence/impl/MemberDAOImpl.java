package kr.co.dadrip.persistence.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.persistence.IMemberDAO;
import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class MemberDAOImpl implements IMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.dadrip.memberMapper";
	
	@Override
	public void insertMember(MemberDTO mDto) {
		sqlSession.insert(namespace + ".insertMember", mDto);
	}
	
	@Override
	public MemberDTO loginMember(String member_id, String member_pw) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("member_id", member_id);
		paramMap.put("member_pw", member_pw);
		
		return sqlSession.selectOne(namespace + ".loginMember", paramMap);
	}


	@Override
	public MemberDTO selectMember(String member_id) {
		return sqlSession.selectOne(namespace + ".selectMember", member_id);
	}

	@Override
	public int updateMember(MemberDTO mDto) {
		return sqlSession.update(namespace + ".updateMember", mDto);
	}

	@Override
	public int deleteMember(String member_id) {
		int result = sqlSession.delete(namespace + ".deleteMember", member_id);
		log.info("Delete operation result =================> : " + result);
		return result;
	}

	@Override
	public List<MemberDTO> listAllMembers() {
		return sqlSession.selectList(namespace + ".listAllMembers");
	}

}
