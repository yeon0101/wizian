package com.ca.dormitory.staff.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/payment/*")
public class PaymentController {

	@RequestMapping("paymentManagePage")
	public String dormitoryInfoPage() {
		return "staff/payment/paymentManagePage";
	}
	
}
