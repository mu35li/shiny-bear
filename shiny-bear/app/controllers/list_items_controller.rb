class ListItemsController < ApplicationController
    def index
        @item = ListItem.all
    end

    def new
        @list = ShoppingList.find(params[:list_id])
        @item = ListItem.new(list_id: @list.id)
    end

    def create

        @item = ListItem.new(list_item_params)
        @existingItem = ListItem.find_by(item: @item.item, list_id: @item.list_id)
        if @existingItem
            @existingItem.update(count: list_item_params[:count], important: list_item_params[:important])
            redirect_to shopping_lists_path
        else
            @item.save
            redirect_to shopping_list_url(@item.list_id)
        end
    end

    def show
        @item = ListItem.find(params[:id])
    end

    def update
        render 'new'
        @item = ListItem.find(params[:id])

        if @item.update(item_params)
            redirect_to list_items_path
        else
            render 'new'
        end
    end

    def destroy
        @item = ListItem.find(params[:id])
        @item.destroy

        redirect_to shopping_list_url(@item.list_id)
    end
    


    private
        def list_item_params
            params.require(:list_items).permit(:item, :count, :important, :list_id)
            
        end

end
