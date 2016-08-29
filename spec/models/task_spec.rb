require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'should matchers' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:body) }
  end

  describe 'methods' do
    user = FactoryGirl.create(:user)
    unfinished_task = FactoryGirl.create(:task, user: user)
    finished_task = FactoryGirl.create(:finished_task, user: user)

    it "method finished? to unfinished task" do
      expect(unfinished_task.finished?).to be false
    end

    it "method finished? to finished task" do
      expect(finished_task.finished?).to be true
    end
  end

end
