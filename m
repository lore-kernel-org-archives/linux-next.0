From: Dave Chinner <david@fromorbit.com>
Subject: Re: Linux-next parallel cp workload hang
Date: Wed, 18 May 2016 19:54:09 +1000
Message-ID: <20160518095409.GX26977@dastard>
References: <20160518014615.GA5302@ZX.nay.redhat.com>
 <20160518055634.GW26977@dastard>
 <20160518083150.GB6551@dhcp12-144.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail07.adl2.internode.on.net ([150.101.137.131]:59946 "EHLO
	ipmail07.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751583AbcERJyO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 05:54:14 -0400
Content-Disposition: inline
In-Reply-To: <20160518083150.GB6551@dhcp12-144.nay.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Wed, May 18, 2016 at 04:31:50PM +0800, Xiong Zhou wrote:
> Hi,
> 
> On Wed, May 18, 2016 at 03:56:34PM +1000, Dave Chinner wrote:
> > On Wed, May 18, 2016 at 09:46:15AM +0800, Xiong Zhou wrote:
> > > Hi,
> > > 
> > > Parallel cp workload (xfstests generic/273) hangs like blow.
> > > It's reproducible with a small chance, less the 1/100 i think.
> > > 
> > > Have hit this in linux-next 20160504 0506 0510 trees, testing on
> > > xfs with loop or block device. Ext4 survived several rounds
> > > of testing.
> > > 
> > > Linux next 20160510 tree hangs within 500 rounds testing several
> > > times. The same tree with vfs parallel lookup patchset reverted
> > > survived 900 rounds testing. Reverted commits are attached.  > 
> > What hardware?
> 
> A HP prototype host.

description? cpus, memory, etc? I want to have some idea of what
hardware I need to reproduce this...

xfs_info from the scratch filesystem would also be handy.

> > Can you reproduce this with CONFIG_XFS_DEBUG=y set? if you can, and
> > it doesn't trigger any warnings or asserts, can you then try to
> > reproduce it while tracing the following events:
> > 
> > 	xfs_buf_lock
> > 	xfs_buf_lock_done
> > 	xfs_buf_trylock
> > 	xfs_buf_unlock
> > 
> > So we might be able to see if there's an unexpected buffer
> > locking/state pattern occurring when the hang occurs?
> 
> Yes, i've reproduced this with both CONFIG_XFS_DEBUG=y and the tracers
> on. There are some trace output after hang for a while.

I'm not actually interested in the trace after the hang - I'm
interested in what happened leading up to the hang. The output
you've given me tell me that the directory block at offset is locked
but nothing in the trace tells me what locked it.

Can I suggest using trace-cmd to record the events, then when the
test hangs kill the check process so that trace-cmd terminates and
gathers the events. Then dump the report to a text file and attach
that?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
