class UsersController < Clearance::UsersController

  private

  def user_from_params
    Clearance.configuration.user_model.create(user_params)
  end

  def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :telephone
        )
    end
end
