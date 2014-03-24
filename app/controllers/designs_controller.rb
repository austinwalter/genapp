class DesignsController < ApplicationController
  before_action :signed_in_user
  
  def new
    @design = current_user.designs.build
  end
    
  def create
    @design = current_user.designs.build(design_params)
    if @design.save
      flash[:success] = "Design created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
  end
  
  private
    
    def design_params
      params.require(:design).permit(:name)
    end
end
