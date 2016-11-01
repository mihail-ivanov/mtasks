class MtasksController < ApplicationController
  unloadable


  before_filter :find_project, :authorize
  before_filter :load_and_validate_mtask, only: [:edit, :update, :finish, :restore, :destroy]

  def index
    @mtask = Mtask.new
    @new_tasks = Mtask.where(project_id: @project.id, finished: false).order(due_date: :desc, created_at: :desc)
    @finished_tasks = Mtask.where(project_id: @project.id, finished: true).order(due_date: :desc, created_at: :desc)
  end

  def create
    mtask = Mtask.new(mtask_params)
    mtask.author = find_current_user
    mtask.project_id = @project.id
    mtask.save

    redirect_to mtasks_url(project_id: @project.identifier)
  end

  def edit
  end

  def update
    if @mtask.update(mtask_params)
      redirect_to mtasks_url(project_id: @project.identifier)
    else
      render 'edit'
    end
  end

  def finish
    if @mtask.update(finished: true)
      flash[:notice] = 'Task finished.'
    end

    redirect_to mtasks_url(project_id: @project.identifier)
  end

  def restore
    if @mtask.update(finished: false)
      flash[:notice] = 'Task restored.'
    end

    redirect_to mtasks_url(project_id: @project.identifier)
  end

  def destroy
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def load_and_validate_mtask
    @mtask = Mtask.find(params[:id])

    if @mtask.project_id != @project.id
      redirect_to mtasks_url(project_id: @project.identifier)
    end
  end

  def mtask_params
    params.require(:mtask).permit(:text, :author_id, :assigned_to_id, :due_date)
  end
end
