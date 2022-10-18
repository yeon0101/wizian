package com.ca.dormitory.staff.payment.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface PaymentSQLMapper {

	
	ArrayList<HashMap<String, Object>> selectEntPaymentList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> selectEntInfoNameList();
	
}
