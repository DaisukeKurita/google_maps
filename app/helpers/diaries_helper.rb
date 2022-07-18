module DiariesHelper
  def choose_new_or_edit
    case action_name
    # 【確認画面から『戻る』】→ もう一度【確認画面】
    # 【日記新規投稿】 → 【バリデーション発生】 → もう一度【確認画面】
    # 以上の2点にも対応ができるように『'create'』『'confirm'』の両方を記述している
    when 'new', 'create', 'confirm'
      confirm_diaries_path
    when 'edit'
      diary_path
    end
  end
end
