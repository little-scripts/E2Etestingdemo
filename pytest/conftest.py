"""
Configuration / Settings pytest
"""

import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


# ----------------------------------------------------------------
# Parser
# ----------------------------------------------------------------
def pytest_addoption(parser):
    """
    Parser.
    """
    parser.addoption("--env", action="store", default="dev", help="Environment to run tests (e.g., dev, stage, prod)")
    parser.addoption("--browser", action="store", default="chrome",
                     help="Browser to use for testing (e.g., chrome, firefox)")
    parser.addoption("--headless", action="store_true", default=False, help="Run tests in headless mode")


# ----------------------------------------------------------------
# Fixtures
# ----------------------------------------------------------------
@pytest.fixture(scope="session")
def setupdriver(request):
    """
    Fixture driver browser.
    """
    headless = request.config.getoption("--headless")
    if headless:
        options = Options()
        options.add_argument("--headless")
        options.add_argument("--window-size=1920,1080")
        driver = webdriver.Chrome(options=options)
    else:
        driver = webdriver.Chrome()
        driver.maximize_window()
    driver.implicitly_wait(10)
    yield driver
    driver.quit()

