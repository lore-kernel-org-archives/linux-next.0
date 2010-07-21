From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: OOPS at boot time
Date: Wed, 21 Jul 2010 14:11:17 +0200
Message-ID: <20100721121116.GD3447@quack.suse.cz>
References: <20100720164145.e06242b3.sfr@canb.auug.org.au>
 <20100720033656.0ce6356f.akpm@linux-foundation.org>
 <20100720224525.GO32635@dastard>
 <20100720174424.12a4bf64.akpm@linux-foundation.org>
 <20100721052007.GT32635@dastard>
 <20100721002907.639802cd.akpm@linux-foundation.org>
 <20100721174809.4781c244.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100721174809.4781c244.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

On Wed 21-07-10 17:48:09, Stephen Rothwell wrote:
> On Wed, 21 Jul 2010 00:29:07 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 21 Jul 2010 15:20:07 +1000 Dave Chinner <david@fromorbit.com> wrote:
> > 
> > > > and they were dirtied within dquot_free_space().
> > > 
> > > AFAICT dquot_free_space() is called deep in the guts of
> > > ext3_truncate() via dquot_free_block(), which is called directly
> > > before end_writeback(). That should overwrite any state changes made
> > > inside ext3_truncate. I wonder if iput_final() is racing with
> > > something else here?
> > > 
> > 
> > This isn't a race.  I type `make' and the warnings spew out at hundreds
> > per second - every unlink, I'd say.
> 
> Bisected to:
> 
> commit 8bfe4a06746e5f03c02afe3ceb97b5364c099f63
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Jun 6 07:08:19 2010 -0400
> 
>     convert ext3 to ->evict_inode()
>     
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
  Thanks for bisecting this. The patch series indeed seems to uncover
some discrepancies.
  Ext3 has always dirtied inode in it's ->delete_inode method (via quota
code). But previously clear_inode() just overwrote the state with I_CLEAR
and thus we never saw the BUG_ON. After Al's patches, i_state is set in
end_writeback() which happens earlier. In particular it happens before
ext3_free_inode() which dirties the inode through quota code while freeing
xattrs - they are accounted in i_blocks, so i_blocks are updated during
freeing and inode is dirtied.
  Actually, ext3_mark_inode_dirty() called during each mark_inode_dirty()
call writes the inode state to the journal so the dirty flag in the inode
state is in fact stale and overwriting it with I_CLEAR never mattered. In
this sense, the BUG_ON triggered is a false positive. But I believe this is
a separate story.
  I'm not sure how to really fix this. It seems a bit premature to me to
mark inode as I_CLEAR before the filesystem is actually done with it. So
maybe the line
  inode->i_state = I_FREEING | I_CLEAR;
should be moved to evict() fuction?

								Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
