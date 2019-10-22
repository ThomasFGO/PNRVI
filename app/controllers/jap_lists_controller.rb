class JapListsController < ApplicationController
  def index
    @jap_blocs = Bloc.where(jap: true)
  end
end
