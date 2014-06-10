require 'rails_helper'
require_relative '../lib/tasks/scheduler'

describe "Scheduler" do

  let(:user){ create( :user ) }
  let(:user2){ build( :user, email: 'will@test.com' ) }

  before do 
    @event = Event.new
    @event.organiser = user
  end

  context 'when last_harassed date is nil' do

    it 'will send an email if last harrassment date is nil' do
      @event.deadline = DateTime.now + 4
      @event.save
      @event.users << user2
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

  end

  context 'days 7 down to 4' do

    it 'will send an email if the due date more than 3 days away' do
      @event.deadline = DateTime.now + 4
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 2
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will send an email if the due date is less than or equal to 7 days away' do
      @event.deadline = DateTime.now + 7
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 2
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if last harassed date is less than 1 day before' do
      @event.deadline = DateTime.now + 7
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 0.5
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false

    end

  
  end

  # context 'days 30 down to 8' do

  #   it 'will send an email if the due date is between 1 week and 1 month' do
  #     user = double :user, maturity: 8, last_harassed: 4
  #     expect(send_mail?(user)).to eq true

  #     @event.deadline = 7.days.from_now
  #     @event.save
  #     @event.users << user2
  #     debt = Debt.find_by(user: user2, event: @event)
  #     debt.last_harassed = 2.days.ago

  #   end

    # it 'will not send an email if the last harassment email is within 3 days' do
    #   user = double :user, maturity: 25, last_harassed: 2 
    #   expect(send_mail?(user)).to eq false
    # end
  # end

  # context 'days 60 down to 31' do
    
  #   it 'will send an email if the due date is between 1 month and 2 months' do
  #     user = double :user, maturity: 59, last_harassed: 8
  #     expect(send_mail?(user)).to eq true
  #   end

  #   it 'will not send an email if the last harassment email is within 7 days' do
  #     user = double :user, maturity: 59, last_harassed: 5 
  #     expect(send_mail?(user)).to eq false
  #   end
  # end

  # context 'days 61-120' do
    
  #   it 'will send an email if the due date is between 2 months and 4 months' do
  #     user = double :user, maturity: 118, last_harassed: 16
  #     expect(send_mail?(user)).to eq true
  #   end

  #   it 'will not send an email if the last harassment email is within 14 days' do
  #     user = double :user, maturity: 118, last_harassed: 13 
  #     expect(send_mail?(user)).to eq false
  #   end
  # end

  # context 'days 121+' do
    
  # it 'will send an email if the due date is over 4 months' do
  #     user = double :user, maturity: 125, last_harassed: 32
  #     expect(send_mail?(user)).to eq true
  #   end

  # it 'will not send an email if the last harassment email is within 30 days' do
  #     user = double :user, maturity: 125, last_harassed: 29 
  #     expect(send_mail?(user)).to eq false
  #   end
  # end
end