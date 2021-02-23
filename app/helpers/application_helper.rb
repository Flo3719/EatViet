module ApplicationHelper
  def current_user_subscribed?
    user_signed_in? && current_user.subscribed?
  end
  def titlize(str)
    str.gsub('-', ' ').capitalize
  end
end
