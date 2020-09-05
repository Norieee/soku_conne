class QasController < ApplicationController
  def index
  end

  def new
  end

  def import
    Qa.import(params[:file])
    redirect_to qas_path
  end
end
