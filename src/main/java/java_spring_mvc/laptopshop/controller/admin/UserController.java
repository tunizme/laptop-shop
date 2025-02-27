package java_spring_mvc.laptopshop.controller.admin;

import jakarta.validation.Valid;
import java_spring_mvc.laptopshop.domain.User;
import java_spring_mvc.laptopshop.service.UploadService;
import java_spring_mvc.laptopshop.service.UserService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/index";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }


    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User user, BindingResult newUserBindingResult, @RequestParam("avatarNameFile") MultipartFile file) throws IOException {
        if(newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));

        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }


    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(@PathVariable long id,Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("newUser", user);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") @Valid User user, BindingResult newUserBindingResult, @RequestParam("avatarNameFile") MultipartFile file) throws IOException {

        User userUpdate = this.userService.getUserById(user.getId());

        if(userUpdate != null) {
            userUpdate.setFullName(user.getFullName());
            userUpdate.setAddress(user.getAddress());
            userUpdate.setPhone(user.getPhone());
            userUpdate.setRole(this.userService.getRoleByName(user.getRole().getName()));

            if(!file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                userUpdate.setAvatar(avatar);
            }
            System.out.println(userUpdate);
            this.userService.handleSaveUser(userUpdate);
        }

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }

}
