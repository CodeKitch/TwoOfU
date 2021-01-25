class TipsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_tip, only: [:show, :edit, :update]
    before_action :redirect_if_not_tip_author, only: [:edit, :update]
    
    def index
        if params[:trick_id] && @trick = Trick.find_by_id(params[:trick_id])
            @tips = @trick.tips
        else
            @error = "We don't know about that trick!" if params[:trick_id]
            @tips = Tip.all
        end
    end

    def new
        if params[:trick_id] && @trick = Trick.find_by_id(params[:trick_id])
          @tip = @trick.tips.build
        else
          @error = "Trick Doesn't Exist!" if params[:trick_id]
          @tip = Tip.new
        end
    end

    def create
        @tip = current_user.tips.build(tip_params)
        if @tip.save
            redirect_to tips_path
        else
            render :new
        end
    end

    def show
        @tip = Tip.find_by(id: params[:id])
    end

    def edit
        @tip = current_user.tips.build(params)
        if @tip.save
            redirect_to tips_path
        else
            render :new
      end
    end
  
    def update
      if @tip.update(tip_params)
        redirect_to tip_path(@tip)
      else
        render :edit
      end
    end

    private
    
    def tip_params
        params.require(:tip).permit(:note, :trick_id)
    end
    
    def set_tip
        @tip = Tip.find_by(id: params[:id])
        if !@tip
          flash[:message] = "Tip was not found"
          redirect_to tips_path
        end
    end
end