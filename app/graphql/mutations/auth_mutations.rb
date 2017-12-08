module AuthMutations

  SignIn = GraphQL::Relay::Mutation.define do
    name "signIn"
    description "SignIn"

    input_field :email, types.String
    input_field :password, types.String
    # argument :login, LoginInputType

    return_field :email, types.String
    return_field :token, types.String
    return_field :messages, types[FieldErrorType]

    resolve ->(obj, inputs, ctx) {
      puts "inputs: email: #{inputs[:email]} password: #{inputs[:password]}"
      user = User.find_by(email: inputs[:email])
      if user.present? && user.valid_password?(inputs[:password])
        # user.update_tracked_fields(ctx[:request])
        # session[:user_id] = user.id
        {
          token: user.token,
          email: user.email
        }
      else
        FieldError.error("Invalid email or password")
      end
    }
  end

  RevokeToken = GraphQL::Relay::Mutation.define do
    name "revokeToken"
    description "revoke token"
    return_field :messages, types[FieldErrorType]

    resolve(Auth.protect ->(obj, inputs, ctx) {
      ctx[:current_user].update(access_token: nil)
      {}
    })
  end

  LoginInputType = GraphQL::InputObjectType.define do
    name "LoginInputType"
    description "Login with email and password"
    argument :email, !types.String do
      description "Email"
    end
    argument :password, !types.String do
      description "Password"
    end
  end

end
