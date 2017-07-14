require 'bundler'
Bundler.require

conn = PGconn.open(dbname:'cinema')

get '/movies' do
	content_type :json
	res = conn.exec('SELECT id, name, main_actor, image_url, total_made FROM movies;')
	movies = []
	res.each do |movie|
		movies.push(movie)
	end
	movies.to_json
end

get 'movies/:id' do
	id = params[id]
	res = conn.exec('SELECT id, name, main_actor, image_url, total_made FROM movies WHERE id = #{id};')
	movie = res[0]
	movie.to_json
end

post '/movies' do
	new_movie = JSON.parse(request.body.read)
	name = new_movie["name"]
	main_actor = new_movie["main_actor"]
	image_url = new_movie["image_url"]
	total_made = new_movie["total_made"]
	conn.exec("INSERT INTO movies (name, main_actor, image_url, total_made) VALUES ('#{name}', '#{main_actor}', '#{image_url}', '#{total_made}');")
	"success"
end

patch '/movies:id' do
	id = params[:id]
	updated_movie = JSON.parse(request.body.read)
	name = udpated_movie["name"]
	main_actor = updated_movie["main_actor"]
	image_url = updated_movie["image_url"]
	total_made = updated_movie["total_made"]
	conn.exec("UPDATE movies SET name = '#{name}', main_actor = '#{main_actor}', image_url = '#{image_url}', total_made = '#{total_made}' WHERE id = #{id})")
	"success"
end

delete '/movies:id' do
	id = params[:id]
	conn.exec("DELETE FROM movies WHERE id = #{id};")
	"success"
end
