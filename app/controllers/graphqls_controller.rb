class GraphqlsController < ApplicationController
  def create
    run Graphql::Execute
    render json: @model
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")
    render json:   { error: { message: error.message, backtrace: error.backtrace }, data: {} },
           status: :internal_server_error
  end
end
