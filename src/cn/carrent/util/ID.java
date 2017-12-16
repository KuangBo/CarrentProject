package cn.carrent.util;

import java.util.Random;

public class ID {
	public static String getId(int len){
		Random rand = new Random(System.currentTimeMillis());
		String strid = "";
		for(int i=0;i<len;i++){
			int id = rand.nextInt(10);
			strid += String.valueOf(id);
		}
		return strid;
	}
}
