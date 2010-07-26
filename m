From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Date: Mon, 26 Jul 2010 13:59:50 +1000
Message-ID: <20100726035950.GE7362@dastard>
References: <20100726115116.1e6de038.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bld-mail15.adl6.internode.on.net ([150.101.137.100]:32905 "EHLO
	mail.internode.on.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752727Ab0GZEAF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 00:00:05 -0400
Content-Disposition: inline
In-Reply-To: <20100726115116.1e6de038.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, xfs-masters@oss.sgi.com

On Mon, Jul 26, 2010 at 11:51:16AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> [These became irrelevant when I reverted the xfs tree for a build error,
> but will be done when the xfs tree is fixed.]
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/xfs/linux-2.6/xfs_aops.c between commit
> 7346e1197eb76e22199b6b4625f129331e0fd7ac ("xfs simplify and speed up
> direct I/O completions") from the xfs tree and commit
> b682ce06449c35a85dc5e63fcaab7dba2ba6df9b ("sort out blockdev_direct_IO
> variants") from the vfs tree.
> 
> Also between commit 6f6b39eb706f5617750cf02952e4e6d7470c40bf ("xfs: use
> GFP_NOFS for page cache allocation") from the xfs tree and commit
> 4478b21470275454f9eb6f590dfe7cc54d643978 ("get rid of
> block_write_begin_newtrunc") from the vfs tree.
> 
> I fixed them up (I think - see below) and can carry the fix as necessary.

The fix looks OK. Thanks Stephen.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
