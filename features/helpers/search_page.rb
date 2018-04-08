class SearchPage

  def initialize(url, browser)
    @driver=Selenium::WebDriver.for :"#{browser}"
    @driver.manage.window.maximize
    @driver.navigate.to url
  end

  def find_searchbox()
    return @driver.find_element(:name,'q')
  end

  def find_search_button()
    return @driver.find_element(:name,'btnK')
  end

  def display_result()
    return @driver.find_element(:id,'rhscol')
  end

  def close_browser()
    @driver.quit
  end
end