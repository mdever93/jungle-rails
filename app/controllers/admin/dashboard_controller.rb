class Admin::DashboardController < ApplicationController
  def show; end
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
end
