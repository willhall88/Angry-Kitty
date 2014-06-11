require 'rails_helper'
require_relative '../lib/tasks/scheduler'

include Capybara::Email::DSL

describe "Scheduler" do

  let(:user){ create( :user ) }
  let(:user2){ create( :user, email: 'will@test.com' ) }

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
      debt.last_harassed = DateTime.now - 0.4
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
    end

  
  end

  context 'days 30 down to 8' do

    it 'will send an email if the due date is between 1 week and 1 month' do
      @event.deadline = DateTime.now + 8
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 4
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if the last harassment email is within 3 days' do
     @event.deadline = DateTime.now + 30
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 3
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
    end
  

  end

  context 'days 60 down to 31' do
    
    it 'will send an email if the due date is between 1 month and 2 months' do
      @event.deadline = DateTime.now + 31
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 8
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if the last harassment email is within 7 days' do
      @event.deadline = DateTime.now + 60
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 7
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
    end
  end

  context 'days 61-120' do
    
    it 'will send an email if the due date is between 2 months and 4 months' do
      @event.deadline = DateTime.now + 61
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 15
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if the last harassment email is within 14 days' do
      @event.deadline = DateTime.now + 120
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 14
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
     end
  end

  context 'days 121+' do
    
    it 'will send an email if the due date is over 4 months' do
      @event.deadline = DateTime.now + 122
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 31
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if the last harassment email is within 30 days' do
      @event.deadline = DateTime.now + 122
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 30
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
    end
  end

  context 'last three days to deadline' do
    it 'will send an email if the due date less than three days' do
      @event.deadline = DateTime.now + 3
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 1
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq true
    end

    it 'will not send an email if the last harrassment was less than 8 hours ago' do
      @event.deadline = DateTime.now + 3
      @event.save
      @event.users << user2
      debt = Debt.find_by(user: user2, event: @event)
      debt.last_harassed = DateTime.now - 0.3
      debt.save
      expect(send_mail?(@event.deadline, Debt.first.last_harassed)).to eq false
    end
  end
end

describe 'accessing unpaid debts from database' do
  let(:user1){ create( :user ) }
  let(:user2){ create( :user, email: 'will@test.com'  ) }
  let(:user3){ create( :user, email: 'robin@test.com' ) }
  let(:user4){ create( :user, email: 'scott@test.com' ) }
  let(:user5){ create( :user, email: 'dan@test.com'   ) }
  let(:user6){ create( :user, email: 'nico@test.com'  ) }
  let(:user7){ create( :user, email: 'apo@test.com'   ) }

  before do 
    @event = Event.new(title: "birthday")
    @event.organiser = user1
    @event.deadline = DateTime.now + 5
    @event.save
    @event.users << [user2, user3, user4, user5, user6, user7]
  end

  it 'should only email the unpaid participants' do
    Debt.first(3).each do|debt|
      debt.paid = true
      debt.save
    end
    send_harassment
    open_email('apo@test.com')
    expect(current_email).to have_content('PAY ME!')
    open_email('nico@test.com')
    expect(current_email).to have_content('PAY ME!')
    open_email('dan@test.com')
    expect(current_email).to have_content('PAY ME!')
    expect(open_email('scott@test.com')).to eq(nil)
    # expect(select_debtors).to eq [user5.debts.first, user6.debts.first, user7.debts.first]
  end

  it 'unpaying people in multiple events can be emailed multiple times' do
    Debt.first(3).each do|debt|
      debt.last_harassed = DateTime.now - 1
      debt.save
    end
    event2 = Event.new(title: "diving")
    event2.organiser = user2
    event2.deadline = DateTime.now + 10
    event2.save
    event2.users << [user1, user3, user7]
    event2.debts.each do|debt|
      debt.last_harassed = DateTime.now - 4
      debt.save
    end
    send_harassment
    open_email('dan@test.com')
    expect(current_email).to have_content('PAY ME!')
    open_email('nico@test.com')
    expect(current_email).to have_content('PAY ME!')
    open_email('sroop@sunar.com')
    expect(current_email).to have_content('PAY ME!')
    open_email('robin@test.com')
    expect(current_email).to have_content('PAY ME!')
    emails_sent_to('apo@test.com')
    expect(current_emails.first).to have_content 'birthday'
    expect(current_emails.last).to have_content 'diving'
  end



end

describe 'updating database' do

  let(:user1){ create( :user, email: 'nico@test.com'  ) }
  let(:user2){ create( :user, email: 'sroop@test.com' ) }
  let(:user3){ create( :user, email: 'will@test.com'  ) }

  before do 
    @event = Event.new(title: "Nico´s Birthday Bash Xtreme")
    @event.organiser = user1
    @event.deadline = DateTime.now + 5
    @event.save
    @event.users << [user3, user2]
  end

  it 'writes last harassment into debt table' do
    send_harassment
    debt = @event.debts.first
    expect(debt.last_harassed).not_to be_blank
  end
end
