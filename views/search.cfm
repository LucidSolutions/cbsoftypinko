<cfoutput>
	<section class="section" id="headSection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
		            <div class="center-heading">
		                <h2 class="section-title mb-0">Search Results</h2>
		            </div>
		        </div>
		    </div>
		</div>
	</section>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#

	<section class="section colored search-section" id="body-main">
		<!--- search Results --->
		<div class="container">
			<!--- Search Results --->
			#cb.getSearchResultsContent()#

			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>

	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>