json.blocs do
  json.array! @occi_blocs do |bloc|
    json.extract! bloc, :fr_name
    json.lists bloc.lists do |list|
      json.id list.id
      json.logo_url cl_image_path ("lists/fr_logos/poknroll_#{list.code}_fr_logo.png")
      json.symbol_url cl_image_path ("lists/symbols/poknroll_#{list.code}_symbol.png")
    end
  end
end
