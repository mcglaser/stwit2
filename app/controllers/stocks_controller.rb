require 'httparty'

class StocksController < ApplicationController


  def create

    @api = HTTParty.get("https://api.stocktwits.com/api/2/trending/symbols.json")
    @symbols = @api.fetch("symbols")

  
  	@symbols.each do |symbol|

	    @stock = Stock.where(:twit_id => symbol.fetch("id")).first_or_create
	    @stock.symbol = symbol.fetch("symbol")
	    @stock.name = symbol.fetch("title")
	 
	    
	    @stock.last_seen = DateTime.now

	    @stock.save

    end  

    redirect_to stocks_path

  end


  def index
    @stocks = Stock.all
  end






def trending


  @api = HTTParty.get("https://api.stocktwits.com/api/2/trending/symbols.json")
 # @json = JSON.parse(response.body)

  @symbols = @api.fetch("symbols")


  @test = []
  @symbols.each do |symbol|
    @test << symbol.fetch("id")
  end


end







end