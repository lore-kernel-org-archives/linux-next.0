From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please clean up the livepatching tree
Date: Wed, 3 Aug 2016 11:23:28 +1000
Message-ID: <20160803112328.671372ef@canb.auug.org.au>
References: <20160803093109.1227bfcd@canb.auug.org.au>
	<alpine.LNX.2.00.1608030139230.22028@cbobk.fhfr.pm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47353 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754264AbcHCBeS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2016 21:34:18 -0400
In-Reply-To: <alpine.LNX.2.00.1608030139230.22028@cbobk.fhfr.pm>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

On Wed, 3 Aug 2016 01:41:17 +0200 (CEST) Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 3 Aug 2016, Stephen Rothwell wrote:
> 
> > The livepatching tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/livepatching#for-next)
> > today consists of only lots of merges   
> 
> This is a part we keep discussing from time to time, and I still don't 
> understand why it bothers you so much. The only reason is to keep the 
> branch non-rebasing, because it has downstreams. Code-wise, it's always 
> equivalent to what end up being merged, but without the actual superfluous 
> merge commits.

The problem from my point of view is that git seems to take more time
to merge the tree into linux-next (I know this isn't much for just one
tree, but I currently have over 200 trees to merge each day).  Also,
having all those extra merges complicates the structure of my tree and
presumably makes it harder for git to merge other trees.  Its also
possible (I have seen this in other trees) for the merge commits
themselves to generate conflicts with (merge) commits in Linus' and
other trees.

Also, I am not sure why you have a branch that ask Linus to merge
separate from the branch you have me merge?

> > (and a patch that is also reverted).  
> 
> This of course is a good justification to rebase for-next exceptionally; 
> so I've just that.

Thanks.

-- 
Cheers,
Stephen Rothwell
