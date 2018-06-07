FactoryBot.define do
  factory :group do
    name "I fantastici 5"
    description "Mauris ac mauris semper purus sagittis tristique ac sed sapien. Aliquam sit amet urna vitae elit egestas lobortis. Curabitur venenatis neque dapibus ipsum pellentesque, sed euismod leo laoreet. Praesent consequat venenatis sagittis. Fusce tincidunt dapibus volutpat. Pellentesque condimentum metus quam, sed posuere quam fermentum ac. Mauris lectus nunc, dignissim eget luctus eu, sodales dapibus eros. Morbi vehicula cursus nisl, eu sagittis odio elementum ut. "
    logo {Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'illuminazione_stradale.png'), 'image/png')}
  end
end
