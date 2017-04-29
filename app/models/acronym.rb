class Acronym < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      course_hash = row.to_hash
      course = find_or_create_by!(name: course_hash['name'], description: course_hash['description'], difficulty: course_hash['difficulty'],depth: course_hash['depth'], theoreticalness: course_hash['theoreticalness'], )
      course.update_attributes(course_hash)
    end
  end
end
