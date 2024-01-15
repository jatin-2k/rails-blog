# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
BlogPost.create(title: 'First Post', body: 'This is the content of the first post.')
BlogPost.create(title: 'Second Post', body: 'Another post with some interesting content.')
BlogPost.create(title: 'Third Post', body: 'The third post is here, with more content.')