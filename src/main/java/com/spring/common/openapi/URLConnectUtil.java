package com.spring.common.openapi;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.spring.openapi.data.vo.OpenApiDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class URLConnectUtil {
//	public static StringBuffer openAPIData(OpenApiDTO api) throws Exception {
//		URL url = new URL(api.getSiteName());
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		
//		//요청방식 선택(GET, POST)
//		conn.setRequestMethod(api.getMethod());
//		String accept = api.getAccept();
//		if(accept != null) {
//			conn.setRequestProperty("Accept", accept);
//		}
//		String contentType = api.getContentType();
//		//타입설정 (application/xml)형식으로 전송
//		if(contentType != null) {
//			conn.setRequestProperty("Content-type", contentType);
//		}
//		
//		int resCode = conn.getResponseCode();
//		log.info("응답코드 : " + resCode);
//		
//		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
//		String inputLine;
//		StringBuffer output = new StringBuffer();
//		while((inputLine = in.readLine()) != null) {
//			output.append(inputLine);
//		}
//		return output;
//	}
	
	public static StringBuffer openAPIData(OpenApiDTO api) throws Exception {
		URL url = new URL(api.getSiteName());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		//요청방식선택(GET, POST)
		conn.setRequestMethod(api.getMethod());
		
		//확인을 위한 응답코드 출력
		int resCode = conn.getResponseCode();
		log.info("응답코드 : " + resCode);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer output = new StringBuffer();
		while((inputLine = in.readLine()) != null) {
			output.append(inputLine);
		}
		return output;
	}

	
}