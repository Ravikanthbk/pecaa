class BaseColorsController < ApplicationController
  # GET /base_colors
  # GET /base_colors.json
    layout 'site'
  def index
    @base_colors = BaseColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @base_colors }
    end
  end

  # GET /base_colors/1
  # GET /base_colors/1.json
  def show
    @base_color = BaseColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @base_color }
    end
  end

  # GET /base_colors/new
  # GET /base_colors/new.json
  def new
    @base_color = BaseColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @base_color }
    end
  end

  # GET /base_colors/1/edit
  def edit
    @base_color = BaseColor.find(params[:id])
  end

  # POST /base_colors
  # POST /base_colors.json
  def create
    @base_color = BaseColor.new(params[:base_color])
    @base_color.colors = params[:color].join(';')
    @base_color.created_by = current_user.id
    respond_to do |format|
      if @base_color.save
        format.html { redirect_to "/base_colors/new", notice: 'Base color was successfully created.' }
        format.json { render json: @base_color, status: :created, location: @base_color }
      else
        format.html { render action: "new" }
        format.json { render json: @base_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /base_colors/1
  # PUT /base_colors/1.json
  def update
    @base_color = BaseColor.find(params[:id])

    respond_to do |format|
      if @base_color.update_attributes(params[:base_color])
        format.html { redirect_to @base_color, notice: 'Base color was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @base_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_colors/1
  # DELETE /base_colors/1.json
  def destroy
    @base_color = BaseColor.find(params[:id])
    @base_color.destroy

    respond_to do |format|
      format.html { redirect_to base_colors_url }
      format.json { head :ok }
    end
  end
  
  def colorpicker
    render :layout=>false
  end 
end
