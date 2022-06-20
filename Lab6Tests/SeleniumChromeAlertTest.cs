using System;
using System.Collections.Generic;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Lab6Tests
{
  [TestClass()]
  public class SeleniumChromeAlertTest
  {
    IWebDriver driver;

    [TestInitialize]
    public void initWebDriverTest()
    {
      driver = new ChromeDriver();
      Assert.IsNotNull(driver);
      driver.Url = "https://localhost:44341/Default";
    }

    [TestMethod]
    public void testAlertWindowNotExist()
    {
      // country == italy 
      driver.FindElement(By.Id("ContentPlaceHolder1_GridView1_lbSelect_1")).Click();    // trigger click event 
      IAlert alert = null;
      try
      {
        alert = driver.SwitchTo().Alert();
      } catch(Exception)
      {
        Assert.IsNull(alert);
      }
    }

    [TestMethod]
    public void testAlertWindowExist()
    {
      // country == russia
      driver.FindElement(By.Id("ContentPlaceHolder1_GridView1_lbSelect_0")).Click();    // trigger click event so that alert window will appear  
      IAlert alert = driver.SwitchTo().Alert();
      Assert.IsNotNull(alert);
      if (alert != null)
      {
        Assert.AreEqual(alert.Text, "russian warship, go f*ck yourself! No products from russia allowed");
        alert.Accept(); // close alert 
      }
    }

    [TestCleanup]
    public void uninitWebDriverTest()
    {
      driver.Close();
    }
  }
}
