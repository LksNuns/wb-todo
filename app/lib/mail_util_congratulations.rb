class MailUtilCongratulations

  @messages = [
    "It's done...",
    "Reducing tasks. You ended another.",
    "One less. Keep it up.",
    "You did it. Great job.",
    "Who said no?! Task completed."
  ]

  @colors = [
    "#ff0000",
    "#fff400",
    "#00a903",
    "#0050a9",
    "#9f00a9"
  ]

  def self.random_congrats
    { message: @messages.sample, color: @colors.sample }
  end

end
