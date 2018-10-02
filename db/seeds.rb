# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Bloc.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'blocs.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Bloc.new
  b.fr_name = row['fr_name']
  b.save
  #puts "#{b.fr_name} saved"
end

#puts "There are now #{Bloc.count} rows in the transactions table"

List.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  l = List.new
  l.fr_name = row['fr_name']
  l.us_name = row['us_name']
  l.fr_release_date = row['fr_release_date']
  l.us_release_date = row['us_release_date']
  l.size = row['size']
  l.fr_logo_url = row['fr_logo_url']
  l.us_logo_url = row['us_logo_url']
  l.symbol_url = row['symbol_url']
  l.bloc = Bloc.find_by(fr_name: row['fr_name_bloc'])
  l.save
  #puts "#{l.us_name} saved"
end

#puts "There are now #{List.count} rows in the transactions table"

EnergyType.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'energy_types.csv'))
csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
csv.each do |row|
  e = EnergyType.new
  e.fr_name = row['fr_name']
  e.us_name = row['us_name']
  e.symbol_url = row['symbol_url']
  e.save
  #puts "#{e.fr_name} saved"
end

#puts "There are now #{EnergyType.count} rows in the EnergyType table"


RefCard.destroy_all

lists = ["xy7.csv", "diamantetperle.csv", "setdebase.csv"]

lists.each do |list|
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'lists', "#{list}"))
  csv = CSV.parse(csv_text, col_sep: ';', headers: :first_row, :encoding => 'ISO-8859-1')
  csv.each do |row|
    rf = RefCard.new
    rf.number = row['number']
    rf.rarety_type = row['rarety_type']
    rf.ultra_type = row['ultra_type']
    rf.fr_name = row['fr_name']
    rf.us_name = row['us_name']
    rf.super_type = row['super_type']
    rf.energy_type = EnergyType.find_by(us_name: row['energy_type'])
    rf.pokedex_number = row['pokedex_number']
    rf.artist = row['artist']
    rf.fr_url = row['fr_url']
    rf.fr_r_url = row['fr_r_url']
    rf.us_url = row['us_url']
    rf.us_r_url = row['us_r_url']
    rf.list = List.find_by(us_name: row['list'])
    rf.save

    #puts "#{rf.number} - #{rf.fr_name} saved"
  end
end

puts "There are now #{RefCard.count} rows in the RefCard table"



