class TricksController < ApplicationController
    before_action :redirect_ifnt_logdin

    def new
        @trick = Trick.new
    end
end
    