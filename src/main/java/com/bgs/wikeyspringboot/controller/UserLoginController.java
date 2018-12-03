package com.bgs.wikeyspringboot.controller;

import com.bgs.wikeyspringboot.dao.UserDao;
import com.bgs.wikeyspringboot.entity.User;
import com.bgs.wikeyspringboot.utils.DesUtil;
import com.bgs.wikeyspringboot.utils.DictionaryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class UserLoginController {
    @Autowired
    private UserDao userDao;

    @RequestMapping("/tologin")
    public String toLogin() {
        return "login";
    }
    @RequestMapping(path = "/login",method = POST)
    public String Login(String username,String password, HttpServletRequest request,HttpServletResponse response) throws Exception {
        List<User> users = userDao.loginUser(username,password);
        HttpSession session = request.getSession();
        if(users.size()>0){
            session.setAttribute(DictionaryUtils.session_user_auth,users.get(0));
            String enUserName = DesUtil.encrypt(users.get(0).getUsername());
            String enPassWord = DesUtil.encrypt(users.get(0).getPassword());
            String desString =enUserName+"_"+enPassWord;
            Cookie cookie = new Cookie("auth",desString);
            cookie.setPath("/");
            cookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(cookie);
            return "chd1";
        }
        return "login";
    }
    @RequestMapping(path = "/register",method = POST)
    public String registerUser(User user, Model model) {
        if(userDao.registerUser(user)<=0){
            model.addAttribute("regError","注册失败，请重新注册");
            return "login";
        }
        return "chd1";
    }

    @RequestMapping(path = "/index")
    public String toIndex(){
        return "chd1";
    }
}