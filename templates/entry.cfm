<cfoutput>
<cfif len( cb.themeSetting( 'blogLayout' ) )>
	<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
		<div class="col-md-12 col-lg-6">
	<cfelse>
		<div class="col-md-12 col-lg-12">
	</cfif>
		<div class="blog-post-thumb" id="post_#entry.getContentID()#">
			<cfif entry.getFeaturedImageURL() NEQ "">
				<div class="img"><a href="#cb.linkEntry(entry)#" title="#entry.getTitle()#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a></div>
			</cfif>
		    <div class="blog-content">
		    	<span class="meta-date"><a href="#cb.linkEntry(entry)#">#entry.getDisplayPublishedDate()#</a></span>
		    	<span class="meta-divider"></span>
				<cfif entry.getNumberOfApprovedComments() GT 0>
					<span class="meta-comments"><a href="#cb.linkEntry(entry)#">#entry.getNumberOfApprovedComments()# Comments</a></span>
					<span class="meta-divider"></span>
				</cfif>
				<span class="meta-author"><a href="#cb.linkEntry(entry)#">by #entry.getAuthorName()#</a></span>
		        <h3>
		            <a href="#cb.linkEntry(entry)#" title="#entry.getTitle()#">#entry.getTitle()#</a>
		        </h3>
		        <div class="text">
		           #left(ReReplaceNoCase(entry.renderContent(),"<[^>]*>","","ALL"),200)#...
		        </div>
		        <a href="#cb.linkEntry(entry)#" class="main-button">Read More</a>
		    </div>
		</div>
	</div>
</cfif>
</cfoutput>