class DashboardController < ActionController::Base
  def index
    @u_size = User.count
    @q_size = Question.count
    @a_size = Answer.count
    @r_num = Tenant.sum(:successful_requests) + Tenant.sum(:failed_requests)
  end
end
