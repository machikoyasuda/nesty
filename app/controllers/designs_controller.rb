class DesignsController < ApplicationController
  respond_to :json

  before_action :get_design, except: [ :index, :create ]

  # GET
  def index
    @designs = Design.all.entries

    render :json => @designs
  end

  def show
    if @design
      render :json => @design
    end
  end

  # POST
  def create
    @design = Design.new(design_params)

    if @design.save
      render :json => @design, status: :created
    else
      render :json => @design.errors, status: :unprocessable_entity
    end
  end

  # PUT
  def update
    if @design
      if @design.update_attributes(design_params)
        head :no_content
      else
        render :json => @design.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE
  def destroy
    if @design
      @design.destroy
      head :no_content
    end
  end

  private

  def get_design
    head :not_found unless @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:title)
  end
end