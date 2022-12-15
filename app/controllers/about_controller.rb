
class AboutController < ApplicationController
  def show
    # Define the content of the About Us page as instance variables
    @company_name = "Our Company"
    @founded_date = "2009"
    @mission_statement = "Our mission is to improve the lives of our customers by offering innovative, affordable solutions to their everyday needs. We are committed to delivering the highest level of service and ensuring that our products meet the highest standards of quality."
    @products = "We offer a wide range of products, from household essentials to electronics and beyond. Our team is constantly working to bring new, exciting products to the market and improve upon our existing offerings."
    @contact_info = "Phone: 555-555-5555     |    Email: info@ourcompany.com    |    Address: 123 Main St, Anytown, USA"
  end
end
