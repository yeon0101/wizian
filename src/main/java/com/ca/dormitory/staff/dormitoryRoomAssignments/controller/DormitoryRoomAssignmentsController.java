package com.ca.dormitory.staff.dormitoryRoomAssignments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/dormitoryRoomAssignments/*")
public class DormitoryRoomAssignmentsController {

	@RequestMapping("dormitoryRoomAssignmentsPage")
	public String dormitoryRoomAssignmentsPage() {
		return "staff/dormitoryRoomAssignments/dormitoryRoomAssignmentsPage";
	}
}
