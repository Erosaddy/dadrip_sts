package kr.co.dadrip.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDTO {

	private String member_id;
	private String nickname;
	private String member_pw;
	private String email;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date birthday;
	private String sex;
	private Date registered_on;
	
}
