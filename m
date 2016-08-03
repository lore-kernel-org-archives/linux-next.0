From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: please clean up the livepatching tree
Date: Wed, 3 Aug 2016 11:29:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1608031124330.22028@cbobk.fhfr.pm>
References: <20160803093109.1227bfcd@canb.auug.org.au> <alpine.LNX.2.00.1608030139230.22028@cbobk.fhfr.pm> <20160803112328.671372ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52506 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757675AbcHCKo0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Aug 2016 06:44:26 -0400
In-Reply-To: <20160803112328.671372ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 3 Aug 2016, Stephen Rothwell wrote:

> > This is a part we keep discussing from time to time, and I still don't 
> > understand why it bothers you so much. The only reason is to keep the 
> > branch non-rebasing, because it has downstreams. Code-wise, it's 
> > always equivalent to what end up being merged, but without the actual 
> > superfluous merge commits.
> 
> The problem from my point of view is that git seems to take more time
> to merge the tree into linux-next (I know this isn't much for just one
> tree, but I currently have over 200 trees to merge each day).  

Because of merge commits the number of which is below 100? That's an 
interesting observation and quite unexpected bottleneck in git.

> Also, having all those extra merges complicates the structure of my tree 
> and presumably makes it harder for git to merge other trees.  Its also 
> possible (I have seen this in other trees) for the merge commits 
> themselves to generate conflicts with (merge) commits in Linus' and 
> other trees.
> 
> Also, I am not sure why you have a branch that ask Linus to merge 
> separate from the branch you have me merge?

Exactly to avoid Linus' tree being polluted by the extra merge commits.

My workflow is really simple -- development happens in (a lot of) topic 
branches, and each and every time any of the topic branches is updated by 
a new commit, that topic branch gets merged into for-next.

Once code should go to Linus, the branches are merged at once into 
'for-linus' brach, and it's guaranteed to be code-wise the same as what 
was gradually appearing in for-next.

What other workflow do you suggest for maintainers like me, who are using 
a lot of topic branches?

If this is so bothering for you, I'd just start instructing for-next 
downstreams to stop using that branch so that it could be easily rebased.

Thanks,

-- 
Jiri Kosina
SUSE Labs
