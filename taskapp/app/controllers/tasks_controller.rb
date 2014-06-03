class TasksController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.create(task_params)
		redirect_to project_path(@project.id)
	end

	def destroy
	end

	private

		def task_params # ここで一度フィルタリングして上に渡す
			params[:task].permit(:title)
		end
end
