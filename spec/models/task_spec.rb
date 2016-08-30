require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'should matchers' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:body) }
  end

  describe '#finished?' do
    let(:user) { FactoryGirl.create(:user) }
    let(:unfinished_task) { FactoryGirl.create(:task, user: user) }
    let(:finished_task) { FactoryGirl.create(:finished_task, user: user) }

    it "unfinished is false" do
      expect(unfinished_task.finished?).to be false
    end

    it "finished is true" do
      expect(finished_task.finished?).to be true
    end
  end

  describe "when return a scope" do
    let(:user) { FactoryGirl.create(:user) }
    let(:unfinished_task) { FactoryGirl.create(:task, user: user) }
    let(:finished_task) { FactoryGirl.create(:finished_task, user: user) }

    it "finished" do
      expect(Task.finished).to eq [finished_task]
    end

    it "unfinished" do
      expect(Task.not_finished).to eq [unfinished_task]
    end
  end

  describe "when finish a task" do
    let(:user) { FactoryGirl.create(:user) }
    let(:unfinished_task) { FactoryGirl.create(:task, user: user) }

    it "create a new Tracker row" do
      unfinished_task.update finished: true
      expect(Tracking.count).to eq 1
    end
  end

end
