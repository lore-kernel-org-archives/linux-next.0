From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Mon, 30 Jul 2018 10:47:37 +0100
Message-ID: <2379.1532944057@warthog.procyon.org.uk>
References: <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com> <20180730161622.3837cb15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
Content-ID: <2377.1532944057.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Gao Xiang <gaoxiang25@huawei.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miao Xie <miaoxie@huawei.com>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

Gao Xiang <gaoxiang25@huawei.com> wrote:

> >   sb->s_flags |= MS_RDONLY | MS_NOATIME;

This should be using SB_* rather than MS_* for interaction with sb->s_flags.

> > drivers/staging/erofs/super.c: In function 'erofs_mount':
> > drivers/staging/erofs/super.c:501:10: warning: passing argument 5 of 'mount_bdev' makes integer from pointer without a cast [-Wint-conversion]
> >    &priv, erofs_fill_super);
> >           ^~~~~~~~~~~~~~~~
> > In file included from include/linux/buffer_head.h:12:0,
> >                  from drivers/staging/erofs/super.c:14:
> > include/linux/fs.h:2151:23: note: expected 'size_t {aka long unsigned int}' but argument is of type 'int (*)(struct super_block *, void *, int)'
> >  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> >                        ^~~~~~~~~~
> > drivers/staging/erofs/super.c:500:9: error: too few arguments to function 'mount_bdev'
> >   return mount_bdev(fs_type, flags, dev_name,
> >          ^~~~~~~~~~

There's a patch in Al Viro's tree that passes a size_t argument indicating the
size of the mount data from mount down into the filesystem and into the
helpers as the data may be on a kernel stack or in kernel .rodata rather than
in a full page of its own.

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git

Currently this is commit 0a191e4505a4f255e6513b49426213da69bf0e80

vfs: Require specification of size of mount data for internal mounts

David
