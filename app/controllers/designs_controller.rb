class DesignsController < ApplicationController
  respond_to :json
  # Expect only JSON formants

  # Set the #design variable pased on params[:id] for all
  # actions, except for :index, :create
  # so do it in the before_action callback
  # because it is more DRY
  before_action :get_design, except: [ :index, :create ]

  # GET
  def index
    # Get array of all designs
    @designs = Design.all.entries
    render :json => @designs
  end

  def show
    head :not_found unless @design
    # If design with passed ID was not found,
    # show 404 Not Found HTTP Status in get_design
    end
  end

  # POST
  def create
    @design = Design.new(design_params)
    # Try to create a new design with the pased params
    if @design.save
      render :json => @design, status: :created
      # If successfully created, return as JSON with 201 Status
    else
      render :errors, status :unprocessable_entity
      # If not, render errors template with 422 Status
    end
  end

  # PUT
  def update
    if @design # If param is found,
      if @design.update_attributes(design_params) # Try to update it
        head :no_content # If successful, return Status 204
      else # Unsuccessful return, render unprocessable entity
        render :errors, status: :unprocessable_entity
      end
    end
  end
  # Otherwise, fall through to no content in get_design below

  # DELETE
  def destroy
    if @design # If found, destroy it and return 204 no content.
      @design.destroy
      head :no_content
    end
  end

  private

  def get_design # Set 404 not found
    head :not_found unless @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:title)
  end
end