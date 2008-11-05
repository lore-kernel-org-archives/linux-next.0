From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: xfs tree build failure
Date: Thu, 6 Nov 2008 07:47:54 +1100
Message-ID: <20081105204754.GO4985@disturbed>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au> <20081030090832.GQ17077@disturbed> <20081105132000.4e560cad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail01.adl6.internode.on.net ([203.16.214.146]:5956 "EHLO
	ipmail01.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756605AbYKEUr6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 15:47:58 -0500
Content-Disposition: inline
In-Reply-To: <20081105132000.4e560cad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org, hch@infradead.org

On Wed, Nov 05, 2008 at 01:20:00PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Thu, 30 Oct 2008 20:08:32 +1100 Dave Chinner <david@fromorbit.com> wrote:
> >
> > On Thu, Oct 30, 2008 at 01:23:24PM +1100, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > 
> > > ERROR: "inode_wait" [fs/xfs/xfs.ko] undefined!
> > > 
> > > Caused by commit 676a7711ee281c3bf41db18e29e296584de82793 ("[XFS] Fix
> > > race when looking up reclaimable inodes") which introduced a use of
> > > wait_on_inode() which is an inline that calls inode_wait().
> > 
> > Putting a non-exported symbol in an inline function in a header file
> > that is full of exported functions.  That's pretty anti-social. ;)
> > 
> > > I applied the following patch (probably wrong :-)).
> > 
> > I think it's probably the only solution - we need to wait until
> > the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
> > is the only way to do it.
> 
> Any resolution?

I was waiting on a comment from Christoph. I'll cc him directly this
time ;)

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
