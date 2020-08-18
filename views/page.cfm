<cfoutput>

<!--- If homepage, present homepage jumbotron --->
<cfif cb.isHomePage()>
	<section class="section" id="headSection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
		            <div class="center-heading">
		                <h2 class="section-title mb-0">Home</h2>
		            </div>
		        </div>
		        <cfif prc.page.getExcerpt() NEQ "">
		            <div class="offset-lg-3 col-lg-6 col-md-12">
					    <div class="center-text">
					        <p>#prc.page.getExcerpt()#</p>
					    </div>
					</div>
	            </cfif>
		    </div>
		</div>
	</section>
<cfelse>
	<section class="section colored" id="headSection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
		            <div class="center-heading">
		                <h2 class="section-title mb-0">#prc.page.getTitle()#</h2>
		            </div>
		        </div>
		        <cfif prc.page.getExcerpt() NEQ "">
		            <div class="offset-lg-3 col-lg-6 col-md-12">
					    <div class="center-text">
					        <p>#prc.page.getExcerpt()#</p>
					    </div>
					</div>
	            </cfif>
		    </div>
		</div>
	</section>
</cfif>

<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<section class="section" id="body-main">
	<div class="container">
		<div class="col-md-12 col-lg-12">
			<!--- Render Content --->
			#prc.page.renderContent()#
    	</div>
	</div>
</section>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#
</cfoutput>