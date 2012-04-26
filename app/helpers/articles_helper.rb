module ArticlesHelper
	def text_shorten(text,size)
		@string_shorten = text[0,size]
		
	end
	def current_comment(current_comments)
		content=""
		content << "<section id='comments'>"
  			current_comments.each do |comment|
  				content << "<article>#{gravatar_for(comment.user,:size => 40)}<span class='commentName'>#{comment.user.name} : </span>"
    			content << "<p class='content'>#{comment.commentContent}</p>"
    			content << "<footer>@ <date>#{comment.created_at.to_formatted_s(:short)}</date></footer><div class='clearBoth'/></article>"
			end
		content << "</section>"
	end
end
