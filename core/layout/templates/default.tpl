{include:core/layout/templates/head.tpl}

<body class="{$LANGUAGE} background" itemscope itemtype="http://schema.org/WebPage">
	<div id="container">
		<header id="header">
			{* Logo *}
			<div id="logo">
			    <h1><a href="/">{$siteTitle}</a></h1>
			</div>

			{* Navigation *}
			<nav id="navigation">
			    <div id="currentPage"></div>
			    <div id="navigationList">
			    	{$var|getnavigation:'page':0:1}
			    </div>
			</nav>
		</header>

		<div id="contentWrapper" class="clearfix">
			<div id="main" class="content">
				<div class="inner">
			    	{* Main position *}
			    	{iteration:positionMain}
			    	    {option:positionMain.blockIsHTML}
			    	    				{$positionMain.blockContent}
			    	    {/option:positionMain.blockIsHTML}
			    	    {option:!positionMain.blockIsHTML}
			    	    	{$positionMain.blockContent}
			    	    {/option:!positionMain.blockIsHTML}
			    	{/iteration:positionMain}
			    </div>
			</div>
			<div id="right" class="content">
				<div class="inner">
					{* Right position *}
			    	{iteration:positionRight}
			    	    {option:positionRIght.blockIsHTML}
			    	    				{$positionRight.blockContent}
			    	    {/option:positionRight.blockIsHTML}
			    	    {option:!positionRight.blockIsHTML}
			    	    	{$positionRight.blockContent}
			    	    {/option:!positionRight.blockIsHTML}
			    	{/iteration:positionRight}
				</div>
			</div>
			<noscript>
			    <div class="message notice">
			    	<h4>{$lblEnableJavascript|ucfirst}</h4>
			    	<p>{$msgEnableJavascript}</p>
			    </div>
			</noscript>
		</div>
	</div>
	{include:core/layout/templates/footer.tpl}

	{* General Javascript *}
	{iteration:jsFiles}
		<script src="{$jsFiles.file}"></script>
	{/iteration:jsFiles}

	{* Theme specific Javascript *}
	<script src="{$THEME_URL}/core/js/chameleon.js"></script>
	<!--[if !IE]> --><script src="{$THEME_URL}/core/js/ios-orientationchange-fix.js" type="text/javascript"></script><!-- <![endif]-->

	{* Site wide HTML *}
	{$siteHTMLFooter}
</body>
</html>