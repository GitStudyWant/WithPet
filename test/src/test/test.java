package test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) {
		
		Date today = new Date();
		System.out.println(today);
		
		SimpleDateFormat dd = new SimpleDateFormat("yyyyMMddhhmmss");
		
		long todaylong = Long.parseLong((String)dd.format(today));
		System.out.println(todaylong);
		
		long a = today.getTime();
		
		System.out.println(a);

	}

}
