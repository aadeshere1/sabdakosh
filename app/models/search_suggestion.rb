class SearchSuggestion < ApplicationRecord
  def self.terms_for(prefix)
    suggestion = where("acry like ?", "#{prefix}_%")
    suggestion.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_acronyms
    Acronym.find_each do |a|
      index_term(a.acry)
      index_term(a.full_form)
      a.full_form.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |s|
      s.increment! :popularity
    end
  end

  def self.divbyzero
    2332/0
  end
end
