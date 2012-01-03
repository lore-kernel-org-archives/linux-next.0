From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the xfs tree with Linus' tree
Date: Tue, 3 Jan 2012 12:34:38 +1100
Message-ID: <20120103013438.GR23662@dastard>
References: <20120103120632.a43a2ab50ac747093bbb2f5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl6.internode.on.net ([150.101.137.143]:51143 "EHLO
	ipmail05.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750860Ab2ACBem (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jan 2012 20:34:42 -0500
Content-Disposition: inline
In-Reply-To: <20120103120632.a43a2ab50ac747093bbb2f5f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Ben Myers <bpm@sgi.com>

On Tue, Jan 03, 2012 at 12:06:32PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in
> fs/xfs/xfs_sync.c between commit be4f1ac82877 ("xfs: log all dirty inodes
> in xfs_fs_sync_fs") from the  tree and commit 34625c661b01 ("xfs: remove
> xfs_qm_sync") from the xfs tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks correct. Thanks Stephen.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
