package kr.co.dadrip.lombok;

public class LombokTestClassMain {

	public static void main(String[] args) {

		LombokTestClass ltc01 = new LombokTestClass("Marie", 35, 'F', 173.7, 48.6, false);
		LombokTestClass ltc02 = new LombokTestClass("Hank", 38, 'M', 173.7, 48.6, false);
		LombokTestClass ltc03 = new LombokTestClass("Hank", 38, '\u0000', 173.7, 48.6, false);

		System.out.println(ltc01);
		System.out.println(ltc02);
		System.out.println(ltc03);

	}
}
