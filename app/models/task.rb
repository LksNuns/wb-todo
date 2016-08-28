# == Schema Information
#
# Table name: tasks
#
#  id       :integer          not null, primary key
#  body     :text             not null
#  finished :boolean          default(FALSE), not null
#  user_id  :integer
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#

class Task < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  scope :finished, -> { where(finished: true) }
  scope :not_finished, -> { where(finished: false) }

end
