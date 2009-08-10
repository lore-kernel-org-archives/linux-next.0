From: Trond Myklebust <Trond.Myklebust@netapp.com>
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
Date: Mon, 10 Aug 2009 14:08:52 -0400
Message-ID: <1249927732.21816.5.camel@heimdal.trondhjem.org>
References: <20090810105851.80333493.sfr@canb.auug.org.au>
	 <20090810160537.GD3401@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.netapp.com ([216.240.18.37]:10591 "EHLO mx2.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751086AbZHJSKB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Aug 2009 14:10:01 -0400
In-Reply-To: <20090810160537.GD3401@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>

On Mon, 2009-08-10 at 12:05 -0400, J. Bruce Fields wrote:
> On Mon, Aug 10, 2009 at 10:58:51AM +1000, Stephen Rothwell wrote:
> > Hi Bruce,
> > 
> > Today's linux-next merge of the nfsd tree got a conflict in
> > net/sunrpc/cache.c between commit
> > 173912a6add00f4715774dcecf9ee53274c5924c ("SUNRPC: Move procfs-specific
> > stuff out of the generic sunrpc cache code") from the nfs tree and commit
> > f866a8194f7cbabb9135b98b9ac7d26237b88367 ("sunrpc/cache: rename
> > queue_loose to cache_dequeue") from the nfsd tree.
> 
> OK, thanks.
> 
> Looks like there may be some less trivial conflicts now, though.  Trond,
> maybe you could rebase the cache stuff against my latest for-2.6.32?

I've merged your for-2.6.32 into a dedicated sunrpc_cache-for_next topic
branch and pushed that out as part of the NFS client linux-next.

-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust@netapp.com
www.netapp.com
