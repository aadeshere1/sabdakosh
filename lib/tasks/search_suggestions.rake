namespace :search_suggestions do
  desc "Generate Search suggestions from products"
  task :index => :environment do
    SearchSuggestion.index_acronyms
  end
end
