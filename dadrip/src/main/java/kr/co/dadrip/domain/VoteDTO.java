package kr.co.dadrip.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VoteDTO {
	
	private int vote_id;
	private int joke_id;
	private String member_id;
	private Date voted_on;
	private String vote_type;
	
}
