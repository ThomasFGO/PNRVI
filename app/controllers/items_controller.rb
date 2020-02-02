class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.find(params[:user_id])
    @item = @user.send(set_type.pluralize).new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.send(set_type.pluralize).new(item_params)
    if @item.save
      redirect_to @user, notice: "#{params[:type]} Item was successfully created."
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @user, notice: "#{params[:type]} Item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to @user, notice: "#{params[:type]} Item was successfully destroyed."
  end

  private

    def set_item
      @user = User.find(params[:user_id])
      @item = @user.send(set_type.pluralize).find(params[:id])
    end

    def set_type
      case params[:type]
      when 'Collection_item'
        'collection_item'
      when 'Search_item'
        'search_item'
      when 'Shop_item'
        'shop_item'
      end
    end

    def item_params
      params.require(set_type.to_sym).permit(:type, :condition, :language, :value)
    end
end
