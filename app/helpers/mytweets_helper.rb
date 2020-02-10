module MytweetsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_mytweets_path
    elsif action_name == 'edit'
      mytweet_path
    end
  end
end
