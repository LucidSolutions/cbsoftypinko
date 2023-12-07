<cfoutput>
<section class="section" id="headSection">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-xl-12">
	            <div class="center-heading">
	                <h2 class="section-title mb-0">Blog Entries</h2>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<section class="section colored" id="blog">
    <div class="container">
		<div class="row">
			<!--- Content --->
			<div class="col-md-8 col-lg-9 col-xl-9">
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preIndexDisplay" )#
					
				<!--- Are we filtering by category? --->
				<cfif len( rc.category )>
					<h3 class="mb-4">Category Filtering: '#encodeForHTML( rc.category )#'</h3>
					<a href="#cb.linkBlog()#" class="clearfix main-button mb-4" title="Remove filter and view all entries">Remove Filter</a>
				</cfif>
		
				<!--- Are we searching --->
				<cfif len( rc.q )>
					<h3 class="mb-4">Searching by: '#encodeForHTML( rc.q )#'</h3>
					<a href="#cb.linkBlog()#" class="clearfix main-button mb-4" title="Clear search and view all entries">Clear Search</a>
				</cfif>
		
				<!--- Entries displayed here --->
				<div class="row">#cb.quickEntries()#</div>
		
				<!--- Pagination --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postIndexDisplay" )#
			</div>
		
			<!--- SideBar --->
			<cfif args.sidebar>
				<div class="col-md-4 col-lg-3 col-xl-3">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</cfif>
		</div>
	</div>
</section>		
</cfoutput>