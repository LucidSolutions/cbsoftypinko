<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
<div class="widget wb-search">
	<h5 class="mb-2 fontBold">Search</h5>
	#cb.widget( "BlogSearchForm" )#
</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
<div class="widget wb-category">
	<h5 class="mb-2 fontBold">Categories</h5>

	<!---
	Display Categories using ContentBox collection template rendering
	the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
	--->
	<ul>
		#cb.quickCategories()#
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
<div class="widget wb-post">
	<h5 class="mb-2 fontBold">Recent Entries</h5>
	#cb.widget( 'RecentPosts' )#
</div>
</cfif>

<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
<!--- RSS Buttons --->
<div class="widget">
	<h5 class="mb-2 fontBold">Site Updates</h5>
	<ul>
		<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a></li>
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
<div class="widget">
	<h5 class="mb-2 fontBold">Archives</h5>
	#cb.widget( "Archives" )#
</div>
</cfif>

<!---#cb.widget("Meta",{titleLevel="4"})#--->

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>