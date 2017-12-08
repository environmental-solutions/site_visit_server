Inputs::LoginInputType = GraphQL::InputObjectType.define do

  name "LoginInputType"
  description "Login with email and password"

  argument :email, !types.String do
    description "Email"
  end
  argument :password, !types.String do
    description "Password"
  end

end
