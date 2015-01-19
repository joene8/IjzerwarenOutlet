/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.controller;

import com.springmvc.model.TimeLog;
import com.springmvc.service.TimeLogService;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
        return "timelog_list";
    }

    // DELETE
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable int id, Model model, HttpServletRequest request) {

        TimeLog timeLog = timeLogService.getTimeLog(id);
        timeLogService.deleteTimeLog(id);

        model.addAttribute("message", "Time log " + timeLog.getId() + " from " + timeLog.getLogin() + " was succesfully deleted.");
        model.addAttribute("type", "success");

        model.addAttribute("pageTitle", "TimeLogs");
        model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
        model.addAttribute("timelogs", timeLogService.getTimeLogs());
        return "timelog_list";
    }

    // SEARCH
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "fromDate") String fromDate, String toDate, Model model) throws IOException, ParseException {
        List<TimeLog> timeLogs = timeLogService.getTimeLogs();
        List<TimeLog> foundTimeLogs = new ArrayList<TimeLog>();

        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);

        String message = "";

        if (fromDate.isEmpty() || toDate.isEmpty()) {
            model.addAttribute("pageTitle", "TimeLogs");
            model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
            model.addAttribute("type", "danger");
            message = "Please choose a starting date with an ending date.";
            model.addAttribute("message", message);
            return "timelog_list";
        }

        Timestamp beginDate = new Timestamp(new SimpleDateFormat("MM/dd/yyyy").parse(fromDate).getTime());
        Timestamp endDate = new Timestamp(new SimpleDateFormat("MM/dd/yyyy").parse(toDate).getTime());

        if (beginDate.after(endDate)) {
            model.addAttribute("pageTitle", "TimeLogs");
            model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
            model.addAttribute("type", "danger");
            message = "Starting date cannot be after the ending date.";
            model.addAttribute("message", message);
            return "timelog_list";
        }

        for (TimeLog t : timeLogs) {
            if ((t.getLogin().after(beginDate)) && (t.getLogin().before(endDate))) {
                foundTimeLogs.add(t);
            }
        }

        model.addAttribute("timelogs", foundTimeLogs);

        if (foundTimeLogs.isEmpty()) {
            message = "No logs between \"" + fromDate + " and " + toDate + "\" were found";
            model.addAttribute("type", "danger");
        } else {
            String extraS = "";
            String plural = "was";
            if (foundTimeLogs.size() != 1) {
                extraS = "s";
                plural = "were";
            }
            message = foundTimeLogs.size() + " log" + extraS + " between \"" + fromDate + " and " + toDate + "\" " + plural + " found.";
            model.addAttribute("type", "success");

        }
        model.addAttribute("pageTitle", "TimeLogs");
        model.addAttribute("pageDescription", "All the logs that matched your search criteria.");
        model.addAttribute("message", message);

        return "timelog_list";
    }

    // SELECTION DELETE
    @RequestMapping(value = "/selection")
    public String selection(Model model, HttpServletRequest request) throws IOException {

        String message = "";

        if (request.getParameterValues("selection") == null) {
            model.addAttribute("pageTitle", "TimeLogs");
            model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
            model.addAttribute("type", "danger");
            message = "Please make a selection before deleting";
            model.addAttribute("message", message);
            model.addAttribute("timelogs", timeLogService.getTimeLogs());
            return "timelog_list";
        } else {
            String[] selectedTimeLogIds = request.getParameterValues("selection");
            for (String s : selectedTimeLogIds) {
                timeLogService.deleteTimeLog(Integer.parseInt(s));
            }
            message = "Selected logs succesfully deleted.";
        }

        model.addAttribute("pageTitle", "TimeLogs");
        model.addAttribute("pageDescription", "List of all login sessions and durations <br>You can sort and delete time logs as well");
        model.addAttribute("timelogs", timeLogService.getTimeLogs());
        model.addAttribute("message", message);
        model.addAttribute("type", "success");

        return "timelog_list";
    }

}
