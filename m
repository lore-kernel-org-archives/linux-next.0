From: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: linux-next: duplicate patches in the gfs2 and xfs trees
Date: Thu, 12 Jul 2018 04:30:07 +0200
Message-ID: <CAHc6FU7jM=j6c028ycJS_NiaeOYMH3ofNeTJZxJ78iphujL0WQ@mail.gmail.com>
References: <20180712113724.413e4a3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712113724.413e4a3f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi,

On 12 July 2018 at 03:37, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> It looks like part of the xfs tree (the iomap-4.19-merge branch) that
> was merge into the gfs2 tree has been rebased and the gfs2 tree has not
> been updated to cope.  The rebase commits are exactly the same patches
> (though I didn't check to see if any of the commit messages had changed).

this is what I'm seeing (git log --pretty=oneline --abbrev-commit
--graph ^origin/master gfs2/for-next):

* f79caf101801 (gfs2/for-next) gfs2: use iomap_readpage for blocksize
== PAGE_SIZE
* af58827ee500 gfs2: Use iomap for stuffed direct I/O reads
*   c38e838abe42 Merge branch 'iomap-4.19-merge' into linux-gfs2/for-next
|\
| * 806a1477b10a (xfs/iomap-4.19-merge) iomap: add inline data support
to iomap_readpage_actor
| * ec181f6782d8 iomap: support direct I/O to inline data
| * 09230435dffd iomap: refactor iomap_dio_actor
| * c03cea42149d iomap: add initial support for writes without buffer heads
| * 72b4daa24129 iomap: add an iomap-based readpage and readpages implementation
* | 9ab5aa4f4e10 gfs2: fallocate_chunk: Always initialize struct iomap
* | 2e2834ef1797 GFS2: Fix recovery issues for spectators
* |   5db0147b887e Merge branch 'iomap-write' into linux-gfs2/for-next
|\ \
| * | 025d0e7f73c6 (gfs2/iomap-write) gfs2: Remove gfs2_write_{begin,end}
| * | 967bcc91b044 gfs2: iomap direct I/O support
| * | bcfe94139a45 gfs2: gfs2_extent_length cleanup
| * | 64bc06bb32ee gfs2: iomap buffered write support
| * | d505a96a3b16 gfs2: Further iomap cleanups
| |/
| * e184fde6f3f5 iomap: add private pointer to struct iomap
| * 63899c6f8851 iomap: add a page_done callback
| * 19e0c58f6552 iomap: generic inline data handling
| * ebf00be37de3 iomap: complete partial direct I/O writes synchronously
| * 3d7b6b21f6c5 iomap: mark newly allocated buffer heads as new
| * a6d639da63ae fs: factor out a __generic_write_end helper
* 3beacef8093b fs: gfs2: Adding new return type vm_fault_t
* d80ff78468e4 gfs2: using posix_acl_xattr_size instead of posix_acl_to_xattr
* e904f3d486f9 gfs2: Don't reject a supposedly full bitmap if we have
blocks reserved
* d1475c07f7ce GFS2: rgrp free blocks used incorrectly
* b7eba890a228 gfs2: Eliminate redundant ip->i_rgd
* 03f8c41c73da gfs2: Stop messing with ip->i_rgd in the rlist code
* ee9c7f9ae3d4 gfs2: call ktime_get_coarse_real_ts64() directly
* 00251a16d7f9 gfs2: Minor clarification to __gfs2_punch_hole
* 9e1a9ecd13b9 gfs2: Don't withdraw under a spin lock
* f85c10e24ab9 gfs2: eliminate rs_inum and reduce the size of gfs2 inodes

Commit e184fde6f3f5 "iomap: add private pointer to struct iomap" is on
xfs/iomap-4.19-merge. That was my initial merge from
xfs/iomap-4.19-merge, but it was a fast-forward so there is no merge
commit. I've then merged our iomap-write branch into for-next, with
two additional commits on top. Then comes the rest of
xfs/iomap-4.19-merge (that branch has moved ahead in the meantime),
again with two more commits on top.

There are no rebased commits, you're looking at the exact same commits.

I could redo for-next and add an explicit merge commit with one parent
instead of the fast-forward merge; would that be preferable?

Thanks,
Andreas
