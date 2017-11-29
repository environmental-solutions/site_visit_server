Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :createProject, !types[Types::ProjectType] do
    description "Create a project with a name and description"
    argument :project, ProjectInputType
    resolve ->(t, args, c) {
      puts "called create_project on server"
      Project.create!(args[:project])
    }
  end

end

ProjectInputType = GraphQL::InputObjectType.define do
  name "ProjectInputType"
  description "Properties for creating a Project"

  argument :name, !types.String do
    description "Name of the project."
  end

  argument :description, types.String do
    description "Description of the project."
  end
end
