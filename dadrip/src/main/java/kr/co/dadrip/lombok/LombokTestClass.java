package kr.co.dadrip.lombok;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor	// constructor with all field members
@Data	// getter, setter
@ToString
public class LombokTestClass {

	private String name;
	private int age;
	private char gender;
	private double height;
	private double weight;
	private boolean check;
	
}
