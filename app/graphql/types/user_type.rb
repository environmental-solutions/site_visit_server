Types::UserType = GraphQL::ObjectType.define do

  name "User"
  description "A user"

  interfaces [Types::ActiveRecordInterface]
  field :email, !types.String

end
