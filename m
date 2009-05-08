From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Fri, 8 May 2009 18:50:27 +0100
Message-ID: <20090508175027.GC8633@ZenIV.linux.org.uk>
References: <20090508144457.c88fc3dc.sfr@canb.auug.org.au> <E1M2QJl-00035r-E2@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:36969 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994AbZEHRud (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2009 13:50:33 -0400
Content-Disposition: inline
In-Reply-To: <E1M2QJl-00035r-E2@pomaz-ex.szeredi.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, hch@lst.de, tj@kernel.org

On Fri, May 08, 2009 at 03:40:49PM +0200, Miklos Szeredi wrote:
> On Fri, 8 May 2009, Stephen Rothwell wrote:
> > Today's linux-next merge of the vfs tree got a conflict in
> > fs/fuse/inode.c between commit a325f9b92273d6c64ec56167905b951b9827ec33
> > ("fuse: update fuse_conn_init() and separate out fuse_conn_kill()") from
> > the fuse tree and commit 4225d95ddb751e09da0c145b58549da95ba13e3a ("push
> > BKL down into ->put_super") from the vfs tree.
> > 
> > I fixed it up (see below - please check) and can carry the fix as
> > necessary.
> 
> The fixup looks good.
> 
> Al, would it make sense to merge the fuse tree into the vfs tree at
> some point to fix the conflict permanently?

Hmm...  Doable, of course, but I really wonder if that's the right
way to deal with this one.  The thing is, looking at the current VFS
tree I see very few places where FUSE gets called with BKL (essentially,
->get_sb(), ->remount_fs()) and ->...ioctl()).  ->remount_fs() is absolutely
locking-agnostic there and ->get_sb(), ->put_super() and ->umount_begin()
are all serialized per superblock.  And for data structures that are
not per-superblock FUSE doesn't rely on BKL in any of those, AFAICT.

If you can ACK that, we could simply leave FUSE out of all the "push
BKL down into get_sb/umount_begin/put_super/remount_fs" series.
