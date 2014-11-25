package com.springmvc.controller;

import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.UserService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    // LOGIN LOAD
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loadLogin(Model model) throws IOException {
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("pageDescription", "Please enter your email and password");
        model.addAttribute("user", new User());
        return "user_login";
    }

    // LOGIN SUBMIT
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String submitLogin(Model model, @Valid User user, HttpServletRequest request) throws IOException {
        List<User> allUsers = userService.getUsers();
        for (User u : allUsers) {
            if (u.getEmail().equals(user.getEmail())) {
                if (user.getPassword().equals(u.getPassword())) {
                    //Add attributes to the request object
                    model.addAttribute("pageTitle", "Welcome " + u.getFirstName() + " " + u.getLastName());
                    model.addAttribute("message", "Successfully logged in");
                    model.addAttribute("type", "success");
                    request.getSession().setAttribute("currentUser", u);
                    return "index";
                }
            }
        }
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("message", "Email/password was incorrect");
        model.addAttribute("type", "danger");
        return "user_login";

    }

    // LOGOUT
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model, HttpServletRequest request) throws IOException {
        request.getSession().removeAttribute("currentUser");
        model.addAttribute("user", new User());
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("message", "Succesfully logged out.");
        model.addAttribute("type", "success");
        return "user_login";
    }

    // REGISTER LOAD
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String loadRegister(Model model) throws IOException {
        model.addAttribute("pageTitle", "Register");
        model.addAttribute("pageDescription", "Please enter your information");
        model.addAttribute("user", new User());
        return "user_register";
    }

    // REGISTER SUBMIT
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String submitRegister(Model model, User user, HttpServletRequest request) throws IOException {
        // VALIDATION START
        boolean anyErrors = false;
        if (!Validation.lettersMin(user.getFirstName(), 2)) {
            model.addAttribute("errorFirstName", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(user.getLastName(), 2)) {
            model.addAttribute("errorLastName", true);
            anyErrors = true;
        }
        if (!Validation.email(user.getEmail())) {
            model.addAttribute("errorEmail", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(user.getStreetName(), 2)) {
            model.addAttribute("errorStreetName", true);
            anyErrors = true;
        }
        if (!Validation.numbersMin(Integer.toString(user.getStreetNumber()), 1)) {
            model.addAttribute("errorStreetNumber", true);
            anyErrors = true;
        }

        if (!Validation.postalCode(user.getPostalCode())) {
            model.addAttribute("errorPostalCode", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(user.getCity(), 2)) {
            model.addAttribute("errorCity", true);
            anyErrors = true;
        }
        if (!Validation.phoneNumber("0"+Integer.toString(user.getPhoneNumber()))) {
            model.addAttribute("errorPhoneNumber", true);
            anyErrors = true;
        }
        if (!Validation.password(user.getPassword())) {
            model.addAttribute("errorPassword", true);
            anyErrors = true;
        }
        if (anyErrors) {
            model.addAttribute("pageTitle", "Register");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "user_register";
        }
        // VALIDATION END
        user.setPermissionLevel((int) (Math.random() * 4) + 1);
        userService.addUser(user);
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("message", "Account was successfully registered.");
        model.addAttribute("type", "success");
        return "index";
    }

    // LIST
    @RequestMapping(value = "/list")
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("users", userService.getUsers());
        return "user_list";
    }

    // UPDATE PERMISSION LEVEL
    @RequestMapping(value = "/update_permission_level/{id}/{permissionLevel}")
    public String updatePermissionLevel(@PathVariable int id, @PathVariable int permissionLevel, Model model) throws IOException {
        User u = userService.getUser(id);
        u.setPermissionLevel(permissionLevel);
        userService.updateUser(u);
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("users", userService.getUsers());
        model.addAttribute("message", u.getFirstName()+" " + u.getLastName()+ " now has permission level: "+permissionLevel);
        model.addAttribute("type", "success");
        return "user_list";
    }
}
