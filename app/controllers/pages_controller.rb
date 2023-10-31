class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :emergency_form]

  def home
  end

  def emergency_form
  end
end
