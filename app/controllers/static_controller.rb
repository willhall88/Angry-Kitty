class StaticController < ApplicationController
  before_filter :disable_nav, only: [:landing_page]

  def landing_page
  end
end
