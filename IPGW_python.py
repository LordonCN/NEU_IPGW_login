from selenium import webdriver
import time
import datetime

if __name__ == "__main__":
    while(1):
        driver = webdriver.Chrome(executable_path=r'C:\Users\Zion Wu\Desktop\python\chromedriver.exe')
        # 窗体最大化
        # driver.maximize_window()
        url = 'https://ipgw.neu.edu.cn/srun_cas.php?ac_id=1'
        driver.get(url)
        # driver.implicitly_wait(2)
        time.sleep(3)
        # 输入账号密码
        driver.find_element_by_id("un").send_keys("username")
        driver.find_element_by_id("pd").send_keys("password")
        # 可以实现点击
        driver.find_element_by_xpath('//*[@class="landing_btn_bg"]').click()
        time.sleep(2)
        driver.close()
        time.sleep(108000)#重连等待










