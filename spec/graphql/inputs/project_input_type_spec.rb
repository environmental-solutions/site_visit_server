describe Inputs::ProjectInputType do

  let(:types) { GraphQL::Define::TypeDefiner.instance }

  it 'requires a name of type String' do
    expect(Inputs::ProjectInputType).to accept_arguments({name: !types.String})
  end

end
