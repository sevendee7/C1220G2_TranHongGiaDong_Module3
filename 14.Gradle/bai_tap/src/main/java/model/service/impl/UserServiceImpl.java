package model.service.impl;

import model.bean.User;
import model.repository.UserRepository;
import model.repository.impl.UserRepositoryImpl;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    @Override
    public User findById(Integer id) {
        return this.userRepository.findById(id);
    }

    @Override
    public boolean save(User user) {
        if (user.getName().matches("[A-Za-z ]+")) {
            return this.userRepository.save(user);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        return this.userRepository.delete(id);
    }

    @Override
    public List<User> searchByKeyword(String keywordJSP) {
        return this.userRepository.searchByKeyword(keywordJSP);
    }
}
