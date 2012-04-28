namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_products
  end
end

def make_products
  20.times do |n|
    name  = "The Story of " + Faker::Name.name
    price = rand(1..100)
    description = Faker::Lorem.sentence(20)
    Product.create!(:name => name,
                 :price => price,
                 :description => description)
  end
end