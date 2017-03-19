class RecommendationsController < ApplicationController
  before_action :set_job_request, only: [:show, :destroy]

  def index
    @recommendations = current_user.recommended
  end

  def create
    @recommendation = current_user.recommended.build(recommendation_params)
    @recommended_user = @recommendation.user
    respond_to do |format|
      if @recommendation.save
        format.html do
          redirect_to user_path(@recommended_user),
            notice: "You just recommended #{@recommended_user.name} and helping build a strong and sustainable community!"
        end
      else
        format.html { redirect_to job_postings_path, notice: "Error sending request. Try again." }
      end
    end
  end

  private

    def recommendation_params
      params.require(:recommendation).permit(:user_id)
    end

end
