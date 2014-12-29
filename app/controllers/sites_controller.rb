class SitesController < ApplicationController


  def index
    @sites = current_user.sites
  end

  def show
    @site = Site.find(params[:id])
    @events = @site.events
    # @events = Event.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.build(site_params)


    if @site.save
      flash[:notice] = "Your site is now being tracked."
      redirect_to sites_path
      else
      flash[:error] = "Error tracking site. Please try again."
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])

  end

  def update
    @site = Site.find(params[:id])

    if @site.update_attributes(site_params)
      flash[:notice] = "Your website was updated."
      redirect_to @site
    else
      flash[:error] = "There was an error updating your site. Please try again."
      render :edit
     end
  end

  def destroy
    @site = Site.find(params[:id])
      if @site.destroy
        flash[:notice] = "You have stopped tracking your site" 
      else
        flash[:error] = 'There was an error untracking your site.  Try again.' 
      end
      redirect_to sites_path
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end

end
