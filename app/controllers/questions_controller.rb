class QuestionsController < ApplicationController
  before_action :set_questionnaire, except: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = policy_scope(@questionnaire.questions)
  end

  def show
  end

  def new
    @question = @questionnaire.questions.new
    authorize @question
  end

  def edit
  end

  def create
    @question = @questionnaire.questions.new(question_params)
    authorize @question
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@questionnaire, @question], notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: [@questionnaire, @question] }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questionnaire_questions_url(@question.questionnaire), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
      authorize @question
    end

    def question_params
      params.require(:question).permit(:kind, :name, :body)
    end

    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:questionnaire_id])
    end
end
