class StudentsController < ApplicationController

  def new
    @dojo = Dojo.find(params[:id])
    @dojoall = Dojo.all
    render :new_student
  end

  def create
    b = Dojo.find(params[:id])
    @a = Student.new(first_name: params[:fname], last_name: params[:lname], email: params[:email], dojo_id: params[:dojo])
    if @a.valid?
      @a.save
      redirect_to "/dojos/#{b[:id]}"
    else
      flash[:errors] = @a.errors.full_messages
      redirect_to "/dojos/#{b[:id]}/students/new"
    end
  end

  def show
    @student = Student.find(params[:sid])
    @dojo = Dojo.find(params[:did])
    # @today = @student.created_at.strftime("%a, %d %b %Y")
    @today = @student.created_at.to_date
    puts @today
    @others = Student.where("dojo_id = ? AND created_at = ?", params[:did], @today).where.not("id = ?", params[:sid])
    render "show"
  end

  def edit
    @dojo = Dojo.find(params[:did])
    @dojoall = Dojo.all
    @student = Student.find(params[:sid])
    render "edit"
  end
  
  def destroy
    # @dojo = Dojo.find(params[:did])
    puts 'deleting....'
    Student.find(params[:sid]).destroy
    redirect_to "/dojos/#{params[:did]}"
  end
  def update
    @dojo = Dojo.find(params[:did])
    @student = Student.find(params[:sid])
    @student.update(student_params)
    redirect_to "/dojos/#{@dojo.id}/students/#{@student.id}"
  end

  private
    def student_params
        params.require(:student).permit(:first_name, :last_name,:email, :dojo_id)
    end

end
