json.blocs do
  json.array! @occi_blocs do |bloc|
    json.name bloc.fr_name
    json.séries bloc.lists do |list|
      json.id list.id
      json.name list.name
      json.logo_url cl_image_path ("lists/fr_logos/poknroll_#{list.code}_fr_logo.png")
      json.symbol_url cl_image_path ("lists/symbols/poknroll_#{list.code}_symbol.png")
    end
  end
end
