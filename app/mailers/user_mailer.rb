class UserMailer < ApplicationMailer
    default from: 'no-reply@eventcodr.fr'

    def welcome_email(user)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = user 

        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'https://secret-harbor-58504.herokuapp.com/login' 

        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def attendance_email(attendance)

        @attendance = attendance
        @user = attendance.user
        @event = attendance.event
        

        @url  = 'https://secret-harbor-58504.herokuapp.com/login'
        
        #envoie la confimation de l'inscription à l'évènement
        mail(to: @user.email, subject: 'Vous êtes bien inscrit !!')
    end
end
