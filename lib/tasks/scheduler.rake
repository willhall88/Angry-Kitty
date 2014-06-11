require_relative 'scheduler'

namespace :scheduler do
  desc "Sending out scheduled harassment emails"
  task send_harassments: :environment do
  	send_harassment
  end

end
