class StaticPagesController < ApplicationController
	require 'github_api/client/search.rb'
  def home
  	@link = params[:search].to_s
	
  end

  def help
  	@link = params[:search].to_s
  	git = Github.new oauth_token: 'b20678c91741a480626031f22fb505d60038c8b8'
	@link = @link.to_s
	@link = @link.split("/")
	user = @link[3].to_s
	repo = @link[4].to_s
	########################
	#calculating time variables for before 7 days and 12 hours 
	########################
	time_now = Time.now-19800 #time for uct
	time_7_days = time_now-7.days
	time_1_day = time_now-1.day
	###############################
	#all time open issues
	###############################
	#querry = "repo: "+user+"/"+repo+", state: open"
	querry = "type:issue repo:"+user+"/"+repo+" state:open"
	issues = git.search.issues querry
	@num_open = issues.total_count
	#################################
	#open since 7 days
	#################################

	time_7_days = time_7_days.to_s.split(" ")
	time_7_days = time_7_days[0]+"T"+time_7_days[1]+"Z"
	querry = "type:issue repo:"+user+"/"+repo+" state:open created:>="+time_7_days
	issues = git.search.issues querry
	@num_7_days = issues.total_count #open before 7 days
	#################################
	#open since 24 hours 
	#################################

	time_1_day = time_1_day.to_s.split(" ")
	time_1_day = time_1_day[0]+"T"+time_1_day[1]+"Z"
	querry = "type:issue repo:"+user+"/"+repo+" state:open created:>="+time_1_day
	issues = git.search.issues querry
	@num_24_hours = issues.total_count
	###########################
	 #open between 7 days and 24 hours 
	#@num_all_time = @num_all_time - @num_7_days
	@num_all_time = @num_open - @num_7_days
	@num_7_days = @num_7_days - @num_24_hours
	# @num_7_days = @num_7_days-@num_24_hours 
	# @num_all_time = @num_all_time - @num_7_days -@num_24_hours

  end
end

