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
	private Date created_on;
	private Date modified_on;
	private String joke_question;
	private String joke_answer;
	private int view_count;
	private int reply_count;
	private int like_count;
	private int dislike_count;
	
}
