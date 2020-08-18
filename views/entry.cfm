<cfoutput>
<section class="section" id="headSection">
	<div class="container">
		<div class="row">	
			<div class="col-lg-12">
				<div class="center-heading">
				    <h2 class="section-title mb-0">Blog Detail</h2>
				</div>
			</div>
			<!--- <div class="offset-lg-3 col-lg-6 col-md-12">
			    <div class="center-text">
			        <p>#prc.entry.getTitle()#</p>
			    </div>
			</div> --->
		</div>
	</div>
</section>
<section class="section colored" id="blog">
    <div class="container">
        <div class="row">
        	<!--- ContentBoxEvent --->
			#cb.event("cbui_preEntryDisplay")#
            <div class="<cfif args.sidebar>col-md-8 col-lg-8 col-xl-9 <cfelse>ccol-md-12 col-lg-12 col-xl-12</cfif>">
                <div class="blog-post-thumb text-left" id="post_#prc.entry.getContentID()#">
                    <cfif prc.entry.getFeaturedImageURL() NEQ "">
						<div class="img"><img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#"></div>
					</cfif>
                    <div class="blog-content">
                        <h2 class="mb-3">#prc.entry.getTitle()#</h2>
						<span class="meta-date">#prc.entry.getDisplayPublishedDate()#</span>
						<span class="meta-divider"></span>
						<cfif prc.entry.getNumberOfApprovedComments() GT 0>
							<span class="meta-comments">#prc.entry.getNumberOfApprovedComments()# Comments</span>
							<span class="meta-divider"></span>
						</cfif>
						<span class="meta-author">by #prc.entry.getAuthorName()#</span>

                        <div class="text">
                            #prc.entry.renderContent()#
                        </div>
                    </div>
                </div>
                <div class="row no-gutters position-relative align-items-center border-top border-bottom my-5">
	                <div class="col-md-6 pl-md-3 py-2 py-md-3 text-center text-md-left">
						<div class="d-flex align-items-center justify-content-center justify-content-md-start tags">
		                    <h6 class="text-nowrap my-2 mr-2">Tags:</h6>
		                    #cb.quickCategoryLinks(prc.entry)#
	                    </div>
                	</div>
                	<div class="d-none d-md-block position-absolute border-left tagDivider"></div>
	                <div class="col-md-6 pl-md-3 py-2 py-md-3">
						<div class="d-flex align-items-center justify-content-center justify-content-md-end">
		                    <h6 class="text-nowrap my-2 mr-2">Share post:</h6>
		                    <a class="social-btn facebook ml-2 my-2" target="_blank" href="https://www.facebook.com/share.php?u=#cb.linkEntry(prc.entry)#">
		                    	<i class="fab fa-facebook-f"></i>
		                    </a>
		                    <a class="social-btn twitter ml-2 my-2" target="_blank" href="https://twitter.com/share?url=#cb.linkEntry(prc.entry)#&amp;text=#prc.entry.getTitle()#">
		                    	<i class="fab fa-twitter"></i>
		                    </a>
		                    <a class="social-btn linkedin ml-2 my-2" target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=#cb.linkEntry(prc.entry)#">
		                    	<i class="fab fa-linkedin-in"></i>
		                    </a>
	                    </div>
                	</div>
              	</div>

              	<!--- Display Comments --->
				<div id="comments">
					<h4 class="h4 pb-4">#prc.entry.getNumberOfApprovedComments()# Comments</h4>
					#cb.quickComments()#
				</div>
				
				<hr>

				<cfif !args.print>
					<!--- Comments Bar --->
					#html.anchor(name="comments")#
					<div class="infoBar my-5">
						<cfif NOT cb.isCommentsEnabled(prc.entry)>
						<i class="icon-warning-sign icon-2x"></i>
						Comments are currently closed
						<cfelse>						
							<button class="main-button w-100" onclick="toggleCommentForm()"><i class="fa fa-comments"></i> Leave a comment</button>
						</cfif>
					</div>
		
					<!--- Separator --->
					<div class="separator"></div>
		
					<!--- Comment Form: I can build it or I can quick it? --->
					<div class="row" id="commentFormShell" style="display: none;">
						<div class="col-md-12 col-lg-12 col-xl-12">
							<h4 class="h4 pb-4">Leave a comment</h4>
							#cb.quickCommentForm( prc.entry )#
						</div>
					</div>
					</cfif>

				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
            </div>

            <cfif args.sidebar>
				<div class="col-md-4 col-lg-4 col-xl-3" id="blog-sidenav">
					#cb.quickView(view='_blogsidebar', args=args)#
				</div>
			</cfif>
        </div>
    </div>
</section>

<!--- Custom JS --->
<script type="text/javascript">
	$(document).ready(function() {
		<!---<cfif cb.isCommentFormError()>--->
		toggleCommentForm();
		<!---</cfif>--->
	});
	function toggleCommentForm(){
		$("##commentFormShell").slideToggle();
	}
</script>
</cfoutput>