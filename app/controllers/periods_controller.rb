class PeriodsController < ApplicationController
  respond_to :json

  # First, get_design id, then, get_period id
  before_action :get_design
  before_action :get_period, except: [ :index, :create ]

  # GET
  def index
    if @design # Check to see that @design at that id exists
      render :json => @design.periods
      # Only get periods from that specific design
    end
  end

  def show
    if @period
      render :json => @period
    end
  end

  # POST
  def create
    if @design # If @design you want to embed within exists,
      # create periods inside that design
      begin
        @period = @design.periods.create!(period_params)
        render :json => @period, status: :created
      rescue
        render :json => @period.errors, status: :unprocessable_entity
      end
      # If create does not work, render error
    end
  end

  # PUT
  def update
    if @period
      if @period.update_attributes(period_params)
        head :no_content
      else
        render :json => @period.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE
  def destroy
    if @period
      @period.destroy
      head :no_content
    end
  end

  private
  # Add this method to make sure you get a period by a design_id
  def get_design
    head :bad_request unless @design = Design.find(params[:design_id])
  end

  # Need to find only the period in this specific design
  def get_period
    if @design
      head :not_found unless @period = @design.periods.find(params[:id])
    end
  end
  def period_params
    params.require(:period).permit(
      :name,
      :activity,
      :starts_at,
      :ends_at
    )
  end
end