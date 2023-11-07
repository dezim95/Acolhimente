class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :emergency_form, :loading_page]

  def home
  end

  def emergency_form
  end

  def loading_page
  end
end
