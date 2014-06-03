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
end
