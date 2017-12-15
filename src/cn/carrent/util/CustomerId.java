package cn.carrent.util;

import java.util.Random;

public class CustomerId {
	public static String getCustomerId(){
		Random rand = new Random(System.currentTimeMillis());
		String cusid = "";
		for(int i=0;i<4;i++){
			int id = rand.nextInt(10);
			cusid += String.valueOf(id);
		}
		return cusid;
	}
}
