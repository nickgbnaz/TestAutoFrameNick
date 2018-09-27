class BasePage


  def click_element(xpath, element_descripiton)
    begin
      page.find(:xpath, xpath).click
    rescue
      fail("Unable to click element [#{element_descripiton}] with xpath [#{xpath}]")
    end
  end
end