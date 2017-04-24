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
        
        interest_long = params[:interest].to_f/100
        
        @interest = interest_long.round(2)
        
        monthly_interest = @interest/12/100
        
        months = @year*12
        
        monthly_payment_long = (monthly_interest*@principal)/(1-(1+monthly_interest)**-months)
        
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
    monthly_interest = @apr/100/12
    @years = params[:years].to_f
    months=@years*12
    @principal = params[:principal].to_f
    payment_long = (monthly_interest*@principal)/(1-(1+monthly_interest)**-months)
    @payment = payment_long.round(2)
    render("calculations/payment.html.erb")
    end
    
    def random_form
        render("calculations/random_form.html.erb")
    end
    
    def random
    @min = params[:min].to_f
    @max = params[:max].to_f
    @random =rand(@min...@max).round(4)
    #@random = rand(@max-@min)+@min
    render("calculations/random.html.erb")
    end
    
end
