class LecturesController < ApplicationController
  # @current_normal_user
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :add_to_fav ,:delete_from_fav]
#  before_action :authenticate_admin_user!
  before_action :current_normal_user
  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show

  #   #3shan al ageb al 2sm al 2abl al dot
  #   #a5d al path w al type 3shan lo pdf or ay 7aga
      # extension=@lecture.attatchment.split('.')
      #  send_file Rails.root.join('public','uploads',@lecture.attatchment),
      #  :type=>"application/#{extension[1]}",:x_sendfile=>true


  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new

  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create



    @lecture = Lecture.new(lecture_params)
    #bdawr gwa al form al fe al html al 2smha Lecture gwha 3la att. w bashelha fe al variable da
     uploaded_io= params[:lecture][:attatchment]
  #   # #hena bageb al path bta3 al file gwa public feh file uploads
      File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do|file|
      file.write(uploaded_io.read)
   end
  #bageb al path al gwa al computer w a save fe al variable da
   @lecture.attatchment=uploaded_io.original_filename

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
  @lecture = Lecture.find(params[:id])
  @lecture.upvote_by current_normal_user
  redirect_to @lecture
end

def downvote
  @lecture = Lecture.find(params[:id])
  @lecture.downvote_by current_normal_user
  redirect_to @lecture
end

def add_to_fav
  current_normal_user.lectures << @lecture
  current_normal_user.save
  redirect_to lectures_path
  end

def delete_from_fav
 current_normal_user.lectures.delete(@lecture)
  current_normal_user.save
  redirect_to lectures_path
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:content, :attatchment, :course_id)
    end
end
