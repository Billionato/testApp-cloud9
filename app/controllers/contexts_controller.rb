class ContextsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_quote
    before_action :set_context, only: [:edit, :update]
    
    #view for the create method
    def new
        @context = Context.new
    end
    
    def create
        @context =  Context.new(context_params)
        
        #assign the current user's ID to a context
        @context.user_id = current_user.id
        
        #assign a quote's ID to a context
        @context.quote_id = @quote.id
        
        if @context.save
            redirect_to @quote
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @context.update(context_params)
            redirect_to @quote
        else
            render 'edit'
        end
    end
    
    private
    
    def set_context
        @context = Context.find(params[:id])
    end
    
    def set_quote
        @quote = Quote.find(params[:quote_id])
    end
    
    def context_params
        params.require(:context).permit(:body)
    end
end
