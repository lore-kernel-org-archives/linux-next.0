From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Date: Tue, 19 Jul 2011 11:29:23 +1000
Message-ID: <20110719012923.GI30254@dastard>
References: <20110718133636.579d9002dbb56cd6408a2a7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110718133636.579d9002dbb56cd6408a2a7b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Chinner <dchinner@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 18, 2011 at 01:36:36PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/xfs/linux-2.6/xfs_super.c between commit 2bcf6e970f5a ("xfs: start
> periodic workers later") from the xfs tree and commit d86b98f73104 ("xfs:
> make use of new shrinker callout for the inode cache") from the vfs tree.
> 
> I fixed it up (I think, see below) and can carry the fix as necessary.

Looks OK to me.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
