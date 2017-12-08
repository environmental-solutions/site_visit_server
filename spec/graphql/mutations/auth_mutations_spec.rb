describe AuthMutations do

  let(:types) { GraphQL::Define::TypeDefiner.instance }

  describe AuthMutations::SignIn do

    it 'requires an email and password' do
      expect(AuthMutations::SignIn).to have_an_input_field(:email).of_type(!types.String)

      expect(AuthMutations::SignIn).to have_an_input_field(:password).of_type(!types.String)
    end

    it 'returns a token' do
      expect(AuthMutations::SignIn).to have_a_return_field(:token).of_type(types.String)
    end
  end

end
