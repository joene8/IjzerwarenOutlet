package com.springmvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.model.User;
import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addUser(User user) {
        getCurrentSession().save(user);
    }

    public void updateUser(User user) {
        User userToUpdate = getUser(user.getId());
        userToUpdate.setFirstName(user.getFirstName());
        userToUpdate.setLastName(user.getLastName());
        userToUpdate.setEmail(user.getEmail());
        userToUpdate.setStreetName(user.getStreetName());
        userToUpdate.setStreetNumber(user.getStreetNumber());
        userToUpdate.setStreetNumberSuffix(user.getStreetNumberSuffix());
        userToUpdate.setPostalCode(user.getPostalCode());
        userToUpdate.setCity(user.getCity());
        userToUpdate.setPhoneNumber(user.getPhoneNumber());
        userToUpdate.setPassword(user.getPassword());
        userToUpdate.setPermissionLevel(user.getPermissionLevel());
        userToUpdate.setEstablishment(user.getEstablishment());
        getCurrentSession().update(userToUpdate);

    }

    public User getUser(int id) {
        User user = (User) getCurrentSession().get(User.class, id);
        return user;
    }

    public User getUser(String email) {
        User user = (User) getCurrentSession().get(User.class, email);
        return user;
    }

    public void deleteUser(int id) {
        User user = getUser(id);
        if (user != null) {
            getCurrentSession().delete(user);
        }
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        return getCurrentSession().createQuery("from User").list();
    }

    public void storeAllUsers(List<User> users) {

        for (User user : users) {
            getCurrentSession().save(user);
        }

    }
}
