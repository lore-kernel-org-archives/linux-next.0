From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Fri, 08 May 2009 15:40:49 +0200
Message-ID: <E1M2QJl-00035r-E2@pomaz-ex.szeredi.hu>
References: <20090508144457.c88fc3dc.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fxip-0047f.externet.hu ([88.209.222.127]:56288 "EHLO
	pomaz-ex.szeredi.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbZEHNlK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2009 09:41:10 -0400
In-reply-to: <20090508144457.c88fc3dc.sfr@canb.auug.org.au> (message from
	Stephen Rothwell on Fri, 8 May 2009 14:44:57 +1000)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org, hch@lst.de, tj@kernel.org, miklos@szeredi.hu

On Fri, 8 May 2009, Stephen Rothwell wrote:
> Today's linux-next merge of the vfs tree got a conflict in
> fs/fuse/inode.c between commit a325f9b92273d6c64ec56167905b951b9827ec33
> ("fuse: update fuse_conn_init() and separate out fuse_conn_kill()") from
> the fuse tree and commit 4225d95ddb751e09da0c145b58549da95ba13e3a ("push
> BKL down into ->put_super") from the vfs tree.
> 
> I fixed it up (see below - please check) and can carry the fix as
> necessary.

The fixup looks good.

Al, would it make sense to merge the fuse tree into the vfs tree at
some point to fix the conflict permanently?

If so, please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git cuse

to receive the following changes.

Thanks,
Miklos
----

Miklos Szeredi (11):
      fuse: destroy bdi on error
      fuse: use struct path in release structure
      fuse: clean up fuse_write_fill()
      fuse: prepare fuse_direct_io() for CUSE
      fuse: add members to struct fuse_file
      fuse: don't use inode in helpers called by fuse_direct_io()
      fuse: clean up args in fuse_finish_open() and fuse_release_fill()
      fuse: create fuse_do_open() helper for CUSE
      fuse: don't use inode in fuse_sync_release()
      fuse: don't use inode in fuse_do_ioctl() helper
      fuse: don't use inode in fuse_file_poll

Tejun Heo (4):
      fuse: misc cleanups
      fuse: update fuse_conn_init() and separate out fuse_conn_kill()
      fuse: export symbols to be used by CUSE
      CUSE: implement CUSE - Character device in Userspace

---
 fs/Kconfig            |   10 +
 fs/fuse/Makefile      |    1 +
 fs/fuse/cuse.c        |  610 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/dev.c         |   15 +-
 fs/fuse/dir.c         |   33 +--
 fs/fuse/file.c        |  346 ++++++++++++++++------------
 fs/fuse/fuse_i.h      |   47 +++-
 fs/fuse/inode.c       |  117 ++++++----
 include/linux/fuse.h  |   31 +++
 include/linux/magic.h |    5 +-
 10 files changed, 983 insertions(+), 232 deletions(-)
 create mode 100644 fs/fuse/cuse.c
