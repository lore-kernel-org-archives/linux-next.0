From: Jeff Layton <jlayton@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree (nfsd
 tree related)
Date: Wed, 3 Apr 2013 07:38:57 -0400
Message-ID: <20130403073857.78c2a24f@tlielax.poochiereds.net>
References: <20130403174219.0786d27109633a30d89b38bf@canb.auug.org.au>
	<20130403071054.45a02a88@tlielax.poochiereds.net>
	<20130403113301.GA13951@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47814 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760075Ab3DCLjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Apr 2013 07:39:08 -0400
In-Reply-To: <20130403113301.GA13951@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 3 Apr 2013 07:33:01 -0400
"J. Bruce Fields" <bfields@fieldses.org> wrote:

> On Wed, Apr 03, 2013 at 07:10:54AM -0400, Jeff Layton wrote:
> > On Wed, 3 Apr 2013 17:42:19 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi all,
> > > 
> > > After merging the final tree, today's linux-next build (arm defconfig)
> > > failed like this:
> > > 
> > > fs/built-in.o: In function `nfsd_reply_cache_stats_show':
> > > super.c:(.text+0x87308): undefined reference to `__udivdi3'
> > > 
> > > Probably caused by commit 187da2f90879 ("nfsd: keep track of the max and
> > > average time to search the cache") which adds a divide by u64
> > > (num_searches).
> > > 
> > > I have reverted that commit and the following one for today.
> > 
> > Thanks, known problem...
> > 
> > Looks like Bruce's tree has an older version of that patch series. I
> > think we just need to get him to drop that one and merge the new one.
> 
> Arrgh, sorry--could you remind me which is the new one?
> 

It was the one I sent on 3/19. Those patches (plus a couple more) are
also in the current nfsd-3.10 branch of my git tree too, so it may be
easiest to just pick them from there.

Thanks,
-- 
Jeff Layton <jlayton@redhat.com>
