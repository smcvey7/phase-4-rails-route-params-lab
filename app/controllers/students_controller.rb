class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name]

      student_by_name = Student.select do |student|
        query = params[:name].downcase
        student.first_name.downcase == query || student.last_name.downcase == query
      end

      render json: student_by_name
    else
      render json: students
    end

  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
