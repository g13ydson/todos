module Types
  class UserType < BaseObject
    description "A user"

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
