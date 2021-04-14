package model.service;

import model.bean.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(Integer id);

    boolean save(User user);

    List<User> searchByKeyword(String keywordJSP);
}
