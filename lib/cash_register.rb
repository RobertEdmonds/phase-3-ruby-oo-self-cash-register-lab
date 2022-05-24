require 'pry'
class CashRegister
    attr_reader :quantity, :new_list
    attr_accessor :items, :total, :employee_discount, :void_last_transaction
    
    def initialize(employee_discount = 0)
        @total = 0
        @employee_discount = employee_discount
        @items = []
    end
    def discount
        self.employee_discount 
    end
    def add_item(item, amount, quantity = 1)
        new_amount = amount * quantity
        self.total += new_amount
        quantity.times do  
            self.items << item
        end
    end
    def apply_discount
        if self.employee_discount > 0
            minus_amount = self.total * self.employee_discount/100.00
            @total = self.total - minus_amount
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            self.total
            "There is no discount to apply."
        end
    end
    
end
a = CashRegister.new
