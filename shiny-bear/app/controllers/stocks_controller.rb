class StocksController < ApplicationController
    def index
        @item = Stock.all
    end

    def new
        @item = Stock.new
    end

    def create

        @item = Stock.new(stock_params)
        @existingItem = Stock.find_by(item: @item.item)
        if @existingItem
            @existingItem.update(count: stock_params[:count], rebuy: stock_params[:rebuy])
            redirect_to stocks_path
        else
            @item.save
            redirect_to stocks_path
        end
    end

    def show
        begin
           @item = Stock.find(params[:id])     
           render 'show'
        rescue => e
            redirect_to stocks_path
        end
    end

    def update
        render 'new'
        @item = Stock.find(params[:id])

        if @item.update(item_params)
            redirect_to stocks_path
        else
            render 'new'
        end
    end

    def destroy
        @item = Stock.find(params[:id])
        @item.destroy

        redirect_to stocks_path
    end
    


    private
        def stock_params
            params.require(:stocks).permit(:item, :count, :rebuy)
            
        end

end
