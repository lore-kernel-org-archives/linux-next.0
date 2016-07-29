From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Fri, 29 Jul 2016 05:18:22 +0100
Message-ID: <20160729041822.GX2356@ZenIV.linux.org.uk>
References: <20160729111938.56ee0fa1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:38356 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219AbcG2ES0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2016 00:18:26 -0400
Content-Disposition: inline
In-Reply-To: <20160729111938.56ee0fa1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Jul 29, 2016 at 11:19:38AM +1000, Stephen Rothwell wrote:
> ---
>  fs/fuse/dir.c    | 2 +-
>  fs/fuse/fuse_i.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index f910578e51ba..c47b7780ce37 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -935,7 +935,7 @@ int fuse_update_attributes(struct inode *inode, struct kstat *stat,
>  }
>  
>  int fuse_reverse_inval_entry(struct super_block *sb, u64 parent_nodeid,
> -			     u64 child_nodeid, const struct qstr *name)
> +			     u64 child_nodeid, struct qstr *name)
>  {
>  	int err = -ENOTDIR;
>  	struct inode *parent;

I'm not sure if it's the best way to handle that, TBH...  It might be better
to pass name.name/name.len separately here.  Both callers have a _lot_ of
code duplication; I've a patch getting rid of code duplication there, will
play with it and see if it would make sense to quit messing with struct
qstr while we are at it.

BTW, I'd been toying with the following trick:

static inline const struct qstr *d_name(const struct dentry *dentry)
{
	return &dentry->d_name;
}
with subsequent switch of dentry->d_name.foo to d_name(dentry)->foo and
&dentry->d_name to d_name(dentry).  Note 'const' in the above - the point is,
there are very few places where dentry->d_name can be legitimately modified
(__d_alloc(), swap_names() and copy_name()) and it'd be nice to have cc(1)
enforce that.  Changing d_name to const struct qstr (and explicitly casting
in the aforementioned 3 functions) would do it, but it's deep in nasal daemon
territory; OTOH, conversion to the helper above with subsequent renaming of
the field to something easily greppable for would get the same effect and
stay within standard C.

FWIW, the whole "constify struct qstr * arguments" series is due to hunting
for ppc bug reported a while ago; it manifested as NULL ->d_name.name observed
in __d_lookup_rcu().  AFAICS, it's an effect of earlier memory corruption,
seeing that there was list_del() in prune_dcache_sb() hitting NULL ->prev->next
(in __list_del_entry(), probably via prune_dcache_sb()->shrink_dentry_list()->
d_shrink_del()->list_del_init(&dentry->d_lru)), but it would be nice to have
an easier way to prove that nothing would be able to bugger ->d_name.
