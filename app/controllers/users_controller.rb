class UsersController < ApplicationController
    def initialize
        @users = User.find(1,2)
    end

    def show
    end
end
