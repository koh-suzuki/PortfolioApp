class ApplicationController < ActionController::Base
  
  $days_of_the_week = %w{日 月 火 水 木 金 土}

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end
  
  # def set_one_month 
  #   @first_day = Date.current.beginning_of_month
  #   @last_day = @first_day.end_of_month
  #   one_month = [*@first_day..@last_day] # 対象の月の日数を代入します。
  #   # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
  #   @attendances = @user.attendances.where(worked_on: @first_day..@last_day)

  #   unless one_month.count == @attendances.count # それぞれの件数（日数）が一致するか評価します。
  #     ActiveRecord::Base.transaction do # トランザクションを開始します。
  #       # 繰り返し処理により、1ヶ月分の勤怠データを生成します。
  #       one_month.each { |day| @user.attendances.create!(worked_on: day) }
  #     end
  #   end

  # rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
  #   flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
  #   redirect_to root_url
  # end
end
