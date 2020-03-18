class Api::V1::RefCardsController < Api::V1::BaseController
  def show
    @ref_card = RefCard.find(params[:id])
  end
end
