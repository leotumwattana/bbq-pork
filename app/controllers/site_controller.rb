class SiteController < ApplicationController

  def index
    @query = params[:search]
    if @query.blank?
      @events = Event.all
    else
      @events = Event.where("name like ?", '%' + @query + '%')
      Event.where(name: "Junk")
    end
  end

  def new
  end

  def create

    name = params[:name]
    location = params[:location]
    date = params[:date]

    if date.blank?
      date = Time.now
    end

    event = Event.new
    event.name = name
    event.location = location
    event.date = date

    if event.save
      puts "Cool"
    else
      puts "Hot"
    end

    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def delete
  end

end