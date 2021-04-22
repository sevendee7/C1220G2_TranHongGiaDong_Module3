package model.repository.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.BaseRepository;
import model.repository.CRUDRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CRUDRepository<Customer> {

    private BaseRepository baseRepository = new BaseRepository();

    public List<Customer> findAllCustomerType() {
        List<Customer> customerTypeList = new ArrayList<>();

        try {
            Statement statement = baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * \n" +
                    "from customer_type;");

            Customer customerType = null;
            while (resultSet.next()) {
                customerType = new Customer();
                customerType.setTypeId(Integer.parseInt(resultSet.getString(1)));
                customerType.setCustomerType(resultSet.getString(2));
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerTypeList;
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * \n" +
                    "from customer;");

            Customer customer = null;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(resultSet.getString(1));
                customer.setName(resultSet.getString(2));
                customer.setDateOfBirth(resultSet.getString(3));
                customer.setGender(resultSet.getBoolean(4));
                customer.setIdCard(resultSet.getString(5));
                customer.setPhone(resultSet.getString(6));
                customer.setEmail(resultSet.getString(7));
                customer.setAddress(resultSet.getString(8));
                customer.setTypeId(Integer.parseInt(resultSet.getString(9)));

                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }


    @Override
    public boolean insertNewRecord(Customer customer) {
        try {
            PreparedStatement preparedStatement =
                    baseRepository.getConnection().prepareStatement("insert into customer\n" +
                            "values\n" +
                            "(?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getTypeId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        return false;
    }


    public boolean deleteCustomer(String id) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("delete from customer\n" +
                            "where id = ?");
            preparedStatement.setString(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean save(Customer customer) {

        boolean rowUpdated = false;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("update customer\n" +
                            "set id = ?,customer_name = ?,customer_birthday = ?,customer_gender = ?,customer_id_card = ?,customer_phone = ?,customer_email = ?,customer_address = ?,customer_type_id = ?\n" +
                            "where id = ?;");
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getTypeId());
            preparedStatement.setString(10, customer.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public Customer findById(Integer id) {
        return null;
    }

    @Override
    public List<Customer> searchByMultipleKeyword(String nameKeyword, String idKeyword, String emailKeyword) {
        List<Customer> customerList = new ArrayList<>();

        PreparedStatement preparedStatement;

        {
            try {
                preparedStatement = this.baseRepository.getConnection().prepareStatement("select c.id, c.customer_name,c.customer_birthday,c.customer_gender,c.customer_id_card,c.customer_phone,c.customer_email,c.customer_address,c.customer_type_id\n" +
                        "from customer c\n" +
                        "where (c.customer_name like ?\n" +
                        "or c.customer_name like ?)\n" +
                        "and (c.id like ?\n" +
                        "or c.id like ?)\n" +
                        "and ( c.customer_email like ?\n" +
                        "or c.customer_email like ?);");
                preparedStatement.setString(1, '%' + nameKeyword + '%');
                preparedStatement.setString(2, nameKeyword + '%');
                preparedStatement.setString(3, '%' + idKeyword + '%');
                preparedStatement.setString(4, idKeyword + '%');
                preparedStatement.setString(5, '%' + emailKeyword + '%');
                preparedStatement.setString(6, emailKeyword + '%');
                ResultSet resultSet = preparedStatement.executeQuery();

                Customer customer = null;
                while(resultSet.next()) {
                    customer = new Customer();
                    customer.setId(resultSet.getString(1));
                    customer.setName(resultSet.getString(2));
                    customer.setDateOfBirth(resultSet.getString(3));
                    customer.setGender(Boolean.parseBoolean(resultSet.getString(4)));
                    customer.setIdCard(resultSet.getString(5));
                    customer.setPhone(resultSet.getString(6));
                    customer.setEmail(resultSet.getString(7));
                    customer.setAddress(resultSet.getString(8));
                    customer.setTypeId(Integer.parseInt(resultSet.getString(9)));

                    customerList.add(customer);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerList;
    }

    @Override
    public Customer findCustomerById(String id) {
        Customer customer = new Customer();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select *" +
                            "from customer\n" +
                            "where id = ?");

            preparedStatement.setString(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customer.setId(resultSet.getString(1));
                customer.setName(resultSet.getString(2));
                customer.setDateOfBirth(resultSet.getString(3));
                customer.setGender(resultSet.getBoolean(4));
                customer.setIdCard(resultSet.getString(5));
                customer.setPhone(resultSet.getString(6));
                customer.setEmail(resultSet.getString(7));
                customer.setAddress(resultSet.getString(8));
                customer.setTypeId(Integer.parseInt(resultSet.getString(9)));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customer;
    }
}


