class CalculatePointsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.all
    users.each do |user|
      points = 0
      user_predictions = Prediction.where(user: user)
      user_predictions.each do |prediction|
        points = points + prediction.points
      end
      user.points = points
      user.save
    end
  end

end
