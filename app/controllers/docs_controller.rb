class DocsController < ApplicationController

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
