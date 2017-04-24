class CalculationsController < ApplicationController
    
    def flexible_square_5

        @user_num = params[:number].to_f
        
        @square = @user_num ** 2
        
        render("calculations/flexible_square_5.html.erb")
    end
    
    
    def flexible_square_root
        
        @user_num = params[:number].to_f
        
        @square_root = Math.sqrt(@user_num)
        
        render("calculations/flexible_square_root.html.erb")
    end
    
    def flexible_payment
        
        @year = params[:year].to_i
        
        @principal = params[:principal].to_i
        
        @interest = params[:interest].to_f/100
        
        monthly_payment_long = (@interest/100*@principal)/(1-(1+@interest/100)**-@year)
        
        @monthly_payment = monthly_payment_long.round(2)

        render("calculations/flexible_payment.html.erb")
    end
    
    def flexible_random
        
        @min = params[:min].to_i
        @max = params[:max].to_i
        @random = rand(@max-@min)+@min
        render("calculations/flexible_random.html.erb")
    end
    
    def square_form
        render("calculations/square_form.html.erb")
    end
    
    
    def square
    @user_num = params[:user_num].to_f
    render("calculations/square.html.erb")
    end
    
    def square_root_form
        render("calculations/square_root_form.html.erb")
    end
    
    def square_root
    @user_num = params[:user_num].to_f
    render("calculations/square_root.html.erb")
    end
    
    def payment_form
        render("calculations/payment_form.html.erb")
    end
    
    def payment
    @apr = params[:apr].to_f
    interest = @apr/100
    @years = params[:years].to_f
    @principal = params[:principal].to_f
    payment_long = (interest*@principal)/(1-(1+interest)**-@years)
    @payment = payment_long.round(2)
    render("calculations/payment.html.erb")
    end
end
