json.array! @occi_blocs do |bloc|
  json.name bloc.fr_name
  json.series bloc.lists.order(rank: :desc) do |list|
    json.id list.id
    json.name list.name
    json.logo_url cl_image_path ("lists/fr_logos/#{list.code}")
    json.symbol_url cl_image_path ("lists/symbols/#{list.code}")
  end
end

