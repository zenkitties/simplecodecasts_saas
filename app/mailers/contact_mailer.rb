class ContactMailer < ActionMailer::Base
    default to: 'nick@zenkitties.pw'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: name, subject: "Contact Form Message from #{name}")
    end
end