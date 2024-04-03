package com.spring.map.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MapVO  {
	private int centerId=0;
	private String centerName="";
	private String centerAddress="";
	private String centerOperating="";
	private String centerTell="";
	private int centerLat=0;
	private int centerLot=0;
}
