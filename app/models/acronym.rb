class Acronym < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      course_hash = row.to_hash
      course = find_or_create_by!(acry: course_hash['acry'], full_form: course_hash['full_form'], definition: course_hash['definition'], )
      course.update_attributes(course_hash)
    end
  end
end
