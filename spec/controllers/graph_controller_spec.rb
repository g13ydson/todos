require "rails_helper"

RSpec.describe GraphqlsController, type: :controller do
  describe "POST #create" do
    let(:mutation) do
      '
        mutation($name: String!, $email: String!) {
          userCreate(input: {
            name: $name,
            email: $email,
          }) {
            user {
              id,
              name,
              email
            },
            errors {
              messages,
              path
            }
          }
        }
      '
    end

    context "fail" do
      context "invalid params" do
        let(:variables) do
          {
            name:  "",
            email: "",
          }
        end

        before do
          post :create, params: { query: mutation, variables: variables }
        end

        it "has errors" do
          expect(response).to match_schema(CreateUserSchema::Error)
          expect(response).to be_ok
        end
      end
    end

    context "success" do
      let(:variables) do
        attributes_for(:user)
      end

      before { post :create, params: { query: mutation, variables: variables } }

      it "create session" do
        expect(response).to match_schema(CreateUserSchema::Success)
        expect(response).to be_ok
      end
    end
  end
end
