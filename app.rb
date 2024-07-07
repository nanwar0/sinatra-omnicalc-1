require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/:status") do
  if params.fetch("status")=="new"
    erb(:square_new)
  elsif params.fetch("status")=="results"
    @number = params.fetch("number").to_f
    @square = @number ** 2
    erb(:square_results)
  end
end

get("/square_root/:status") do
  if params.fetch("status")=="new"
    erb(:sqrt_new)
  elsif params.fetch("status")=="results"
    @number = params.fetch("number").to_f
    @sqrt = @number ** 0.5
    erb(:sqrt_results)
  end
end

get("/random/:status") do
  if params.fetch("status")=="new"
    erb(:random_new)
  elsif params.fetch("status")=="results"
    @minimum = params.fetch("user_min").to_f
    @maximum = params.fetch("user_max").to_f
    @result = rand(@minimum..@maximum)
    erb(:random_results)
  end
end

get("/payment/:status") do
  if params.fetch("status")=="new"
    erb(:payment_new)
  elsif params.fetch("status")=="results"
    @r = params.fetch("user_apr").to_f/100/12
    @n = params.fetch("user_years").to_f*12
    @pv = params.fetch("user_pv").to_f
    @p = (@r*@pv)/(1-(1+@r)**(-@n))
    erb(:payment_results)
  end
end
