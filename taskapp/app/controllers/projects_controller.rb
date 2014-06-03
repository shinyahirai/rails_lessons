class ProjectsController < ApplicationController

	def index # ruby関数
		@projects = Project.all # インスタンス変数 Viewで使用可
	end

	def show
		@project = Project.find(params[:id])
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
		@project = Project.find(params[:id])
	end

	private

		def project_params # ここで一度フィルタリングして上に渡す
			params[:project].permit(:title)
		end

end
