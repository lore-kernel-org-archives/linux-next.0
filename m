From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the akpm tree with the vfs tree
Date: Thu, 4 Apr 2013 14:33:47 +0200
Message-ID: <20130404123347.GB26535@quack.suse.cz>
References: <20130404171211.3d359e39ca54e074f122d541@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130404171211.3d359e39ca54e074f122d541@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

On Thu 04-04-13 17:12:11, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got conflicts in mm/filemap.c,
> fs/xfs/xfs_file.c, fs/splice.c, fs/ocfs2/file.c, fs/ntfs/file.c,
> fs/fuse/file.c, fs/cifs/file.c and fs/btrfs/file.c between commit
> 36bd5dc0c4e2 ("lift sb_start_write/sb_end_write out of ->aio_write()")
> from the vfs tree and commit "fs: return EAGAIN when O_NONBLOCK write
> should block on frozen fs" from the akpm tree.
> 
> The former was removing the code modified by the letter, so I just
> dropped the akpm tree patch and the following "ocfs2: add freeze
> protection to ocfs2_file_splice_write()".
  Yeah, Al has been changing the area significantly. Andrew, you can drop
the three relevant patches from -mm since they'll have to be redone. ocfs2
should be actually fixed by Al's changes, psacct freeze remains but fixing
it will become trivial...

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
