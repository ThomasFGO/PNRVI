class Api::V1::BlocsController < Api::V1::BaseController
  def index
    @occi_blocs = Bloc.where(jap: false)
  end
end
