import com.example.bongotasks.Task;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;

// page_url = about:blank
public class SeleniumTest {

    private static ChromeDriver driver;
    WebElement element;

    @BeforeEach
    void setUp() {
        String chromeDriverPath = "C:\\Program Files\\Google\\Chrome\\chromedriver.exe";

        System.setProperty("webdriver.chrome.driver", chromeDriverPath);

        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        driver.get("http://localhost:8081/BongoTasks_JSP_war_exploded/");
    }

    @AfterEach
    void tearDown() throws InterruptedException {
        driver.close();
    }

    void AddTask(){
        assertEquals(driver.getTitle(), "BongoTasks");

        driver.findElement(By.id("add-task-button")).click();
        driver.findElement(By.id("task-name-field")).sendKeys("Selenium Created Task");
        driver.findElement(By.id("task-desc-field")).sendKeys("Selenium Created Description");
        driver.findElement(By.id("submit-button")).click();
        driver.findElement(By.id("confirm-add")).click();

        driver.findElement(By.id("Selenium Created Task"));
    }

    void DeleteTask(){
        assertEquals(driver.getTitle(), "BongoTasks");

        driver.findElement(By.id("Selenium Modified Task Name"));
        driver.findElement(By.id("delete-Selenium Modified Task Name")).click();
        driver.findElement(By.id("confirm-delete-button")).click();

        assertEquals(0, driver.findElements(By.id("Selenium Modified Task Name")).size());
    }

    void UpdateTask(){
        assertEquals(driver.getTitle(), "BongoTasks");

        driver.findElement(By.id("Selenium Created Task"));
        driver.findElement(By.id("edit-Selenium Created Task")).click();

        driver.findElement(By.id("edit-task-name")).clear();
        driver.findElement(By.id("edit-task-name")).sendKeys("Selenium Modified Task Name");
        driver.findElement(By.id("edit-task-desc")).clear();
        driver.findElement(By.id("edit-task-desc")).sendKeys("Selenium Modified Task Desc");
        driver.findElement(By.id("confirm-edit")).click();

        driver.findElementByTagName("button").click();
    }

    @Test
    void BaseWorkflow(){
        AddTask();
        UpdateTask();
        DeleteTask();
    }
}