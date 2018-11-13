class ApplicationController < ActionController::Base

  rescue_from MsdApi::Exception::InvalidParameter, with: :invalid_parameter
  rescue_from ActionController::ParameterMissing, with: :invalid_parameter

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  private

  def invalid_parameter(exception)
    render_error_json(exception.message, :bad_request)
  end

  def record_not_found
    render_error_json(_('errors.record_not_found'), :bad_request)
  end

  def forbidden_access
    render_error_json(_('errors.forbidden'), :forbidden)
  end

  def render_error_json(message, status = :bad_request)
    render json: { error: message }, status: status
  end

end
