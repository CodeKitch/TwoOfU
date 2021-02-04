module TipsHelper
    def index_display_tip_header
      if @user
        content_tag(:h1, "#{@user.username}'s Tips:")
      else
        content_tag(:h2, "All Tips")
      end
    end

    def display_tips
      if @user.tips.empty?
        tag.h2(link_to('Save your first tips here!', new_tip_path))
      else
        user = @user == current_user ? 'Your' : "#{@user.username}'s"
        content_tag(:h2, "#{user} #{pluralize(@user.tips.count, 'Tip')}:")

      end
    end

  end
