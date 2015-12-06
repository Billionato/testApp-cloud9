class QuotesController < ApplicationController
    
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
            redirect_to @quote, notice: "Quote successfully created"
        else
            render new
        end
    end
    
    private
    
    def quote_params
        params.require(:quote).permit(:author, :body, :context)
    end
end
