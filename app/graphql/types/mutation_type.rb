Types::MutationType = GraphQL::ObjectType.define do

  name "Mutation"

  field :signIn, field: AuthMutations::SignIn.field

  field :createProject, Types::ProjectType do
    description "Create a project with a name and description"
    argument :project, ProjectInputType
    resolve ->(t, args, c) {
      puts "called create_project on server"
      Project.create!(args[:project].to_h)
    }
  end

end

ProjectInputType = GraphQL::InputObjectType.define do
  name "ProjectInputType"
  description "Properties for creating a Project"

  argument :name, !types.String do
    description "Name of the project."
  end

end
