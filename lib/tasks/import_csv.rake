# lib/tasks/import_csv.rake
require 'csv'

namespace :import_csv do
  desc 'Import csv files to db'
    task olympic_data_2016: :environment do
      CSV.foreach('./data/olympic_data_2016.csv', headers: true) { |row| OlympicDatum.create! row.to_hash }
      puts "Created #{OlympicDatum.all.count} Olympic games records."
    end
end
