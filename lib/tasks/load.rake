namespace :load do

  task load_companies: :environment do
    Company.find_or_create_by(name: "Netflix", lat: 37.2571, lng: -121.96417)
    Company.find_or_create_by(name: "Square", lat: 37.77531, lng: -122.41743)
    Company.find_or_create_by(name: "Stripe", lat: 37.77325, lng: -122.40011)
    Company.find_or_create_by(name: "Facebook", lat: 37.48507, lng: -122.14742)
    Company.find_or_create_by(name: "Palantir", lat: 37.4426, lng: -122.16215)
    Company.find_or_create_by(name: "Uber", lat: 37.77568, lng: -122.41797)
    Company.find_or_create_by(name: "Dropbox", lat: 37.78105, lng: -122.39269)
    Company.find_or_create_by(name: "Checkr", lat: 37.78931, lng: -122.40235)
    Company.find_or_create_by(name: "AngelList", lat: 37.79675, lng: -122.40347)
    Company.find_or_create_by(name: "Coinbase", lat: 37.79004, lng: -122.40087)
    Company.find_or_create_by(name: "Hired", lat: 37.78539, lng: -122.39545)
    Company.find_or_create_by(name: "Zendesk", lat: 37.78174, lng: -122.41065)
  end

  desc "Load Schools From ./schools"
  task load_schools: :environment do
    i = 0
    Dir.entries(Rails.root.join("schools")).each do |entry|
      path = Rails.root.join("schools", entry)
      next if File.directory?(path)

      data = JSON.load(File.read(path))
      data["schools"].each do |school|
        s = School.find_or_initialize_by(gs_school_id: school["school_id"])
        s.update(
          gs_school_id: school["school_id"],
          region_id: school["region_id"],
          students_per_teacher: school["students_per_teacher"],
          grades: school["grades"],
          size: school["size"],
          name: school["name"],
          lng: school["location"][0],
          lat: school["location"][1],
          gs_rating: school["gs_rating"],
          school_type: school["type"],
          levels: school["level_codes"].join(","),
          elementary: school["level_codes"].include?("Elementary")
        )
      end
      i += 1
      puts "#{ i }#{ School.count }"
    end
  end
end
