class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = current_user
        @bookings = @user.bookings
        @tools = @user.tools
    end
end
