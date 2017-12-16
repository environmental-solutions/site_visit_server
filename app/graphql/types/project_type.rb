Types::ProjectType = GraphQL::ObjectType.define do

  name('Project')

  interfaces [Types::ActiveRecordInterface]
  field :name, !types.String
  field :sites, types[Types::SiteType]

end
