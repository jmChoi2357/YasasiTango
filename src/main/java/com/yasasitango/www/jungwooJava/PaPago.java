package com.yasasitango.www.jungwooJava;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class PaPago {
	
	public String KoToJa(String original_str){
		String clientId = "qznWAlLJuFjI8U0VTCKO";
	    //애플리케이션 클라이언트 시크릿값";
	    String clientSecret = "tvVBgjf1hO";
	    
	    String resultString ="";
	    try {
	        //original_str 값이 우리가 변환할 값
	        String text = URLEncoder.encode(original_str, "UTF-8");
	        
	        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("POST");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        // post request
	        /* 번역 언어 변경용 */
	        String postParams = "source=ko&target=ja&text=" + text;
	        con.setDoOutput(true);
	        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	        wr.writeBytes(postParams);
	        wr.flush();
	        wr.close();
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else { // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        br.close();
	        System.out.println(response.toString());
	        
	        resultString = response.toString();
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    System.out.println(resultString);
	    return resultString;
	}

}
