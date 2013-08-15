class ExpectationsController < ApplicationController
  respond_to :json

  before_action :get_design_and_period
  before_action :get_expectation, except: [ :index, :create ]

  def index
    if @period
      render :json => @period.expectations
    end
  end

  def show
    if @expectation
      render :json => @expectation
    end
  end

  def create
    if @period
      begin
        @expectation = @period.expectations.create!(expectation_params)
        render :json => @expectation, status: :created
      rescue
        render :json => @expectation.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @expectation
      if @expectation.update_attributes(expectation_params)
        head :no_content
      else
        render :json => @expectation.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @expectation
      @expectation.destroy
      head :no_content
    end
  end

  private

  def get_design_and_period
    if @design = Design.find(params[:design_id])
      head :bad_request unless
        @period = @design.periods.find(params[:period_id])
    else
      head :bad_request
    end
  end

  def get_expectation
    if @period
      head :not_found unless @expectation = @period.expectations.find(params[:id])
    end
  end

  def expectation_params
    params.require(:expectation).permit(
      :behavior
    )
  end

end