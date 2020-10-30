json.id @list.id
json.name @list.name
json.size @list.size.to_i
if @list.occi?
  json.logo_url cl_image_path ("lists/fr_logos/poknroll_#{@list.code}_fr_logo.png")
  json.symbol_url cl_image_path ("lists/symbols/poknroll_#{@list.code}_symbol.png")
  json.secrets_count @list.secrets_count
  json.ref_cards @list.ref_cards do |ref_card|
    json.extract! ref_card, :id
    json.number ref_card.number
    json.name ref_card.right_name
    json.pokedex_number ref_card.pokedex_number
    json.url cl_image_path ("lists/visuals/#{@list.bloc.en_name}/#{@list.code}/#{ref_card.rank}")
  end
else
  json.symbol_url @list.symbol_url
  json.ref_cards @list.ref_cards.order(:rank) do |ref_card|
    json.extract! ref_card, :id
    json.number ref_card.number
    json.name ref_card.right_name
    json.pokedex_number ref_card.pokedex_number
    json.url cl_image_path ("jap_lists/visuals/#{@list.bloc.en_name}/#{@list.code}/#{ref_card.rank}")
  end
end
