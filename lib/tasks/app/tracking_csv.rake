require("csv")
require("json")
require("time")

namespace :app do
  desc "Generate a CSV of tracking table"
  task tracking_csv: :environment do

  filename = "./tmp/csv/#{Time.now.strftime("%Y%m%d%H%M%S")}_tracking_completed_tasks.csv"

  Dir.mkdir("./tmp/csv") unless File.exists?("./tmp/csv")
  puts Tracking.first.data["user"]
  CSV.open(filename, "wb") do |csv|
    csv << ["user", "task", "message", "color", "completed_at"]
    Tracking.all.each do |log|
      data = JSON.parse(log.data)
      csv << [data["user"], data["task"], data["message"], data["color"], data["updated_at"]]
    end
  end

  puts "Report generated at tmp/csv/#{Time.now.strftime("%Y%m%d%H%M%S")}_tracking_completed_tasks.csv"

  end
end
