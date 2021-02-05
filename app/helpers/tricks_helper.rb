module TricksHelper
  def index_display_trick_header
    if @user
      content_tag(:h1, "#{@user.username}'s Tricks:")
    else
      content_tag(:h2, "All Tricks")
    end
  end

  def display_tricks
    if @user.tricks.empty?
      tag.h2(link_to('Save your first trick here!', new_trick_path))
    else
      user = @user == current_user ? 'Your' : "#{@user.username}'s"
      content_tag(:h2, "#{user} #{pluralize(@user.tricks.count, 'Trick')}:")

    end
  end

end
