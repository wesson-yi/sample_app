module SessionsHelper

  #登入指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end

  #在持久会话中记住用户
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 如果指定用户是当💰用户，返回 true
  def current_user?(user)
    user == current_user
  end
  #返回当前登录的用户（若存在的话）,否则返回 cookies 中记忆令牌对应的用户
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #如果用户已经登录，返回true，否则返回false
  def logged_in?
    !current_user.nil?
  end

  #忘记持久会话
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #退出当前用户
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
