<cfoutput>
<div class="media align-items-center pb-1 mb-3" id="comment_#comment.getCommentID()#">
	<a class="d-block pr-2 mr-1" href="##" name="comment_#comment.getCommentID()#">
		#cb.quickAvatar( author=comment.getAuthorEmail(), size=60 )#
	</a>
	<div class="media-body">
		<h4 class="mediaHeading mb-1">#comment.getAuthor()#</h4>
		<p class="mb-0">#comment.getDisplayContent()#</p>
		<p class="mediaText text-muted mb-0">#dateFormat(comment.getDisplayCreatedDate(),"mmm dd yy" )#</p>
	</div>
</div>
</cfoutput>