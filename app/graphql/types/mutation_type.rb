Types::MutationType = GraphQL::ObjectType.define do

  name "Mutation"

  field :signIn, field: AuthMutations::SignIn.field

  field :createProject, Types::ProjectType do
    description "Create a project with a name and description"
    argument :project, Inputs::ProjectInputType
    resolve ->(t, args, c) {
      puts "called create_project on server"
      Project.create!(args[:project].to_h)
    }
  end

  field :signUp, field: UserMutations::SignUp.field

end
