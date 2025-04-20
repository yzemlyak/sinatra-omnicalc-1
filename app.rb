require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:new_square_calc)
end 

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @min_num = params.fetch("user_min").to_f
  @max_num = params.fetch("user_max").to_f
  @the_result = rand(@min_num..@max_num).to_f
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("payment/results") do
  @apr_num = ((params.fetch("user_apr").to_f)/100)/12
  @loan_term = params.fetch("user_years").to_f * 12
  @present_value = params.fetch("user_pv").to_f
  @numerator = @apr_num * @present_value
  @denominator = 1 - ((1+@apr_num) ** (@loan_term * -1))
  @the_result = @numerator / @denominator
  erb(:payment_results)

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
