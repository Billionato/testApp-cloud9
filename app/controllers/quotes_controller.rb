class QuotesController < ApplicationController
    
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @quotes = Quote.order(created_at: :desc)
    end
    
    def show
        @quote = Quote.find(params[:id])
    end
    
    def new
        @quote = Quote.new
    end
    
    def create
        @quote = Quote.new(quote_params)
        
        if @quote.save
            redirect_to @quote, notice: "Successfully created quote"
        else
            render new
        end
    end
    
    def edit
        @quote = Quote.find(params[:id])
    end
    
    def update
        @quote = Quote.find(params[:id])
        
        if @quote.update_attributes(quote_params)
            redirect_to @quote
        else
            render edit
        end
    end
    
    private
    
    def quote_params
        params.require(:quote).permit(:author, :body, :context)
    end
end
