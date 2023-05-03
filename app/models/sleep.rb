class Sleep < ApplicationRecord
  belongs_to :user

  # I am customizing the 'as_json' method so that I can just call the as_json method in my controller and it will do all of my date/time/duration formatting so that I don't need to do it in the frontend

   def as_json(options = {})
    {
      id: self.id,
      user_id: self.user_id,
      asleep: self.asleep.strftime("%I:%M %p"),
      awake: self.awake.strftime("%I:%M %p"),
      date: self.date.strftime("%B %e, %Y"),
      duration: self.calculate_duration(self.asleep, self.awake)
    }
  end

  def calculate_duration(asleep, awake)
   if ((awake-asleep)/3600).round < 0
    24 + ((awake-asleep)/3600).round
   else
    ((awake-asleep)/3600).round
   end

  end
end 