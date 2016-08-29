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

  def send_congratulation_email
    UserMailer.completed_task(self).deliver_now if self.finished?
  end

end
