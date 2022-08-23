module UsersHelper
  def output_nickname(user)
    "@#{user.nickname}"
  end
end
