class ApplicationController < ActionController::Base
  
  $days_of_the_week = %w{日 月 火 水 木 金 土}

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end
end
