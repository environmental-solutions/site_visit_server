describe Types::ProjectType do

  let(:types) { GraphQL::Define::TypeDefiner.instance }

  it 'defines a field of name of type String!' do
    expect(Types::ProjectType).to have_a_field(:name).that_returns('String!')
    expect(Types::ProjectType).to have_a_field(:name).that_returns(!types.String)
  end

  it 'should support the active record interface' do
    expect(Types::ProjectType).to implement(Types::ActiveRecordInterface)
  end

  describe 'sites' do
    subject { Types::ProjectType.fields['sites'] }
    it { is_expected.to be_of_type([Types::SiteType]) }

  end

end
