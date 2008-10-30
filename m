From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: xfs tree build failure
Date: Thu, 30 Oct 2008 20:08:32 +1100
Message-ID: <20081030090832.GQ17077@disturbed>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl2.internode.on.net ([203.16.214.145]:45984 "EHLO
	ipmail05.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752532AbYJ3JIg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 05:08:36 -0400
Content-Disposition: inline
In-Reply-To: <20081030132324.0d619fdd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org

On Thu, Oct 30, 2008 at 01:23:24PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> ERROR: "inode_wait" [fs/xfs/xfs.ko] undefined!
> 
> Caused by commit 676a7711ee281c3bf41db18e29e296584de82793 ("[XFS] Fix
> race when looking up reclaimable inodes") which introduced a use of
> wait_on_inode() which is an inline that calls inode_wait().

Putting a non-exported symbol in an inline function in a header file
that is full of exported functions.  That's pretty anti-social. ;)

> I applied the following patch (probably wrong :-)).

I think it's probably the only solution - we need to wait until
the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
is the only way to do it.

Christoph?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
