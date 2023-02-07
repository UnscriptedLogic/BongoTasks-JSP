import com.example.bongotasks.Task;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class TaskServletTest {

    Connection connection = null;
    int taskSize = 0;

    protected void Connection(String username, String password) {
        connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Variables that are used for database connections
            String sqlURL = "jdbc:mysql://127.0.0.1:3306/?user=root";
            String sqlUsername = username;
            String sqlPassword = password;
            connection = DriverManager.getConnection(sqlURL, sqlUsername, sqlPassword);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Test
    void IncorrectConnectionCredentials() {
        Connection("notroot", "notadmin");
        assertNull(connection);
    }

    @Test
    void CorrectConnectionCredentials() {
        Connection("root", "admin");
        assertNotNull(connection);
    }

    void GetTasks() {
        Connection("root", "admin");
        List<Task> taskList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM bongotasks.tasks")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(resultSet);

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                taskList.add(new Task(id, name, description, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        taskSize = taskList.size();
    }

    @Test
    void addTask() {
        Connection("root", "admin");
        GetTasks();

        int prevsize = taskSize;

        try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bongotasks.tasks (name, description, status) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, "Test Add Name");
            preparedStatement.setString(2, "Test Add Desc");
            preparedStatement.setBoolean(3, false);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        GetTasks();

        assertEquals(prevsize + 1, taskSize);
    }

    @Test
    void updateTask() {
        Connection("root", "admin");

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE bongotasks.tasks SET name = 'Edited Task', description = 'Editted Task Desc' WHERE id = " + 0)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM bongotasks.tasks WHERE id = 0")) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Test
    void updateStatus() {
        Connection("root", "admin");

        try (PreparedStatement preparedStatement = connection.prepareStatement("UPDATE bongotasks.tasks SET status = " + 1 + " WHERE id = " + 0)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Test
    void deleteTask() {
        Connection("root", "admin");

        List<Task> taskList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM bongotasks.tasks")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(resultSet);

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                taskList.add(new Task(id, name, description, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM bongotasks.tasks WHERE id = " + taskList.get(taskList.size() - 1).getId())) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        GetTasks();

        assertEquals(taskList.size() - 1, taskSize);
    }
}