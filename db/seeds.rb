require 'csv'



csv_text = File.read(Rails.root.join('lib', 'seeds', 'blocs.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Bloc.new
  b.rank = row['rank']
  b.fr_name = row['fr_name']
  b.en_name = row['en_name']
  b.jap = row['jap']
  b.save
end

puts "#{Bloc.occi.count} occi blocs saved"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  l = List.new
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
  puts "#{List.occi.count} occi lists saved"
end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'occi_lists.csv'))
# csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   code = row['code']
#   symbol_url = row['symbol_url']
#   Cloudinary::Uploader.upload("#{symbol_url}",:public_id => "#{code}",:folder => "lists/symbols")
# end


=begin


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

# japlists = [
#   "l1a.csv", "l1b.csv", "ll.csv", "l2.csv", "l3.csv"
# ]

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




csv_text = File.read(Rails.root.join('lib', 'seeds', 'jap_lists', 'dp', 'dp1.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  rank = row['rank']
  url = row['jap_url']
  Cloudinary::Uploader.upload("#{url}",
  :public_id => "#{rank}",
  :folder => "jap_lists/visuals/DP/dp1",
  :format => "jpg")
end

#Cloudinary::Uploader.upload("#{l.us_logo_url}",
#:width => 320, :height => 100, :crop => :limit,
#:public_id => "poknroll_#{l.code}_us_logo", :folder => "lists/us_logos")

#Cloudinary::Uploader.upload("#{l.symbol_url}",
#:width => 38, :height => 38, :crop => :limit,
#:public_id => "poknroll_#{l.code}_symbol", :folder => "lists/symbols")






