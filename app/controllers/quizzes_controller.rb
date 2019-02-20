class QuizzesController < ApplicationController
  before_action :set_questionnaire, except: [:show, :edit, :update, :destroy]
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = policy_scope(Quiz.all)
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = @questionnaire.quizzes.new
    @quiz.user = current_user
    authorize @quiz
    #@quiz.prepare_answers!
  end

  # GET /quizzes/1/edit
  def edit
    #@quiz.prepare_answers!
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = @questionnaire.quizzes.new(quiz_params)
    @quiz.user = current_user
    authorize @quiz
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to edit_quiz_path(@quiz), notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: edit_quiz_path(@quiz) }
      else
        #@quiz.prepare_answers!
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to edit_quiz_path(@quiz), notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: edit_quiz_path(@quiz) }
      else
        #@quiz.prepare_answers!
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to questionnaire_quizzes_path(@quiz.questionnaire), notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
      authorize @quiz
    end

    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:questionnaire_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(
        answers_attributes:[
          :id,
          :question_id,
          :choice_id,
          :body,
          :booly
        ]
      )
    end

end
