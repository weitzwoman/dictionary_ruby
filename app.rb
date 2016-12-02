require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')

get('/') do
  erb(:index)
end

get('/word_form') do
  erb(:word_form)
end

post('/new_word') do
  new_word = Word.new({:word => params.fetch("word")})
  new_word.save()
  @words = Word.all()
  erb(:success)
end
