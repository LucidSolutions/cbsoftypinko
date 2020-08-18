<cfoutput>
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <cfif cb.themeSetting( 'headerLogo' ) is "">
						<a href="#cb.linkHome()#" class="logo" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
					<cfelse>
						<a href="#cb.linkHome()#" class="logo" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
					</cfif>
                    <!-- ***** Menu Start ***** -->
    				<ul class="ml-auto nav">
                        <cfset menuData = cb.rootMenu( type="data", levels="2" )>
						<!--- Iterate and build pages --->
						<cfloop array="#menuData#" index="menuItem">
							<cfif structKeyExists( menuItem, "subPageMenu" )>
								<li class="dropdown">
									<a href="#menuItem.link#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">#menuItem.title# <i class="fa fa-chevron-down"></i></a>
									#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
								</li>
							<cfelse>
								<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
									<li class="active">
								<cfelse>
									<li>
								</cfif>
									<a href="#menuItem.link#">#menuItem.title#</a>
								</li>
							</cfif>
						</cfloop>

						<!--- Blog Link, verify active --->
						<cfif ( !prc.cbSettings.cb_site_disable_blog )>
							<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
								<a href="#cb.linkBlog()#">Blog</a>
							</li>
						</cfif>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li><a href="#parentLink#">#parentTitle#</a></li><li role="separator" class="divider"></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>