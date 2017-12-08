Inputs::ProjectInputType = GraphQL::InputObjectType.define do

  name "ProjectInputType"
  description "Properties for creating a Project"

  argument :name, !types.String do
    description "Name of the project."
  end

end

