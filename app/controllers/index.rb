get "/" do
  redirect "/stations/hot"
end

get "/stations" do
  @stations = Station.all

  erb :"stations/index"
end

get "/stations/hot" do
  @stations = Station.all.select(&:hot?)

  erb :"stations/hot"
end

get "/stations/:id" do
  @station = Station.find(params[:id])
  erb :"stations/show"
end