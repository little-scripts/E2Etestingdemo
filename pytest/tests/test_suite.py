"""
This is test E2E
"""

import pytest
import requests
from selenium.webdriver.common.by import By


@pytest.mark.sanity
class TestE2E:
    """ Docstring
    """

    @pytest.mark.parametrize("url, username, password, expected_text",
                             [("https://demo.applitools.com/", "andy", "panda<3", "Financial Overview")])
    def test_login_applitools(self, setupdriver, url, username, password, expected_text):
        """
        Round 1: Element Interaction
        """
        driver = setupdriver
        driver.get(url)

        username_elem = driver.find_element(by=By.ID, value="username")
        password_elem = driver.find_element(by=By.ID, value="password")
        login_elem = driver.find_element(by=By.ID, value="log-in")
        username_elem.send_keys(username)
        password_elem.send_keys(password)
        login_elem.click()

        actual_text = driver.find_element(by=By.XPATH, value="//*[contains(@class, 'element-header')]").text
        assert actual_text == expected_text

    @pytest.mark.parametrize("url, expected_text",
                             [("https://kitchen.applitools.com/ingredients/iframe", "fruits-vegetables")])
    def test_inline_frames(self, setupdriver, url, expected_text):
        """
        Round 2: Inline Frames
        """
        driver = setupdriver
        driver.get(url)
        driver.switch_to.frame("the-kitchen-table")
        assert driver.find_element(by=By.ID, value=expected_text).is_displayed()

    @pytest.mark.parametrize("url, expected_text", [("https://automationbookstore.dev/", "Agile Testing")])
    def test_automation_book_store(self, setupdriver, url, expected_text):
        """
        Round 3: Waiting
        """
        driver = setupdriver
        driver.get(url)
        search_bar = driver.find_element(by=By.ID, value="searchBar")
        search_bar.send_keys("testing")
        assert driver.find_element(by=By.XPATH, value=f"//h2[contains(., '{expected_text}')]").is_displayed()

    @pytest.mark.parametrize("url", ["https://kitchen.applitools.com/ingredients/alert"])
    def test_accept_alert(self, setupdriver, url):
        """
        Round 4: Accept Alerts
        """
        driver = setupdriver
        driver.get(url)
        alert_button = driver.find_element(by=By.ID, value="alert-button")
        alert_button.click()
        alert = driver.switch_to.alert
        alert.accept()

    @pytest.mark.parametrize("url", ["https://kitchen.applitools.com/ingredients/alert"])
    def test_dismiss_alert(self, setupdriver, url):
        """
        Round 5: Dismiss Alerts
        """
        driver = setupdriver
        driver.get(url)
        confirm_button = driver.find_element(by=By.ID, value="confirm-button")
        confirm_button.click()
        confirm = driver.switch_to.alert
        confirm.dismiss()

    @pytest.mark.parametrize("url", ["https://kitchen.applitools.com/ingredients/alert"])
    def test_prompt_accept(self, setupdriver, url):
        """
        Round 6: Answer Prompts
        """
        driver = setupdriver
        driver.get(url)
        prompt_button = driver.find_element(by=By.ID, value="prompt-button")
        prompt_button.click()
        prompt = driver.switch_to.alert
        prompt.accept()

    @pytest.mark.parametrize("url, expected_text",
                             [("https://kitchen.applitools.com/ingredients/links", "fruits-vegetables")])
    def test_nav_new_windows(self, setupdriver, url, expected_text):
        """
        Round 7: Navigation to New Windows
        """
        driver = setupdriver
        driver.get(url)
        kitchen_button = driver.find_element(by=By.ID, value="button-the-kitchen-table")
        kitchen_button.click()
        for handle in driver.window_handles:
            driver.switch_to.window(handle)
        assert driver.find_element(by=By.ID, value=expected_text)

    @pytest.mark.parametrize("url, expected_text",
                             [("https://kitchen.applitools.com/api/recipes", 200)])
    def test_api_requests(self, setupdriver, url, expected_text):
        """
        Round 8: API Requests
        """
        response = requests.head(url).status_code
        assert response == expected_text

