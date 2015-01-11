class StocksController < ApplicationController
    def index
        @item = Stock.all
    end

    def new
        @item = Stock.new
    end

    def create
        @item = Stock.new(stock_params)
        if @item.save
            redirect_to stocks_path
        else
            render 'new'
        end
    end

    def show
        @item = Stock.find(params[:id])
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


    private
        def stock_params
            params.require(:stocks).permit(:item, :count, :rebuy)
            
        end

end
