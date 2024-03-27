require 'csv'
class Admin::TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def import
    Test.import(params[:file])
    redirect_to root_url # notice: 'tests imported.'
  end
end
