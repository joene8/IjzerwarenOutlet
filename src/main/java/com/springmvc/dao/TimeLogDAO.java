/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.dao;

import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author How Fei Zheng
 */
@Repository
public class TimeLogDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addTimeLog(TimeLog timeLog) {
        getCurrentSession().save(timeLog);
    }

    public void updateLogin(TimeLog timeLog, User user) {
        TimeLog timeLogToUpdate = getTimeLog(timeLog.getId());

        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        timeLogToUpdate.setLogin(time);
        timeLogToUpdate.setUser(user);

        getCurrentSession().update(timeLogToUpdate);
    }
    
    public void updateLogout(TimeLog timeLog) {
        TimeLog timeLogToUpdate = getTimeLog(timeLog.getId());

        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        timeLogToUpdate.setLogout(time);
        
        Timestamp login = timeLogToUpdate.getLogin();
        long diff = Math.abs(login.getTime() - time.getTime());
        
        long second = (diff / 1000) % 60;
        long minute = (diff / (1000 * 60)) % 60;
        long hour = (diff / (1000 * 60 * 60)) % 24;
        long day = (diff / (1000 * 60 * 60 * 24));
        String toString = String.format("%02dd:%02dh:%02dm:%02ds", day, hour, minute, second, diff);
        timeLogToUpdate.setDuration(toString);
        
        
        getCurrentSession().update(timeLogToUpdate);
    }

    public TimeLog getTimeLog(int id) {
        TimeLog timeLog = (TimeLog) getCurrentSession().get(TimeLog.class, id);
        return timeLog;
    }

    public TimeLog getTimeLog(User user) {
        TimeLog timeLog = (TimeLog) getCurrentSession().get(TimeLog.class, user);
        return timeLog;
    }

    public List<TimeLog> getTimeLogs() {
        return getCurrentSession().createQuery("from TimeLog").list();
    }

    public void storeAllTimeLogs(List<TimeLog> timeLogs) {
        for (TimeLog timeLog : timeLogs) {
            getCurrentSession().save(timeLog);
        }
    }
}
