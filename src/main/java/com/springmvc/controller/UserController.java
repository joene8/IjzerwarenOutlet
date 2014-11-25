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

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model) throws IOException {
        model.addAttribute("pageTitle", "Register");
        model.addAttribute("pageDescription", "Please enter your information");
        model.addAttribute("user", new User());
        model.addAttribute("addEditOrView", "add");
        return "user_add_edit_view";
    }

    // ADD SUBMIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String submitAdd(Model model, User user, HttpServletRequest request) throws IOException {
        // VALIDATION START
        boolean anyErrors = false;
        model = validate(model, user, anyErrors);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Register");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "add");
            return "user_add_edit_view";
        }
        // VALIDATION END
        userService.addUser(user);
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("message", "Account was successfully registered.");
        model.addAttribute("type", "success");
        return "index";
    }

    // EDIT LOAD
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String loadEdit(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "Edit account");
        model.addAttribute("pageDescription", "Please update your information");
        model.addAttribute("user", (User) request.getSession().getAttribute("currentUser"));
        model.addAttribute("addEditOrView", "edit");
        return "user_add_edit_view";
    }

    // EDIT SUBMIT
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String submitEdit(Model model, User user, HttpServletRequest request) throws IOException {

        // VALIDATION START
        boolean anyErrors = false;
        model = validate(model, user, anyErrors);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Edit account");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "edit");
            return "user_add_edit_view";
        }
        // VALIDATION END
        userService.updateUser(user);
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "My account");
        model.addAttribute("message", "Information was succesfully updated.");
        model.addAttribute("type", "success");
        model.addAttribute("addEditOrView", "view");
        return "user_add_edit_view";
    }

    // VIEW LOAD
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String loadView(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "My account");
        model.addAttribute("user", (User) request.getSession().getAttribute("currentUser"));
        model.addAttribute("addEditOrView", "view");
        return "user_add_edit_view";
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
        model.addAttribute("message", u.getFirstName() + " " + u.getLastName() + " now has permission level: " + permissionLevel);
        model.addAttribute("type", "success");
        return "user_list";
    }

    // VALIDATE USER
    public Model validate(Model model, User user, boolean anyErrors) {
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
        if (!Validation.streetAndCity(user.getStreetName())) {
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
        if (!Validation.streetAndCity(user.getCity())) {
            model.addAttribute("errorCity", true);
            anyErrors = true;
        }
        if (!Validation.phoneNumber("0" + Integer.toString(user.getPhoneNumber()))) {
            model.addAttribute("errorPhoneNumber", true);
            anyErrors = true;
        }
        if (!Validation.password(user.getPassword())) {
            model.addAttribute("errorPassword", true);
            anyErrors = true;
        }
        if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
}
