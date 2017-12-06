class GraphqlController < ApplicationController

  before_action :authenticate

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = SiteVisitServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  def current_user
    # get token and compare to current user token
    current_token = "foo"
    puts "checking current user out of #{User.all.count} users".red
    @current_user = User.where("token = ?", current_token).first
  end

  def authenticate
    unless current_user
      render(
        json: {
          message: 'Update Failed'
        },
        status: :unauthorized
      )
    end
  end

  def authenticate_fail
    render(
      json: {
        message: 'Update Failed'
      },
      status: :unauthorized
    )
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to root_url, alert: "Not authorized."
    end
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

end
