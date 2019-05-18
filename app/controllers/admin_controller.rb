class AdminController < ApplicationController
    def admin
         @all_orders = Order.where(canceled: false)
         @order = Order.find_by_id(1)
    end
     
    def edit_order
    end
    
    def update_order    
        @order_up = Order.find params[:order][:id]
        @order_up.update(sent_date: params[:order][:sent_date])
        @order_up.update(delivered_date: params[:order][:delivered_date])
         sent_month = @order_up.sent_date[0...2].to_i
        puts "**************"
        puts @order_up.filter_freq
        puts "***************"
        sent_year = @order_up.sent_date[6...10].to_i
        next_month = sent_month + @order_up.filter_freq
        if(next_month > 12) then
          next_month = next_month - 12
          sent_year = sent_year + 1
        end
        
        if(next_month < 10) then
          next_ship_str = "0" + next_month.to_s + @order_up.sent_date[2...6] + sent_year.to_s
        else
          next_ship_str = next_month.to_s + @order_up.sent_date[2...6] + sent_year.to_s
        end
         @order_up.update(next_ship_date: next_ship_str)
        redirect_to admin_path
    end
end
