module Api
  module V1
  	class HomeController < ApplicationController
      def index
    	render :index, status: 202
      end
    end
  end
end