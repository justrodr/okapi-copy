class SubscriptionMailer < ApplicationMailer
    
    def remind_email(user, property)
        @user = user
        @property = property
        mail(to: @user.email, subject: 'Subscription About to Expire') do |format|
            format.html { render layout: 'remind_email' }
            #format.text 
        end
    end
    def send_confirmation(user)
        @user = user
        mail(to: @user.email, subject: 'Subscription Confirmed')
    end
end
