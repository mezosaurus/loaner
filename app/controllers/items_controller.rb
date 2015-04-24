class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    
    respond_to :html
    
    def index
        @items = Item.all
        respond_with(@items)
    end
    
    def show
        @item = Item.find(params[:id])
        @borrower = @item.borrower
        response = { :item => @item, :borrower => @borrower }
        respond_to do |format|
            format.json { render :json => @item.to_json(:include => [:borrower]) }
            format.html { @item }
        end
    end
    
    def loan
        @item = Item.find(params[:id])
    end
    
    def returnloan
        @item = Item.find(params[:id])
        @borrower = @item.borrower
        @borrower.items.delete(@item)
        redirect_to(categories_path)
    end
    
    def new
        @item = Item.new
        @category = @item.build_category
        @user = current_user
        respond_with(@item)
    end
    
    def edit
        @user = current_user
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        respond_with(@item)
    end
    
    def update
        @item.update(item_params)
        redirect_to(categories_path)
    end
    
    def destroy
        @item.destroy
        respond_with(@item)
    end
    
    private
    def set_item
        @item = Item.find(params[:id])
    end
    
    def item_params
        params.require(:item).permit(:name, :description, :category_id, :borrower_id, :user_id)
    end
end

