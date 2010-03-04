From: Alex Elder <aelder@sgi.com>
Subject: Re: [PATCH] Re: linux-next: build warning after merge of the xfs
 tree
Date: Thu, 04 Mar 2010 10:24:24 -0600
Message-ID: <1267719864.3998.22.camel@doink>
References: <20100304111930.86f7cc62.sfr@canb.auug.org.au>
	 <20100304005709.GE14317@discord.disaster>
Reply-To: aelder@sgi.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:58709 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754295Ab0CDQZE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Mar 2010 11:25:04 -0500
In-Reply-To: <20100304005709.GE14317@discord.disaster>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Thu, 2010-03-04 at 11:57 +1100, Dave Chinner wrote:
> On Thu, Mar 04, 2010 at 11:19:30AM +1100, Stephen Rothwell wrote:
> > Hi Dave,
> > 
> > After merging the xfs tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > fs/xfs/linux-2.6/xfs_aops.c: In function 'xfs_end_io':
> > fs/xfs/linux-2.6/xfs_aops.c:232: warning: 'error' may be used uninitialized in this function
> > 
> > Introduced by commit 77d7a0c2eeb285c9069e15396703d0cb9690ac50 ("xfs:
> > Non-blocking inode locking in IO completion").
> > 
> > I can't tell if this is a false positive.  If the first two "if"
> > statement bodies are skipped, then error is tested uninitialised.  It is
> > possible that at least one of them has to be executed.
> 
> Right, there is a warning being generated there - I thought I fixed
> that immediately after posting the first version of the patch. The
> second version:
> 
> http://oss.sgi.com/archives/xfs/2010-02/msg00340.html
> 
> definitely had it fixed.
> 
> Alex, can you make sure you take the entire patch rather than
> cutting and pasting bits from one patch version to another?  That
> way you don't miss small changes to the patch that might have been
> forgotten about....

(Sorry if this gets duplicated--I was using a web-based mail
interface yesterday and my first attempt got bounced back
as potential spam.)

I didn't expect you would change the patch content, only
the description.  I had already tested the previous code
so just grabbed the new description when you re-posted.
Sorry about the warning slipping through.  I'll incorporate
your fix soon.
        
                                       -Alex
        
