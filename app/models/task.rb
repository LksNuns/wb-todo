# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  finished   :boolean          default(FALSE), not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#

class Task < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  scope :finished, -> { where(finished: true).order(updated_at: :asc) }
  scope :not_finished, -> { where(finished: false).order(created_at: :asc) }

  after_save :send_congratulation_email

  def finished?
    self.finished
  end

  private

  def send_congratulation_email
    congrats = MailUtilCongratulations.random_congrats
    UserMailer.completed_task(self, congrats).deliver_later if self.finished?

    data = congrats.merge({ user: self.user.id, task: self.id, updated_at: self.updated_at })
    data = data.to_json
    Tracking.create(event: 'completed_task', data: data)

  end

end
