Types::SiteType = GraphQL::ObjectType.define do

  name 'Site'

  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String

end
