class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.html { redirect_to @project, flash[:notice] = "Project has been created." }
        format.js {flash.now[:notice] = "Project has been created."}
      end
    else
      flash.now[:error] = "Project could not be saved."
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Success! Project was updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Success! Project was destroyed.' }
      format.js
    end
  end

  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image_url, :source_url)
  end
end
