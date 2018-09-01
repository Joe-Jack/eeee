class ShoesController < ApplicationController
    def index
        @search = Shoe.ransack(params[:q])
        @result = @search.result.page(params[:page]).per(10)
        
        # .includes(:name, :size_id, :pic).page(params[:page]).per(10)
        @sizes = Size.all
        @types = Type.all
        @brands = Brand.all
        # @q = Shoe.ransack(search_params)
        # @shoes = @q.result(distinct: true)
    end
    
    # def create
    #   @search = Shoe.ransack(params[:q])
    #   @result = @search.result.page(params[:page]).per(10)
    # end
    
    # def move
    #   redirect_to "/shoes/index/result"
    # end
    
    private
      def search_params
        params.require(:q).permit(:name, :size_id, :pic, :type_id)
      end
    
end
