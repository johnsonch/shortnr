class LinksController < ApplicationController

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find_by(slug: params[:id])
    if @link
      @link.count =  @link.count + 1
      @link.save
      redirect_to @link.destination
    else
      redirect_to root_url
    end
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.count = 0 #cheat and always start at 0
    if @link.save
      flash[:info] = @link.short_url
      redirect_to root_url
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end




  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:slug, :destination, :count)
    end
end
