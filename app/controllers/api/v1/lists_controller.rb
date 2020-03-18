class Api::V1::ListsController < Api::V1::BaseController
  def show
    @list = List.find(params[:id])
  end
end
