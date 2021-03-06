class JobsController < ApplicationController

	before_action :find_job, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:category].blank?
			@jobs = Job.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end 
	end

	def new
		@job = Job.new
		@job.skills.build
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to jobs_path, notice: "新工作建立成功"
		else
			render "new", alert: "是不是少寫了什麼?"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @job.update(job_params)
			redirect_to jobs_path, notice: "工作修改成功"
		else
			render "edit", alert: "是不是改了不該改的?"
		end
	end

	def destroy
		@job.destroy
		redirect_to jobs_path, alert: "此工作被刪除了"
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :company, :url, :address, :people, :work_location, :image, :category_id, skills_attributes: [:id, :name, :_destroy])
	end

	def find_job
		@job = Job.find(params[:id])
	end

end
