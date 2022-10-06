class PointsMailer < ApplicationMailer

    default from: 'quiniela@gmail.com'

    def points_email
        @points = params[:points]
        @to = params[:email]
        mail(to: @to, subject: "Puntos actuales en la quiniela")
    end

end
