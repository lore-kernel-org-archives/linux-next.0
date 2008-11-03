From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 3 Nov 2008 16:14:33 +1100
Message-ID: <20081103051433.GS19509@disturbed>
References: <20081103154221.e68a50f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail01.adl6.internode.on.net ([203.16.214.146]:25798 "EHLO
	ipmail01.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750925AbYKCFOi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 00:14:38 -0500
Content-Disposition: inline
In-Reply-To: <20081103154221.e68a50f0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, Lachlan McIlroy <lachlan@sgi.com>, Christoph Hellwig <hch@infradead.org>

On Mon, Nov 03, 2008 at 03:42:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/xfs/linux-2.6/xfs_super.c: In function 'xfs_init_zones':
> fs/xfs/linux-2.6/xfs_super.c:1714: error: 'xfs_vnode_zone' undeclared (first use in this function)
> 
> It is a mismerge (in the linux-next tree) between commits
> 7836dda725873a5ce05d216295a452f16ccaab72 ("[XFS] Combine the XFS and
> Linux inodes") form the xfs tree and
> 200d770048651d9a03266dc1bf031bb6f9e1363a ("Filesystem: XFS slab
> defragmentation") from the slab tree.

I didn't even know that the slab defrag stuff was being carried in
a tree anywhere. The xfs_vnode_zone has gone away, so I guess that
hunk can be dropped. defrag should really now target the xfs_inode_zone,
but it's going to need custom get and kick methods because it's
far different to the generic inode code now....

> I guess the latter patch needs to be dropped since its target is going
> away.
> 
> I fixed up the merge (see below) and can carry the fix for a few days.

Yeah, that will work for the moment. It's probably best that we
don't try to add defrag back into the XFS inode code until we've
sorted all the niggling problems as a result of the "combine..."
patch.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
