class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index # ruby関数
		@projects = Project.all # インスタンス変数 Viewで使用可
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save  # このsaveの部分、保存をするときにvalidationが発動する
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

		def project_params # ここで一度フィルタリングして上に渡す
			params[:project].permit(:title)
		end

		def set_project
			@project = Project.find(params[:id])
		end

end
