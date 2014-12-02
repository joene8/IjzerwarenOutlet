/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.controller;

import com.springmvc.service.TimeLogService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author How Fei Zheng
 */
@Controller
@RequestMapping(value = "/timelog")
public class TimeLogController {
    
    @Autowired
    private TimeLogService timeLogService;
    
    // LIST
    @RequestMapping(value = "/list")
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "TimeLogs");
        model.addAttribute("timelogs", timeLogService.getTimeLogs());
        return "timelog_list";
    }
    
}
