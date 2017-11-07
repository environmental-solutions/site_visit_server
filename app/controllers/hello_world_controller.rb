class HelloWorldController < ApplicationController

  def index
    render :json => {foo: "bar"}
  end

end
