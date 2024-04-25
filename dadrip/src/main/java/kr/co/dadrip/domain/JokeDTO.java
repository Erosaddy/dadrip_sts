package kr.co.dadrip.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JokeDTO {
	
	private Integer joke_id;
	private String member_id;
	private Date created;
	private Date modified;
	private String question;
	private String answer;
	private String views;
	
}
