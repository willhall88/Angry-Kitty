FactoryGirl.define do
  factory :user do
      name 'Sroop'
      email 'sroop@sunar.com'
  	password '123456789'
  	password_confirmation '123456789'
  end

  # factory :user2 do
  #   email 'nico@sunar.com'
  #   password '123456789'
  #   password_confirmation '123456789'
  # end

  # factory :user3 do
  #   email 'apo@sunar.com'
  #   password '123456789'
  #   password_confirmation '123456789'
  # end

  # factory :user4 do
  #   email 'dan@sunar.com'
  #   password '123456789'
  #   password_confirmation '123456789'
  # end

  # factory :user5 do
  #   email 'will@sunar.com'
  #   password '123456789'
  #   password_confirmation '123456789'
  # end
end