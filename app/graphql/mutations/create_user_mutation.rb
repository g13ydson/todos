module Mutations
  class CreateUserMutation < GraphQL::Schema::RelayClassicMutation
    graphql_name "userCreate"
    description "Create new user"

    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [Types::ErrorType], null: false

    def resolve(**args)
      result = Users::Create.call(params: args)

      if result.success?
        { user: result[:model], errors: [] }
      else
        { errors: ErrorsConverter.call(result["contract.default"]) }
      end
    end
  end
end
