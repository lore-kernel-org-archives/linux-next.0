From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use by modules.
Date: Thu, 23 Apr 2009 15:50:06 +0900
Message-ID: <20090423065006.GB21733@linux-sh.org>
References: <20090416030704.GH16961@linux-sh.org> <49E6E816.8010709@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:58357 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbZDWGzQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 02:55:16 -0400
Content-Disposition: inline
In-Reply-To: <49E6E816.8010709@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benny Halevy <bhalevy@panasas.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Apr 16, 2009 at 11:11:02AM +0300, Benny Halevy wrote:
> On Apr. 16, 2009, 6:07 +0300, Paul Mundt <lethal@linux-sh.org> wrote:
> > Caught with the sh allmodconfig:
> > 
> > 	ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
> > 	make[2]: *** [__modpost] Error 1
> > 	make[1]: *** [modules] Error 2
> > 	make: *** [sub-make] Error 2
> > 
> > find_last_bit.o is currently built with lib-y, which ends up breaking
> > the nfs module build after the ("nfs41: free slot") commit. Move it
> > to obj-y so the EXPORT_SYMBOL() actually has some effect.
> > 
> > Signed-off-by: Paul Mundt <lethal@linux-sh.org>
> > Cc: Benny Halevy <bhalevy@panasas.com>
> 
> ACK. and thanks!
> 
> FYI, Fred's original patch can be found here:
> http://patchwork.kernel.org/patch/14572/
> 
> It is also queued in the linux-pnfs tree:
> http://git.linux-nfs.org/?p=bhalevy/linux-pnfs.git;a=commitdiff;h=1e3a7552d9de2ba101b76deed99605f0145fc4d5
> but I haven't submitted it to Trond since I expected
> it to get upstream (and to -next) via linux-kbuild.
> 
> Trond, would you like to pull this change to your nfsv41 branch?
> (should appear before "nfs41: free slot" as Paul noticed)
> 
Ok, so we have two different trivial patches for fixing the same thing,
and a week later it is still broken.

I realize it is a trivial patch, but it does break builds. If folks
aren't going to take these sorts of things more seriously, then their
tree should be dropped after a grace period (say 2 days or so).

Beyond that, it doesn't seem like -next has any sort of coherent policy
for dealing with trivial patches. If the emphasis is on the tree that
introduced the regression to deal with it, then trees need to be
aggressively dropped when these things go unfixed.

Having builds broken for a week for an issue that has been spotted and
fixed by several people is simply unacceptable.
