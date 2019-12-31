module Types
  class ErrorType < BaseObject
    description "A readable error"

    field :messages, [String], null: false, description: "A description of the errors"
    field :path, [String], null: true, description: "Which input value this errors came from"
  end
end
