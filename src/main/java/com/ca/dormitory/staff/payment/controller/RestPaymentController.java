package com.ca.dormitory.staff.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.payment.mapper.PaymentSQLMapper;

@RestController
@RequestMapping("/staff/payment/*")
public class RestPaymentController {

	@Autowired
	private PaymentSQLMapper paymentSQLMapper;
	
	@RequestMapping("restEntPaymentList")
	public ArrayList<HashMap<String, Object>> restEntPaymentList(@RequestBody HashMap<String, Object> param){
		System.out.println(param.get("ent_no"));
		return paymentSQLMapper.selectEntPaymentList(param);
	}
	
	@RequestMapping("restEntSelectList")
	public ArrayList<HashMap<String, Object>> restEntSelectList(){
		return paymentSQLMapper.selectEntInfoNameList();
	} 
}
