SiteVisitServerSchema = GraphQL::Schema.define do

  mutation(Types::MutationType)
  query(Types::QueryType)

  resolve_type -> (object, ctx) {
    type_name = object.class.name
    Schema.types[type_name]
  }

end
