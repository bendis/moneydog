module ExpensesHelper
  
  def price_formatted(price)
    number_to_currency(price, :precision => 2, :unit => "Kč", :separator => ",", :delimiter => ".", :format => "%n %u")
  end

end
