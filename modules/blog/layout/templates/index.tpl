{*
	variables that are available:
	- {$items}: contains an array with all posts, each element contains data about the post
*}

{option:!items}
	<div id="blogIndex">
		<section class="mod">
			<div class="inner">
				<div class="bd content">
					<p>{$msgBlogNoItems}</p>
				</div>
			</div>
		</section>
	</div>
{/option:!items}
{option:items}
	<div id="blogIndex">
		{iteration:items}
			<article class="mod clearfix">
				<div class="inner">
					<header class="hd">
						<div class="blogPostInfo">
						<ul>
							<li>
								{* Written on *}
								<span class="day">
								{$items.publish_on|date:'d':{$LANGUAGE}}</span><br/>{$items.publish_on|date:'m':{$LANGUAGE}}
							</li>
							<li class="background commentCount">
								{* Comments *}
								{option:!items.comments}<a href="{$items.full_url}#{$actComment}">0</a>{/option:!items.comments}
								{option:items.comments}
									<span class="commentNumber">
									{option:items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$items.comments_count}</a>{/option:items.comments_multiple}
									{option:!items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$msgBlogOneComment}</a>{/option:!items.comments_multiple}			</span>
								{/option:items.comments}
							</li>
						</ul>
						</div>
					</header>
					<div class="blogPost bd content">
						<h2><a href="{$items.full_url}" title="{$items.title}">{$items.title}</a></h2>

						<div class="author">
							{* Written by *}
							{$msgWrittenBy|ucfirst|sprintf:{$items.user_id|usersetting:'nickname'}}

							{* Category*}
							{$lblIn} {$lblThe} {$lblCategory} <a href="{$items.category_full_url}" title="{$items.category_title}">{$items.category_title}</a>{option:!items.tags}.{/option:!items.tags}

							{* Tags *}
							{option:items.tags}
							    {$lblWith} {$lblThe} {$lblTags}
							    {iteration:items.tags}
							    	<a href="{$items.tags.full_url}" rel="tag" title="{$items.tags.name}">{$items.tags.name}</a>{option:!items.tags.last}, {/option:!items.tags.last}{option:items.tags.last}.{/option:items.tags.last}
							    {/iteration:items.tags}
							{/option:items.tags}
						</div>

						{option:items.image}<img src="{$FRONTEND_FILES_URL}/blog/images/source/{$items.image}" alt="{$items.title}" />{/option:items.image}
						{option:!items.introduction}{$items.text}{/option:!items.introduction}
						{option:items.introduction}{$items.introduction}{/option:items.introduction}
					</div>
				</div>
			</article>
		{/iteration:items}
	</div>
	{include:core/layout/templates/pagination.tpl}
{/option:items}
