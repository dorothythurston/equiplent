class UsersController < Clearance::UsersController
  respond_to :html
  
  def index
    @users = User.paginated(params[:page], 20)
  end

  def show
    @user = find_user
    @reservations = @user.reservations.paginated(params[:page], 3).sort(params[:sort])
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    respond_with user
  end

  private

  def find_user
    User.find(params[:id])
  end

  def user_from_params
    Clearance.configuration.user_model.create(user_params)
  end

  def user_params
      params.require(:user).permit(
        :admin,
        :first_name,
        :last_name,
        :profile_type,
        :email,
        :password,
        :telephone
        )
    end
end
