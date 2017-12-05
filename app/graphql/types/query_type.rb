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

  field :users, !types[Types::UserType] do
    description "Current user"
    resolve -> (obj, args, ctx) { User.all }
    # resolve ->(obj, args, ctx) {
    #   ctx[:current_user]
    # }
  end

  field :currentUser, Types::UserType do
    description 'fetch the current user.'
    resolve ->(object, args, ctx){
      ctx[:current_user]
    }
  end

end
