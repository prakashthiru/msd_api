class DocsController < ApplicationController

  # skip_before_action :authenticate_user!

  def index
    render layout: false
  end

  def welcome
    render layout: false
  end

  def health_check
    head :ok
  end

end
