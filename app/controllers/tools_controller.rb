class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tools = Tool.all

    if params[:search].present?
      @tools = @tools.where("name ILIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @tool = Tool.find(params[:id])

    # @markers = @tools.geocoded.map do |tool|
    #   {
    #     lat: tool.latitude,
    #     lng: tool.longitude
    #   }
    # end
    @markers = [{
      lat: @tool.latitude,
      lng: @tool.longitude
    }]

  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to @tool, notice: 'Tool was successfully created.'
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to user_dashboard_path, notice: 'Tool was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to user_dashboard_path, notice: 'Tool was successfully deleted.'
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :photo, :address, :availability)
  end
end
