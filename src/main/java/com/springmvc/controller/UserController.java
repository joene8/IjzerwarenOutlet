package com.springmvc.controller;

import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import com.springmvc.service.TimeLogService;
import com.springmvc.service.UserService;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private TimeLogService timeLogService;
    @Autowired
    private EstablishmentService establishmentService;

    TimeLog t = new TimeLog();

    // LOGIN LOAD
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loadLogin(Model model) throws IOException {
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("pageDescription", "Enter your email and password.");
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
                    //Register Login TimeStamp
                    timeLogService.addTimeLog(t);
                    timeLogService.updateLogin(t, u);

                    //Add attributes to the request object
                    model.addAttribute("pageTitle", "Welcome " + u.getFirstName() + " " + u.getLastName());
                    model.addAttribute("message", "Successfully logged in.");
                    model.addAttribute("type", "success");
                    request.getSession().setAttribute("currentUser", u);
                    return "index";
                }
            }
        }
        user.setPassword("");
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("pageDescription", "Enter your email and password.");
        model.addAttribute("message", "The combination of email and password was incorrect.");
        model.addAttribute("type", "danger");
        return "user_login";

    }

    // LOGOUT
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model, HttpServletRequest request) throws IOException {
        request.getSession().removeAttribute("currentUser");
        request.getSession().removeAttribute("currentEstablishment");
        model.addAttribute("user", new User());
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("message", "Succesfully logged out.");
        model.addAttribute("type", "success");
        //REGISTER LOGOUT
        timeLogService.updateLogout(t);

        return "user_login";
    }

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model, HttpServletRequest request) throws IOException {
        if (request.getSession().getAttribute("currentUser") != null) {
            model.addAttribute("pageTitle", "Add user");
            model.addAttribute("pageDescription", "Enter the information for the new user.");
        } else {
            model.addAttribute("pageTitle", "Register");
            model.addAttribute("pageDescription", "Enter your information.");
        }

        model.addAttribute("user", new User());
        model.addAttribute("addEditOrView", "add");
        model.addAttribute("establishmentList", establishmentService.getEstablishments());
        return "user_add_edit_view";
    }

    // ADD SUBMIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String submitAdd(Model model, User user, HttpServletRequest request) throws IOException {
        // VALIDATION START
        model = validate(model, user);
        if (model.containsAttribute("anyErrors")) {
            if (request.getSession().getAttribute("currentUser") != null) {
                model.addAttribute("pageTitle", "Add user");
                model.addAttribute("pageDescription", "Enter the information for the new user.");
            } else {
                model.addAttribute("pageTitle", "Register");
                model.addAttribute("pageDescription", "Enter your information.");
            }
            user.setPassword("");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "add");
            model.addAttribute("establishmentList", establishmentService.getEstablishments());
            return "user_add_edit_view";
        }
        // VALIDATION END
        userService.addUser(user);
        if (request.getSession().getAttribute("currentUser") != null) {
            model.addAttribute("users", userService.getUsers());
            model.addAttribute("pageTitle", "Users");
            model.addAttribute("pageDescription", "Add, edit, delete or view a user.<br>You can also give a user new permissions or change their establishment.");
            model.addAttribute("message", "User was successfully added.");
            model.addAttribute("type", "success");
            return "user_list";
        }
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("message", "Account was successfully registered.");
        model.addAttribute("pageDescription", "Welcome to our site, go to products to start browsing.");
        model.addAttribute("type", "success");
        //REGISTER LOGIN
        timeLogService.addTimeLog(t);
        timeLogService.updateLogin(t, user);

        return "index";
    }

    // EDIT LOAD
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String loadEdit(Model model, @PathVariable int id, HttpServletRequest request) throws IOException {
        if (id == ((User) request.getSession().getAttribute("currentUser")).getId()) {
            model.addAttribute("pageTitle", "Edit account");
            model.addAttribute("pageDescription", "Update your information.");
        } else {
            model.addAttribute("pageTitle", "Edit user");
            model.addAttribute("pageDescription", "Update the information for this product.");
        }
        model.addAttribute("user", userService.getUser(id));
        model.addAttribute("addEditOrView", "edit");
        model.addAttribute("establishmentList", establishmentService.getEstablishments());
        return "user_add_edit_view";
    }

    // EDIT SUBMIT
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String submitEdit(Model model, User user, HttpServletRequest request) throws IOException {

        // VALIDATION START
        model = validate(model, user);
        if (model.containsAttribute("anyErrors")) {
            if (request.getSession().getAttribute("currentUser") != null) {
                model.addAttribute("pageTitle", "Edit user");
                model.addAttribute("pageDescription", "Enter the information for the new user.");
            } else {
                model.addAttribute("pageTitle", "Edit account");
                model.addAttribute("pageDescription", "Enter your information.");
            }
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "edit");
            model.addAttribute("establishmentList", establishmentService.getEstablishments());
            return "user_add_edit_view";
        }
        // VALIDATION END
        userService.updateUser(user);
        if (user.getId() == ((User) request.getSession().getAttribute("currentUser")).getId()) {
            request.getSession().setAttribute("currentUser", user);
            model.addAttribute("pageTitle", "My account");
            model.addAttribute("pageDescription", "All your information.");
        } else {
            model.addAttribute("pageTitle", "View user");
            model.addAttribute("pageDescription", "All the information for this establishment.");
        }
        model.addAttribute("message", "Information was succesfully updated.");
        model.addAttribute("type", "success");
        model.addAttribute("addEditOrView", "view");
        model.addAttribute("establishmentList", establishmentService.getEstablishments());
        return "user_add_edit_view";
    }

    // VIEW
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable int id, HttpServletRequest request) throws IOException {
        if (id == ((User) request.getSession().getAttribute("currentUser")).getId()) {
            model.addAttribute("pageTitle", "My account");
            model.addAttribute("pageDescription", "All your information.");
        } else {
            model.addAttribute("pageTitle", "View user");
            model.addAttribute("pageDescription", "All the information for this establishment.");
        }
        model.addAttribute("user", (userService.getUser(id)));
        model.addAttribute("addEditOrView", "view");
        model.addAttribute("establishmentList", establishmentService.getEstablishments());
        return "user_add_edit_view";
    }

    // LIST
    @RequestMapping(value = "/list")
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "Add, edit, delete or view a user.<br>You can also give a user new permissions or change their establishment.");
        model.addAttribute("users", userService.getUsers());
        return "user_list";
    }

    // DELETE
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable int id, Model model, HttpServletRequest request) {
        if (id == ((User) request.getSession().getAttribute("currentUser")).getId()) {
            model.addAttribute("message", "You can not delete your own account.");
            model.addAttribute("type", "danger");
        } else {
            User user = userService.getUser(id);
            userService.deleteUser(id);

            model.addAttribute("message", user.getFirstName() + " " + user.getLastName() + " was succesfully deleted.");
            model.addAttribute("type", "success");
        }
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "Add, edit, delete or view a user.<br>You can also give a user new permissions or change their establishment.");
        model.addAttribute("users", userService.getUsers());
        return "user_list";
    }

    // UPDATE PERMISSION LEVEL
    @RequestMapping(value = "/update_permission_level/{id}/{permissionLevel}")
    public String updatePermissionLevel(@PathVariable int id, @PathVariable int permissionLevel, Model model, HttpServletRequest request) throws IOException {
        if (id == ((User) request.getSession().getAttribute("currentUser")).getId()) {
            model.addAttribute("message", "You can not update your own permission level.");
            model.addAttribute("type", "danger");
            model.addAttribute("users", userService.getUsers());
        } else {
            User u = userService.getUser(id);
            u.setPermissionLevel(permissionLevel);
            userService.updateUser(u);
            model.addAttribute("users", userService.getUsers());
            model.addAttribute("message", u.getFirstName() + " " + u.getLastName() + " now has permission level: " + permissionLevel);
            model.addAttribute("type", "success");
        }
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "Add, edit, delete or view a user.<br>You can also give a user new permissions or change their establishment.");
        return "user_list";
    }

    // SEARCH USER
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "search") String search, Model model) throws IOException {
        List<User> users = userService.getUsers();
        List<User> foundUsers = new ArrayList<User>();
        for (User u : users) {
            if (u.getFirstName().toLowerCase().contains(search.toLowerCase())) {
                foundUsers.add(u);
            } else if (u.getLastName().toLowerCase().contains(search.toLowerCase())) {
                foundUsers.add(u);
            }
        }

        model.addAttribute("users", foundUsers);
        String message = "";
        if (foundUsers.isEmpty()) {
            if (search.equals("")) {
                message = "No user was found.";
            } else {
                message = "No user with the name containing \"" + search + "\" was found";
            }
            model.addAttribute("type", "danger");
        } else {
            String extraS = "";
            String plural = "was";
            if (foundUsers.size() != 1) {
                extraS = "s";
                plural = "were";
            }
            if (search.equals("")) {
                message = foundUsers.size() + " user" + extraS + " " + plural + " found.";
            } else {
                message = foundUsers.size() + " user" + extraS + " with name" + extraS + " containing \"" + search + "\" " + plural + " found.";
            }
            model.addAttribute("type", "success");

        }
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "All the users that matched your search criteria.");
        model.addAttribute("message", message);

        return "user_list";
    }

    //SEARCH EMPLOYEE
    @RequestMapping(value = "/search_employee", method = RequestMethod.GET)
    public String searchEmployee(@RequestParam(value = "search_employee") String search, Model model) throws IOException {
        List<User> users = userService.getUsers();
        List<User> foundUsers = new ArrayList<User>();
        for (User u : users) {
            if (u.getPermissionLevel() > 1) {
                if (u.getFirstName().toLowerCase().contains(search.toLowerCase())) {
                    foundUsers.add(u);
                } else if (u.getLastName().toLowerCase().contains(search.toLowerCase())) {
                    foundUsers.add(u);
                }
            }
        }

        model.addAttribute("users", foundUsers);
        String message = "";
        if (foundUsers.isEmpty()) {
            if (search.equals("")) {
                message = "No employee was found.";
            } else {
                message = "No employee with the name containing \"" + search + "\" was found";
            }
            model.addAttribute("type", "danger");
        } else {
            String extraS = "";
            String plural = "was";
            if (foundUsers.size() != 1) {
                extraS = "s";
                plural = "were";
            }
            if (search.equals("")) {
                message = foundUsers.size() + " employee" + extraS + " " + plural + " found.";
            } else {
                message = foundUsers.size() + " employee" + extraS + " with name" + extraS + " containing \"" + search + "\" " + plural + " found.";
            }
            model.addAttribute("type", "success");

        }
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "All the employees that matched your search criteria.");
        model.addAttribute("message", message);

        return "user_list";
    }

    // SEARCH CUSTOMER
    @RequestMapping(value = "/search_customer", method = RequestMethod.GET)
    public String searchCustomer(@RequestParam(value = "search_customer") String search, Model model) throws IOException {
        List<User> users = userService.getUsers();
        List<User> foundUsers = new ArrayList<User>();
        for (User u : users) {
            if (u.getPermissionLevel() <= 1) {
                if (u.getFirstName().toLowerCase().contains(search.toLowerCase())) {
                    foundUsers.add(u);
                } else if (u.getLastName().toLowerCase().contains(search.toLowerCase())) {
                    foundUsers.add(u);
                }
            }
        }

        model.addAttribute("users", foundUsers);
        String message = "";
        if (foundUsers.isEmpty()) {
            if (search.equals("")) {
                message = "No customer was found.";
            } else {
                message = "No customer with the name containing \"" + search + "\" was found";
            }
            model.addAttribute("type", "danger");
        } else {
            String extraS = "";
            String plural = "was";
            if (foundUsers.size() != 1) {
                extraS = "s";
                plural = "were";
            }

            if (search.equals("")) {
                message = foundUsers.size() + " customer" + extraS + " " + plural + " found.";
            } else {
                message = foundUsers.size() + " customer" + extraS + " with name" + extraS + " containing \"" + search + "\" " + plural + " found.";
            }
            model.addAttribute("type", "success");

        }
        model.addAttribute("pageTitle", "Users");
        model.addAttribute("pageDescription", "All the customers that matched your search criteria.");
        model.addAttribute("message", message);

        return "user_list";
    }

    // VALIDATE USER
    public Model validate(Model model, User user) {
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
        if (!Validation.phoneNumber(user.getPhoneNumber())) {
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
