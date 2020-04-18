require 'csv'



csv_text = File.read(Rails.root.join('lib', 'seeds', 'jap_blocs.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Bloc.find_by(en_name: row['en_name'], jap: row['jap'] )
  if b.blank?
    b = Bloc.new
    b.en_name = row['en_name']
    b.jap = row['jap']
    b.save
  end
end

puts "There are now #{Bloc.jap.count} rows in the transactions table"

=begin

csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  if List.find_by(fr_name: row['fr_name']).blank?
    l = List.new
    l.fr_name = row['fr_name']
    l.us_name = row['us_name']
    l.code = row['code']
    l.reved = row['reved']
    l.reved_name = row['reved_name']
    l.french = row['french']
    l.fr_release_date = row['fr_release_date']
    l.us_release_date = row['us_release_date']
    l.size = row['size']
    l.fr_logo_url = row['fr_logo_url']
    l.us_logo_url = row['us_logo_url']
    l.symbol_url = row['symbol_url']
    l.bloc = Bloc.find_by(fr_name: row['fr_name_bloc'])
    l.save
  end
  #puts "#{l.us_name} saved"
end




lists = [

  "pop1.csv", "pop2.csv", "pop3.csv", "pop4.csv", "pop5.csv", "pop6.csv", "pop7.csv", "pop8.csv", "pop9.csv",

  "bsetdebase.csv", "bjungle.csv", "bfossil.csv", "bbasesetdeux.csv", "bteamrocket.csv", "blegendarycollection.csv",

  "gymheroes.csv", "gymchallenge.csv",

  "neogenesis.csv", "neodiscovery.csv", "neorevelation.csv", "neodestiny.csv",

  "ecexpedition.csv", "ecaquapolis.csv", "ecskyridge.csv",

  "exrubissaphir.csv", "extempetedesable.csv", "exdragon.csv", "exlegendesoubliees.csv", "exteammagmateamaqua.csv",
  "exrougefeuvertfeuille.csv", "exteamrocketreturns.csv", "exdeoxys.csv", "exemeraude.csv", "exforcescachees.csv",
  "exespecedelta.csv", "excreateursdelegendes.csv", "exfantomesholon.csv", "exgardiensdecristal.csv",
  "exilesdesdragons.csv", "exgardiensdupouvoir.csv",

  "bpromos.csv", "dppromos.csv", "hspromos.csv", "nbpromos.csv","xypromos.csv", "slpromos.csv"

  #{}"diamantetperle.csv", "dptresorsmysterieux.csv", "dpmerveillessecretes.csv",
  #{}"dpduelsausommet.csv", "dpaubemajestueuse.csv", "dpeveildeslegendes.csv", "dptempete.csv",

  #{}"plbase.csv", "plrivauxemergeants.csv", "plvainqueurssupremes.csv", "plarceus.csv",

  #{}"heartgoldsoulsilver.csv", "hsunleashed.csv", "hsundaunted.csv", "hstriumphant.csv", "calloflegends.csv",

  #{}"noiretblanc.csv", "nbpouvoirsemergents.csv", "nbnoblesvictoires.csv", "nbdestineesfutures.csv",
  #{}"nbexplorateursobscurs.csv", "nbdragonsexaltes.csv","nbcoffredesdragons.csv", "nbfrontieresfranchies.csv", "nbtempeteplasma.csv",
  #{}"nbglaciationplasma.csv", "nbexplosionplasma.csv", "nblegendarytreasures.csv",


  #{}"xykalos.csv", "xybase.csv", "xyetincelles.csv", "xypoingsfurieux.csv", "xyvigueurspectrale.csv", "xyprimochoc.csv",
  #{}"xydoubledanger.csv", "xycielrugissant.csv", "xyoriginesantiques.csv", "xyimpulsionturbo.csv", "xyruptureturbo.csv",
  #{}"xygenerations.csv", "xyimpactdesdestins.csv", "xyoffensivevapeur.csv", "xyevolutions.csv",

  #{}"slbase.csv", "slgardiensascendants.csv", "slombresardentes.csv", "sllegendesbrillantes.csv", "slinvasioncarmin.csv",
  #{}"slultraprisme.csv", "sllumiereinterdite.csv", "sltempeteceleste.csv", "slmajestedesdragons.csv", "sltonnerreperdu.csv",
  #{}"slduodechoc.csv"

]

=end

# b = Bloc.new
# b.en_name = "Gym"
# b.jap = true
# b.save


# l = List.new
# l.en_name = "Leaders' Stadium"
# l.size = 96
# l.code = "gym1"
# l.promo = false
# l.jap_release = "October 24, 1998"
# l.bloc_id = 53
# l.save


# l = List.new
# l.en_name = "Challenge from the Darkness"
# l.size = 98
# l.code = "gym2"
# l.promo = false
# l.jap_release = "June 25, 1999"
# l.bloc_id = 53
# l.save



# csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists', "jgym1.csv"))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rf = RefCard.new
#   rf.rank = row['rank']
#   rf.rarety_type = row['rarety_type']
#   rf.ultra_type = row['ultra_type']
#   rf.fr_name = row['fr_name']
#   rf.en_name = row['en_name']
#   rf.super_type = row['super_type']
#   rf.energy_type = row['energy_type']
#   rf.pokedex_number = row['pokedex_number']
#   rf.artist = row['artist']
#   rf.list = List.find(217)
#   rf.save
# end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists', "jgym2.csv"))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rf = RefCard.new
#   rf.rank = row['rank']
#   rf.rarety_type = row['rarety_type']
#   rf.ultra_type = row['ultra_type']
#   rf.fr_name = row['fr_name']
#   rf.en_name = row['en_name']
#   rf.super_type = row['super_type']
#   rf.energy_type = EnergyType.find_by(us_name: row['energy_type'])
#   rf.pokedex_number = row['pokedex_number']
#   rf.artist = row['artist']
#   rf.list = List.find(218)
#   rf.save
# end


# puts "There are now #{RefCard.count} rows in the RefCard table"




# csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists', 'jgym1.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rank = row['rank']
#   url = row['jap_url']
#   Cloudinary::Uploader.upload("#{url}",
#   :public_id => "#{rank}", :folder => "jap_lists/visuals/Gym/gym1")
# end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists', 'jgym2.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   rank = row['rank']
#   url = row['jap_url']
#   Cloudinary::Uploader.upload("#{url}",
#   :public_id => "#{rank}", :folder => "jap_lists/visuals/Gym/gym2")
# end



#User.all.each do |user|
  #puts "#{user.first_name} : annonces - #{user.shop_cards.count} / recherches - #{user.search_cards.count}"
#end

  #Cloudinary::Uploader.upload("#{l.us_logo_url}",
  #:width => 320, :height => 100, :crop => :limit,
  #:public_id => "poknroll_#{l.code}_us_logo", :folder => "lists/us_logos")

  #Cloudinary::Uploader.upload("#{l.symbol_url}",
  #:width => 38, :height => 38, :crop => :limit,
  #:public_id => "poknroll_#{l.code}_symbol", :folder => "lists/symbols")

  #:format => "jpg"


#marie = User.create!(email: "marie@gmail.com", password: "mariepnr", first_name: "Marie", last_name: "Marquet")
#mattis = User.create!(email: "mattis@gmail.com", password: "mattispnr", first_name: "Mattis", last_name: "Brizard")
#isabelle = User.create!(email: "isabelle@gmail.com", password: "isabellepnr", first_name: "Isabelle", last_name: "Sirieix")
#thomas = User.create!(email: "thomas@gmail.com", password: "thomaspnr", first_name: "Thomas", last_name: "Morin")
#pierre = User.create!(email: "pierre@gmail.com", password: "pierrepnr", first_name: "Pierre", last_name: "Poignant")
#vincent = User.create!(email: "vincent@gmail.com", password: "vincentpnr", first_name: "Vincent", last_name: "Perrot")
#dominic = User.create!(email: "dominic@gmail.com", password: "dominicpnr", first_name: "Dominic", last_name: "Dearlove")

#anthony = User.create!(email: "anthony@gmail.com", password: "anthony2152pnr", first_name: "Anthony", last_name: "Descombes")
#tom = User.create!(email: "tom@gmail.com", password: "tom2153pnr", first_name: "Tom", last_name: "Barnabe")
#manon = User.create!(email: "manon@gmail.com", password: "manon2154pnr", first_name: "Manon", last_name: "Para")
#romain = User.create!(email: "romain@gmail.com", password: "romain2155pnr", first_name: "Romain", last_name: "Godignon")
#erwan = User.create!(email: "erwan@gmail.com", password: "erwan2156pnr", first_name: "Erwan", last_name: "Michel")
#leo = User.create!(email: "leo@gmail.com", password: "leo2157pnr", first_name: "Leo", last_name: "Lebeaugosse")
#alison = User.create!(email: "alison@gmail.com", password: "alison2158pnr", first_name: "Alison", last_name: "Lagnier")
#rodolphe = User.create!(email: "rodolphe@gmail.com", password: "rodolphe2159pnr", first_name: "Rodolphe", last_name: "Jn")
#gurwann = User.create!(email: "gurwann@gmail.com", password: "gurwann2160pnr", first_name: "Gurwann", last_name: "Alart")
#alicia = User.create!(email: "alicia@gmail.com", password: "alicia2161pnr", first_name: "Alicia", last_name: "Montaillé")
#raphaël = User.create!(email: "raphael@gmail.com", password: "raphael2162pnr", first_name: "Raphaël", last_name: "Candelaresi")
#benji = User.create!(email: "benji@gmail.com", password: "benji2163pnr", first_name: "Benji", last_name: "Szternblic")



