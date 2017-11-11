Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # field :projects, !types[Types::Project] do
  #   resolve -> (obj, args, ctx) {
  #     Project.all
  #   }
  # end

  # queries are just represented as fields
  field :projects, !types[Types::ProjectType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Project.all }
  end

  field :sites, !types[Types::SiteType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Site.all }
  end

end
