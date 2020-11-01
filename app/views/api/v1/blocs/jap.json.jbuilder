json.array! @jap_blocs do |bloc|
  json.name bloc.en_name
  json.series bloc.lists.order(rank: :desc) do |list|
    json.id list.id
    json.name list.en_name
    json.symbol_url cl_image_path ("jap_lists/symbols/#{list.code}")
  end
end
