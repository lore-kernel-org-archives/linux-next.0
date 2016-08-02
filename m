From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: please clean up the livepatching tree
Date: Wed, 3 Aug 2016 01:41:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1608030139230.22028@cbobk.fhfr.pm>
References: <20160803093109.1227bfcd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160803093109.1227bfcd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen

On Wed, 3 Aug 2016, Stephen Rothwell wrote:

> The livepatching tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/livepatching#for-next)
> today consists of only lots of merges 

This is a part we keep discussing from time to time, and I still don't 
understand why it bothers you so much. The only reason is to keep the 
branch non-rebasing, because it has downstreams. Code-wise, it's always 
equivalent to what end up being merged, but without the actual superfluous 
merge commits.

> (and a patch that is also reverted).

This of course is a good justification to rebase for-next exceptionally; 
so I've just that.

Thanks,

-- 
Jiri Kosina
SUSE Labs
