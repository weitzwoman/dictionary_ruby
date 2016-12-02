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

get('/word_list') do
  @words = Word.all()
  erb(:word_list)
end

get('/word_list/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word_page)
end

get('/word_list/:id/definition_form') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition_form)
end

post('/new_definition') do
  @word = Word.find(params.fetch('definition_id').to_i)
  @new_definition = Definition.new({:definition => params.fetch('definition')})
  @new_definition.save()
  @word.add_definition(@new_definition)
  erb(:success_definition)
end
