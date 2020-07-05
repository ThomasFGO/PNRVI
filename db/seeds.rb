require 'csv'



# csv_text = File.read(Rails.root.join('lib', 'seeds', 'jap_blocs.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   b = Bloc.find_by(jap: true, rank: row['rank'])
#   b.cl_name = row['cl_name']
#   b.save
# end

#puts "#{Bloc.occi.count} occi blocs saved"


# csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   l = List.new
#   l.bloc = Bloc.find_by(fr_name: row['fr_name_bloc'], jap: false)
#   l.fr_name = row['fr_name']
#   l.en_name = row['en_name']
#   l.rank = row['rank']
#   l.code = row['code']
#   l.promo = row['promo']
#   l.fr_release = row['fr_release_date']
#   l.us_release = row['us_release_date']
#   l.size = row['size']
#   l.us_logo_url = row['us_logo_url']
#   l.fr_logo_url = row['fr_logo_url']
#   l.symbol_url = row['symbol_url']
#   l.save
#   puts "#{List.occi.count} occi lists saved"
# end

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

lists = [ "base1", "base2", "base3", "base4", "base5", "base6", "basep" ]

#Création des cartes des séries occidentales
lists.each do |list|
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists', 'base', '#{list}.csv'))
  csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
  csv.each do |row|
    rf = RefCard.new
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
end

#Upload des séries occidentales sur Cloudinary

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists', 'e-card', 'ecard3.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rank = row['rank']
#   url = row['us_url']
#   unless url.nil?
#     Cloudinary::Uploader.upload("#{url}",
#     :public_id => "#{rank}",
#     :folder => "lists/visuals/E-Card/ecard3",
#     :format => "jpg")
#   end
# end

#Cloudinary::Uploader.upload("#{l.us_logo_url}",
#:width => 320, :height => 100, :crop => :limit,
#:public_id => "poknroll_#{l.code}_us_logo", :folder => "lists/us_logos")

#Cloudinary::Uploader.upload("#{l.symbol_url}",
#:width => 38, :height => 38, :crop => :limit,
#:public_id => "poknroll_#{l.code}_symbol", :folder => "lists/symbols")






