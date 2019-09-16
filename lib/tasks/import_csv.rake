# lib/tasks/import_csv.rake
require 'csv'

namespace :import_csv do
  desc 'Import csv files to db'
    task olympic_data_2016: :environment do
      CSV.foreach('./data/olympic_data_2016.csv', headers: true) do |row|
        OlympicDatum.create! row.to_hash
      end
      puts "Created #{OlympicDatum.all.count} Olympic games records."
    end

    task summer_olympics_2016: :environment do
      CSV.foreach('./data/olympic_data_2016.csv', headers: true) do |row|
        hash = row.to_hash
        olympian_hash = {}
        hash.each_pair do |key, value|
          if Olympian.has_attribute?(key)
            olympian_hash[key] = value
          end
        end
        Olympian.create(olympian_hash)
      end
      puts "Added #{Olympian.all.count} olympians to the olympians table in the database."
    end
end
