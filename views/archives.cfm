<cfoutput>	
<section class="section" id="headSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	            <div class="center-heading">
	                <h2 class="section-title mb-0">Blog Entries</h2>
	            </div>
	        </div>
	    </div>
	</div>
</div>
</section>
<!--- Body Main --->
<section  class="section" id="body-main">
	<div class="container">	
		<div class="row">
			<!--- Content --->
			<div class="col-md-8 col-lg-9">

				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preArchivesDisplay" )#

				<!--- Title --->
				<h3 class="mb-4">Blog Archives - #prc.entriesCount# Record(s)</h3>

				<!--- Archives --->
				<cfif rc.year NEQ 0>
					<div class="alert alert-info">
						Year: '#rc.year#'
						<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
						<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
					</div>
					<a class="clearfix main-button mb-4" href="#cb.linkBlog()#" title="Remove filter and view all entries">Remove Filter</a>
				</cfif>

				<!---
					Display Entries using ContentBox collection template rendering
					The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
					I could have done it manually, but why?
				 --->
				<div class="row">#cb.quickEntries()#</div>

				<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>

				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postArchivesDisplay" )#
			</div>

			<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
			<cfif args.sidebar>
				<div class="col-md-4 col-lg-3">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</cfif>

		</div>
	</div>
</section>		
</cfoutput>