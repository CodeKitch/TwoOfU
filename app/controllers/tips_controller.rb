class TipsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_tip, only: [:show, :edit, :update]
    # before_action :redirect_if_not_tip_magician, only: [:edit, :update]

    def index
        if params[:trick_id] && @trick = Trick.find_by_id(params[:trick_id])
            @tips = @trick.tips
        else
            @error = "We don't know about that tip!" if params[:trick_id]
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
        @tip = Tip.find_by_id(params[:id])
        redirect_to tips_path if !@tip
    end

    def edit
        @tip = Tip.find_by_id(params[:id])
        redirect_to tips_path if !@tip || @tip.user != current_user
        # @tip.build_category if !@tip.category
      end

      def update
         @tip = Tip.find_by(id: params[:id])
         redirect_to tips_path if !@tip || @tip.user != current_user
        if @tip.update(tip_params)
          redirect_to tip_path(@tip)
        else
          render :edit
        end
      end

      def destroy
        @tip = Tip.find_by(id: params[:id])
        # redirect_if_not_authorized
        @tip.destroy
        redirect_to tips_path, notice: 'Tip was successfully deleted!'
      end


    private

    def tip_params
        params.require(:tip).permit(:note, :trick_id)
    end

    def set_tip
        @tip = Tip.find_by(id: params[:id])
        if !@tip
          flash[:message] = "Tip Not Located"
          redirect_to tips_path
        end
    end

    def redirect_if_not_tip_magician
        redirect_to tip_path if @tip.user != @tip_user
    end

end