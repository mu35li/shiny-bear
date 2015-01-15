class ShoppingListsController < ApplicationController
    def index
        @list = ShoppingList.all
    end
    def new

        @list = ShoppingList.new(:active => true)

        if @list.save
            redirect_to @list
        else
            render shopping_lists_path 
        end
    end

    def destroy
        @list = ShoppingList.find(params[:id])
        @list.destroy

        redirect_to shopping_lists_path
    end

    def show
        @list = ShoppingList.find(params[:id])
        @item = ListItem.where(:list_id => @list.id)
    end
end
