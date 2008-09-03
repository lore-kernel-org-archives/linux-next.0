From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 3 Sep 2008 00:04:18 -0700
Message-ID: <20080903000418.aa2434fe.akpm@linux-foundation.org>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>
	<20080903063419.GK20055@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42002 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751633AbYICHEm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 03:04:42 -0400
In-Reply-To: <20080903063419.GK20055@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, 3 Sep 2008 08:34:21 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:

> On Wed, Sep 03 2008, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > block/genhd.c: In function 'show_partition':
> > block/genhd.c:718: error: 'struct hd_struct' has no member named 'private'
> > block/genhd.c:719: warning: passing argument 1 of 'seq_puts' from incompatible pointer type
> > block/genhd.c:720: error: 'struct hd_struct' has no member named 'private'
> > 
> > Caused by the merge because commit
> > ddef43a843f620c6742a06633739887a901ec06b ("block: restore original
> > behavior of /proc/partition when there's no partition") added references
> > to the 'private' member.  I removed the offending section of code (see
> > below) assuming the fix referred to in the comment has be done in the
> > block tree.
> 
> I'm in the very midst of updating to latest -git, I'll push it out in 5
> minutes or so. It'll also solve the two latest conflicts you saw.
> 

I get a nasty git reject around disk_seqf_next() from -next-20080902
and have yet to find a fix which doesn't oops all over the place. 

Am presently discommoded.  Please let this be fixed in -next-20080903 :(
