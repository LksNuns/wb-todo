require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  describe 'completed_task' do
    let(:user) { FactoryGirl.create(:user) }
    let(:task) { FactoryGirl.create(:task, user: user) }
    let(:mail) { described_class.completed_task(task, { message: "teste", color: "teste"}).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eql('Completed Task')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@wptodo.com'])
    end

  end

end
