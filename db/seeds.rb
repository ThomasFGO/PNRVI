require 'csv'



# csv_text = File.read(Rails.root.join('lib', 'seeds', 'jap_blocs.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   b = Bloc.find_by(jap: true, rank: row['rank'])
#   b.cl_name = row['cl_name']
#   b.save
# end

#puts "#{Bloc.occi.count} occi blocs saved"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  l = List.occi.find_by(code: row['code'])
  if l.nil?
    l = List.new
  end
  l.bloc = Bloc.find_by(fr_name: row['fr_name_bloc'], jap: false)
  l.fr_name = row['fr_name']
  l.en_name = row['en_name']
  l.rank = row['rank']
  l.code = row['code']
  l.promo = row['promo']
  l.fr_release = row['fr_release_date']
  l.us_release = row['us_release_date']
  l.size = row['size']
  l.us_logo_url = row['us_logo_url']
  l.fr_logo_url = row['fr_logo_url']
  l.symbol_url = row['symbol_url']
  l.save
end
puts "#{List.occi.count} séries occidentales mises à jour"

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   code = row['code']
#   symbol_url = row['symbol_url']
#   Cloudinary::Uploader.upload("#{symbol_url}",:public_id => "#{code}",:folder => "lists/symbols")
# end


#japlists.each do |japlist|
  # csv_text = File.read(Rails.root.join('lib', 'seeds', 'jap_lists', 'dp', 'dp1.csv'))
  # csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
  # csv.each do |row|
  #   rf = RefCard.new
  #   rf.list = List.jap.find_by(code: row['list'])
  #   rf.rank = row['rank']
  #   rf.rarety_type = row['rarety_type']
  #   rf.ultra_type = row['ultra_type']
  #   rf.fr_name = row['fr_name']
  #   rf.en_name = row['en_name']
  #   rf.super_type = row['super_type']
  #   rf.energy = row['energy']
  #   rf.pokedex_number = row['pokedex_number']
  #   rf.artist = row['artist']
  #   rf.save
  # end
# end
# puts "There are now #{RefCard.count} rows in the RefCard table"

blocs = {
  ex:[ "ex1", "ex2", "ex3", "ex4", "ex5", "ex6", "ex7", "ex8",
    "ex9", "ex10", "ex11", "ex12", "ex13", "ex14", "ex15", "ex16" ],
  xy:[ "xy0", "xy1", "xy2", "xy3", "xy4", "xy5","dc1", "xy6", "xy7",
    "xy8", "xy9","g1", "xy10", "xy11", "xy12" ],
  sl:[ "sm1", "sm2", "sm3", "sm35", "sm4", "sm5", "sm6", "sm7", "sm75",
    "sm8", "sm9", "sm10", "sm11", "sm115", "sm12" ],
  ss:[ "swsh1", "swsh2", "swsh3"]
}

#lists = ["ex1"]

#Création/Mise à jour des cartes des séries occidentales
blocs.each do |bloc, lists|
  lists.each do |list|
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists', "#{bloc}", list + '.csv'))
    csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
    list_id = List.occi.find_by(code: list)
    csv.each do |row|
      rf = RefCard.find_by(list_id: list_id, rank: row['rank'])
      if rf.nil?
        rf = RefCard.new
      end
      rf.list = List.occi.find_by(code: row['list'])
      rf.rank = row['rank']
      rf.number = row['number']
      rf.rarety_type = row['rarety_type']
      rf.ultra_type = row['ultra_type']
      rf.fr_name = row['fr_name']
      rf.en_name = row['en_name']
      rf.super_type = row['super_type']
      rf.energy = row['energy']
      rf.pokedex_number = row['pokedex_number']
      rf.artist = row['artist']
      rf.fr_url = row['fr_url']
      rf.us_url = row['us_url']
      rf.save
    end
    puts "#{list} ok"
  end
  puts "#{bloc} ok"
end

#Upload des séries occidentales sur Cloudinary

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists', 'sl', 'sm35.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rank = row['rank']
#   url = row['fr_url']
#   unless url.nil? && rank > 150
#     Cloudinary::Uploader.upload("#{url}",
#     :public_id => "#{rank}",
#     :folder => "lists/visuals/SM/sm35",
#     :format => "jpg")
#   end
# end

#Cloudinary::Uploader.upload("#{l.us_logo_url}",
#:width => 320, :height => 100, :crop => :limit,
#:public_id => "poknroll_#{l.code}_us_logo", :folder => "lists/us_logos")

#Cloudinary::Uploader.upload("#{l.symbol_url}",
#:width => 38, :height => 38, :crop => :limit,
#:public_id => "poknroll_#{l.code}_symbol", :folder => "lists/symbols")






