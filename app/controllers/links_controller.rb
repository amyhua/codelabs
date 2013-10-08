class LinksController < ApplicationController
  def index
    @links = Link.all
    @links1 = Link.where(category_id:1 )
    @links2 = Link.where(category_id:2 )
    @links3 = Link.where(category_id:3 )
    @links4 = Link.where(category_id:4 )
    @links5 = Link.where(category_id:5 )
    @links6 = Link.where(category_id:6 )
    @links7 = Link.where(category_id:7 )
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to :back, notice: "Thank you for adding a link to our collection!"
    else
      redirect_to :back, alert: "We're sorry, something went wrong. Your link was not added."
    end
  end
end
