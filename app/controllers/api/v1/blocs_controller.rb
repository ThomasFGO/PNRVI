class Api::V1::BlocsController < Api::V1::BaseController
  def occi
    @occi_blocs = Bloc.occi.includes(:lists)
  end

  def jap
    @jap_blocs = Bloc.jap.includes(:lists)
  end
end
