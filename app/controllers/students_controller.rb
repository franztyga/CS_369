class StudentsController < ApplicationController
	before_action :require_login
   def index
		@students = Student.all
	end

   def show
   	@student = Student.find(params[:id])
   end

	def new 
	@student = Student.new
	end 

	def create
   	@student = Student.new(params[:student].permit(:student_id, :student_name, :student_section))

   	if @student.save
   		redirect_to students_path, :notice => "Student has been added"
   	else
   		render "new"
   	end 
   end

   def edit
      @student = Student.find(params[:id])
   end

   def update
      @student = Student.find(params[:id])

      if @student.update_attributes(params[:student].permit(:student_id, :student_name, :student_section))
         redirect_to students_path, :notice => "Student has been updated"
      else 
         render "edit"
   end
end

   def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to students_path, :notice => "Student has been deleted"
   end
end
