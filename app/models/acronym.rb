class Acronym < ApplicationRecord
  require 'wikipedia'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      course_hash = row.to_hash
      course = find_or_create_by!(acry: course_hash['acry'], full_form: course_hash['full_form'], definition: course_hash['definition'], )
      course.update_attributes(course_hash)
    end
  end

  def self.search(search)
    # where("name ILIKE ? OR description ILIKE ? ", "%#{search}%", "%#{search}%")
    if search
      where('acry LIKE ? OR full_form LIKE ? ', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def self.get_wiki(search)
    Wikipedia.find(search)
  end
end
