class ShoesController < ApplicationController
    def index
        @search = Shoe.ransack(params[:q])
        @result = @search.result
        # .includes(:name, :size_id).page(params[:page]).to_a.uniq
        @sizes = Size.all
        # @q = Shoe.ransack(search_params)
        # @shoes = @q.result(distinct: true)
    end
    
    def result
      @kutu = Shoe.all
    end
    
    private
      def search_params
        params.require(:q).permit!
      end
    
end
