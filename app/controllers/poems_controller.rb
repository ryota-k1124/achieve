class PoemsController < ApplicationController
#before_action :set_poem, only: [:show, :edit, :update, :destroy]
before_action :set_poem, only: [:show]

    def index
        @poems = Poem.all
    end
    
    def show
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def poem_params
    #  params.require(:poem).permit(:title, :content, :auther)
    #end
end