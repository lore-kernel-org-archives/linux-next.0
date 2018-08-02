From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Thu, 2 Aug 2018 08:15:18 +0200
Message-ID: <20180802061518.GD3272@kroah.com>
References: <20180730161622.3837cb15@canb.auug.org.au>
 <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
 <7152b6ba-9ad6-4a9c-3b13-2d5310266ccd@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7152b6ba-9ad6-4a9c-3b13-2d5310266ccd@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Yu <yuchao0@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Gao Xiang <gaoxiang25@huawei.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Miao Xie <miaoxie@huawei.com>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 01, 2018 at 05:09:13PM +0800, Chao Yu wrote:
> Hi Stephen,
> 
> On 2018/7/30 14:31, Gao Xiang wrote:
> > Hi Stephen,
> > 
> > On 2018/7/30 14:16, Stephen Rothwell wrote:
> >> Hi Greg,
> >>
> >> After merging the staging tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> drivers/staging/erofs/super.c: In function 'erofs_read_super':
> >> drivers/staging/erofs/super.c:343:17: error: 'MS_RDONLY' undeclared (first use in this function); did you mean 'IS_RDONLY'?
> >>   sb->s_flags |= MS_RDONLY | MS_NOATIME;
> >>                  ^~~~~~~~~
> >>                  IS_RDONLY
> >> drivers/staging/erofs/super.c:343:17: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/staging/erofs/super.c:343:29: error: 'MS_NOATIME' undeclared (first use in this function); did you mean 'S_NOATIME'?
> >>   sb->s_flags |= MS_RDONLY | MS_NOATIME;
> >>                              ^~~~~~~~~~
> >>                              S_NOATIME
> >> drivers/staging/erofs/super.c: In function 'erofs_mount':
> >> drivers/staging/erofs/super.c:501:10: warning: passing argument 5 of 'mount_bdev' makes integer from pointer without a cast [-Wint-conversion]
> >>    &priv, erofs_fill_super);
> >>           ^~~~~~~~~~~~~~~~
> >> In file included from include/linux/buffer_head.h:12:0,
> >>                  from drivers/staging/erofs/super.c:14:
> >> include/linux/fs.h:2151:23: note: expected 'size_t {aka long unsigned int}' but argument is of type 'int (*)(struct super_block *, void *, int)'
> >>  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> >>                        ^~~~~~~~~~
> >> drivers/staging/erofs/super.c:500:9: error: too few arguments to function 'mount_bdev'
> >>   return mount_bdev(fs_type, flags, dev_name,
> >>          ^~~~~~~~~~
> >> In file included from include/linux/buffer_head.h:12:0,
> >>                  from drivers/staging/erofs/super.c:14:
> >> include/linux/fs.h:2151:23: note: declared here
> >>  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> >>                        ^~~~~~~~~~
> >> drivers/staging/erofs/super.c: At top level:
> >> drivers/staging/erofs/super.c:518:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> >>   .mount          = erofs_mount,
> >>                     ^~~~~~~~~~~
> >> drivers/staging/erofs/super.c:518:20: note: (near initialization for 'erofs_fs_type.mount')
> >> drivers/staging/erofs/super.c: In function 'erofs_remount':
> >> drivers/staging/erofs/super.c:630:12: error: 'MS_RDONLY' undeclared (first use in this function); did you mean 'IS_RDONLY'?
> >>   *flags |= MS_RDONLY;
> >>             ^~~~~~~~~
> >>             IS_RDONLY
> >> drivers/staging/erofs/super.c: At top level:
> >> drivers/staging/erofs/super.c:640:16: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> >>   .remount_fs = erofs_remount,
> >>                 ^~~~~~~~~~~~~
> >>
> >> Caused by various commits creating erofs in the staging tree interacting
> >> with various commits redoing the mount infrastructure in the vfs tree.
> >>
> >> I have disabed CONFIG_EROFS_FS for now:
> 
> Xiang has submitted several patches as below to fix compiling error on -next
> tree, could you consider to merge those temporary fixes into -next after merging
> staging-next's updates, and reenable CONFIG_EROFS_FS for further integrity
> compiling and test?
> 
> staging: erofs: fix superblock/inode flags (MS_RDONLY -> SB_RDONLY, S_NOATIME)
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000282.html
> 
> staging: erofs: remove RADIX_TREE_EXCEPTIONAL_{ENTRY, SHIFT}
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000283.html
> 
> staging: erofs: update .mount and .remount_sb
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000285.html

Why have these not been submitted to me for inclusion in my tree?

thanks,

greg k-h
