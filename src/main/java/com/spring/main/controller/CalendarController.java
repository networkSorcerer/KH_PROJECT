package com.spring.main.controller;

//CalendarController.java

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CalendarController {

 @GetMapping("/calendar")
 public String showCalendar(Model model) {
     // 현재 날짜 정보 가져오기
     LocalDate currentDate = LocalDate.now();

     // 현재 월 정보 가져오기
     int currentYear = currentDate.getYear();
     int currentMonth = currentDate.getMonthValue();

     // 현재 월의 첫 날짜와 마지막 날짜 계산
     LocalDate firstDayOfMonth = LocalDate.of(currentYear, currentMonth, 1);
     LocalDate lastDayOfMonth = firstDayOfMonth.withDayOfMonth(firstDayOfMonth.lengthOfMonth());

     // 현재 월의 달력 데이터 생성
     List<String> monthSchedule = new ArrayList<>();
     for (int day = 1; day <= lastDayOfMonth.getDayOfMonth(); day++) {
         monthSchedule.add(""); // 각 날짜별로 일정을 빈 문자열로 초기화
     }

     model.addAttribute("currentYear", currentYear);
     model.addAttribute("currentMonth", currentMonth);
     model.addAttribute("monthSchedule", monthSchedule);
     return "/project/calendar";
 }
}

