class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :authenticate

  # GET /questions
  def index
    if params[:q]
      @questions = Question.matching_terms(params[:q]).select{ |x| x.private_question == false }
      logger.warn @questions.blank?
      unless @questions.blank?
        render json: @questions
      else
        render json: {text: "no content"}, status: :no_content
      end
    else
      render json: {error: 'Bad request. Query is missing'}, status: :bad_request
    end
  end

  # GET /questions/1
  def show
    if @question.private_question
      @tenant.add_fail_req
      render json: {}, status: :forbidden
    else
      @tenant.add_success_req
      render json: @question
    end
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
