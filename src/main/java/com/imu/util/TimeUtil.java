package com.imu.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	public static SimpleDateFormat dateformatAll= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static Timestamp currentTime(){
		return new Timestamp(System.currentTimeMillis()); 
	}
	public static String getTimeWithoutMilliSecond(Timestamp time){
		return dateformatAll.format(time);
	};
	
	public static String formatTime(Date time) {
		return dateformatAll.format(time);
	}
	
	public static String miniuiTime(Date time) {
		String str=dateformatAll.format(time);
		String[] temp=str.split(" ");
		return temp[0]+"T"+temp[1];
	}
	
	public static String getTimeFilePath() {
		Date date = new Date();
		return "/"+(date.getYear()+1900)+"/"+
				((date.getMonth()+1)<10 ?"0"+(date.getMonth()+1): (date.getMonth()+1) )+"/"+
				(date.getDate()<10 ?"0"+date.getDate():date.getDate())+"/"+
				(date.getHours()<10?"0"+date.getHours():date.getHours())+
				(date.getMinutes()<10?"0"+date.getMinutes():date.getMinutes())+
				(date.getSeconds()<10?"0"+date.getSeconds():date.getSeconds());
	}
	public static Timestamp ToDate(Object o){
    	try{
    		if(o.getClass() == String.class){


    			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			o = format.parse(o.toString());  
    			return new java.sql.Timestamp(((Date)o).getTime());
    		}
    		return o != null ? new java.sql.Timestamp(((Date)o).getTime()) : null;
		}catch(Exception ex){
			return null;
		}
    }
}
