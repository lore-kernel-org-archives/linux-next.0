From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: please clean up the livepatching tree
Date: Fri, 5 Aug 2016 15:11:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1608051509570.22028@cbobk.fhfr.pm>
References: <20160803093109.1227bfcd@canb.auug.org.au> <alpine.LNX.2.00.1608030139230.22028@cbobk.fhfr.pm> <20160803112328.671372ef@canb.auug.org.au> <alpine.LNX.2.00.1608031124330.22028@cbobk.fhfr.pm> <s5hk2fvr8uo.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46695 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759705AbcHENLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Aug 2016 09:11:09 -0400
In-Reply-To: <s5hk2fvr8uo.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 5 Aug 2016, Takashi Iwai wrote:

> > Exactly to avoid Linus' tree being polluted by the extra merge commits.
> > 
> > My workflow is really simple -- development happens in (a lot of) topic 
> > branches, and each and every time any of the topic branches is updated by 
> > a new commit, that topic branch gets merged into for-next.
> > 
> > Once code should go to Linus, the branches are merged at once into 
> > 'for-linus' brach, and it's guaranteed to be code-wise the same as what 
> > was gradually appearing in for-next.
> > 
> > What other workflow do you suggest for maintainers like me, who are using 
> > a lot of topic branches?
> 
> Maybe refreshing merges in for-next branch at each time (or day)
> instead of incremental merges?

That slightly breaks for for-next downstreams, but one can successfully 
counter that by the fact that topic branches should be the only ones 
having downstreams, and for-next should be upstream solely for linux-next.

I'll experiment with this during the next cycle.

Thanks,

-- 
Jiri Kosina
SUSE Labs
