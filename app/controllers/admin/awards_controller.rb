class Admin::AwardsController < Admin::BaseController

  def index
    @awards = Award.all
  end

  def create
    # @award =
  end

  private

  def award_params
    params.require(:award).permit(:name)
  end
end
