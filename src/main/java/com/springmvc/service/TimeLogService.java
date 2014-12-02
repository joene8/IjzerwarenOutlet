/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.service;

import com.springmvc.dao.TimeLogDAO;
import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author How Fei Zheng
 */
@Service
@Transactional
public class TimeLogService {
    
    @Autowired
    private TimeLogDAO timeLogDAO;
    
    public void addTimeLog(TimeLog timeLog){
        timeLogDAO.addTimeLog(timeLog);
    }
    
    public void updateLogin(TimeLog timeLog, User user){
        timeLogDAO.updateLogin(timeLog, user);
    }
    
    public void updateLogout(TimeLog timeLog){
        timeLogDAO.updateLogout(timeLog);
    }
    
    public TimeLog getTimeLog(int id){
        return timeLogDAO.getTimeLog(id);
    }
    
    public List<TimeLog>getTimeLogs(){
        return timeLogDAO.getTimeLogs();
    }
    
    public void storeAllTimeLogs(List<TimeLog>timeLogs){
        timeLogDAO.storeAllTimeLogs(timeLogs);
    }
    
}
