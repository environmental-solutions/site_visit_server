Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :projects, !types[Types::Project] do
    resolve -> (obj, args, ctx) {
      Project.all
    }
  end

end
