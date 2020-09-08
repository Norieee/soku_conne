class QasController < ApplicationController
  def index
    @qas = Qa.all
  end

  def new
  end

  def import
    Qa.import(params[:file])
    redirect_to qas_path
  end

  def export
    @qas = Qa.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="QA_lists"'+ Time.zone.now.strftime('%Y%m%d%H%M%S') + '.xlsx'
      }
    end
  end
end
