From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: Linux-next parallel cp workload hang
Date: Wed, 18 May 2016 03:06:49 +0100
Message-ID: <20160518020649.GO14480@ZenIV.linux.org.uk>
References: <20160518013802.GA4679@ZX.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:51858 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751662AbcERCGw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 May 2016 22:06:52 -0400
Content-Disposition: inline
In-Reply-To: <20160518013802.GA4679@ZX.nay.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, inux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Dave Chinner <david@fromorbit.com>

[dchinner Cc'd]

On Wed, May 18, 2016 at 09:38:02AM +0800, Xiong Zhou wrote:
> Hi,
> 
> Parallel cp workload (xfstests generic/273) hangs like blow.
> It's reproducible with a small chance, less the 1/100 i think.
> 
> Have hit this in linux-next 20160504 0506 0510 trees, testing on
> xfs with loop or block device. Ext4 survived several rounds
> of testing.
> 
> Linux next 20160510 tree hangs within 500 rounds testing several
> times. The same tree with vfs parallel lookup patchset reverted
> survived 900 rounds testing. Reverted commits are attached.
> 
> Bisecting in this patchset ided this commit:
> 
> 3b0a3c1ac1598722fc289da19219d14f2a37b31f is the first bad commit
> commit 3b0a3c1ac1598722fc289da19219d14f2a37b31f
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Wed Apr 20 23:42:46 2016 -0400
> 
>     simple local filesystems: switch to ->iterate_shared()
>     
>     no changes needed (XFS isn't simple, but it has the same parallelism
>     in the interesting parts exercised from CXFS).
>     
> With this commit reverted on top of Linux next 0510 tree, 5000+ rounds
> of testing passed.

Joy...  So much for CXFS testing, probably...  All that commit changes for
XFS is allowing xfs_readdir() to be called in parallel for different struct
file.  We can always revert the XFS part, of course, but it would be
interesting to find out what happens to be dependent on external exclusion
there.
