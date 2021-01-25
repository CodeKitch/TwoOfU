class CategoriesController < ApplicationController
    
    def index
      @categories = Category.all.includes(:tricks)
    end
  
    def show
       @category = Category.find_by_id(params[:id])
    end
  
    def new

    end
  
  end
  