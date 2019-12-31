class ApplicationSchema < GraphQL::Schema
  include ::ErrorHandler

  mutation(Types::MutationType)
  # query(Types::QueryType)
end
