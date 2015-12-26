class QuotesController < ApplicationController
    
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @quotes = Quote.order(created_at: :desc)
    end
    
    def show
        @quote = Quote.find(params[:id])
        
        @context = Context.find_by(quote_id: @quote.id)
    end
    
    def new
        @quote = current_user.quotes.build
    end
    
    def create
        @quote = current_user.quotes.build(quote_params)
        
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
    
    def upvote
        @quote = Quote.find(params[:id])
        @quote.upvote_by current_user
        redirect_to :back #redirects to page user was currently on
    end
    
    def downvote
        @quote = Quote.find(params[:id])
        @quote.downvote_by current_user
        redirect_to :back
    end
    
    private
    
    def quote_params
        params.require(:quote).permit(:author, :body, :context)
    end
end
