json.ref_card do
  json.id @ref_card.id
  json.name @ref_card.right_name
  json.number @ref_card.number
  json.list_name @ref_card.list.name
  json.url @ref_card.right_url[0]
  json.url_version @ref_card.right_url[2]
  json.pokedex_number @ref_card.pokedex_number
  json.illustrator @ref_card.artist
end
