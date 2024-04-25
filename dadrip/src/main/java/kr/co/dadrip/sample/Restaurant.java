package kr.co.dadrip.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component	// 해당 클래스가 스프링에서 관리해야 하는 대상임을 표시
@Data
public class Restaurant {

	@Setter(onMethod_ = @Autowired)	// 생성되는 setChef() 세터에 @Autowired 어노테이션을 추가
	private Chef chef;
}
