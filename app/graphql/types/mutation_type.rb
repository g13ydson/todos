module Types
  class MutationType < Types::BaseObject
    field :userCreate, mutation: Mutations::CreateUserMutation
  end
end
