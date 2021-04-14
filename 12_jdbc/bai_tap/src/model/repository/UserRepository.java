package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepository {

    List<User> findAll();

    User findById(Integer id);

    boolean save(User user);

    void insertUser(User user);

    boolean delete(int id);

    List<User> searchByKeyword(String keywordJSP);
}
