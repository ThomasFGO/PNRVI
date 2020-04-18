json.array! @jap_blocs.order(:rank) do |bloc|
  json.name bloc.en_name
  json.series bloc.lists.order(:rank) do |list|
    json.id list.id
    json.name list.en_name
    json.symbol_url list.symbol_url
  end
end
