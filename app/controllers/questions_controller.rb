class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    # authenticate
    if @question.private_question
      @tenant.add_fail_req
      render json: {}, status: :forbidden
    else
      @tenant.add_success_req
      render json: @question
    end
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:content, :user_id)
    end

    def authenticate
      @tenant = Tenant.where("api_key = ?", request.headers["HTTP_API_KEY"] || params[:api_key]).first
      if @tenant.blank?
        render json: {error: 'Invalid Api Token'}, status: :unauthorized
      end

      return @tenant
    end
end
