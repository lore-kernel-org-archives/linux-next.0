From: Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Mon, 30 Jul 2018 18:45:48 +0800
Message-ID: <b4645de1-a58f-7615-4f47-7a3fd8c7e056@huawei.com>
References: <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
 <20180730161622.3837cb15@canb.auug.org.au>
 <2379.1532944057@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2379.1532944057@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miao Xie <miaoxie@huawei.com>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Thanks for your reply :)

On 2018/7/30 17:47, David Howells wrote:
> Gao Xiang <gaoxiang25@huawei.com> wrote:
> 
>>>   sb->s_flags |= MS_RDONLY | MS_NOATIME;
> 
> This should be using SB_* rather than MS_* for interaction with sb->s_flags.

Yes, I saw the related discussion and your submission in the linux-fsdevel mailing list last year. :D
The code of erofs once had to support from 3.13 ~ the current kernel, therefore I didn't turn MS_RDONLY into SB_RDONLY.
But it seems that "vfs: Suppress MS_* flag defs within the kernel unless explicitly enabled" tends to remove them all.

I have submitted a patch to linux-erofs mailing list for preview.
https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000282.html

> 
>>> drivers/staging/erofs/super.c: In function 'erofs_mount':
>>> drivers/staging/erofs/super.c:501:10: warning: passing argument 5 of 'mount_bdev' makes integer from pointer without a cast [-Wint-conversion]
>>>    &priv, erofs_fill_super);
>>>           ^~~~~~~~~~~~~~~~
>>> In file included from include/linux/buffer_head.h:12:0,
>>>                  from drivers/staging/erofs/super.c:14:
>>> include/linux/fs.h:2151:23: note: expected 'size_t {aka long unsigned int}' but argument is of type 'int (*)(struct super_block *, void *, int)'
>>>  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
>>>                        ^~~~~~~~~~
>>> drivers/staging/erofs/super.c:500:9: error: too few arguments to function 'mount_bdev'
>>>   return mount_bdev(fs_type, flags, dev_name,
>>>          ^~~~~~~~~~
> 
> There's a patch in Al Viro's tree that passes a size_t argument indicating the
> size of the mount data from mount down into the filesystem and into the
> helpers as the data may be on a kernel stack or in kernel .rodata rather than
> in a full page of its own.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
> 
> Currently this is commit 0a191e4505a4f255e6513b49426213da69bf0e80
> 
> vfs: Require specification of size of mount data for internal mounts

I just fixed according to the latest linux-next tree (the same patchset, also for preview)
https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000284.html

Once I tend to use void *data to pass more mount arguments on stack, eg.

struct erofs_mount_private {
	const char *dev_name;
	char *options;
};
...
struct erofs_mount_private priv = {
	.dev_name = dev_name,
	.options = data
};
return mount_bdev(fs_type, flags, dev_name, &priv, erofs_fill_super);


However, I have no idea if it is safe to do so in the future, so I also change it into a more stardard way.


BTW, It seems that Greg's staging tree doesn't have Al Viro's submission...
And I have little experience to handle that, so I just ask Chao for help...


Thanks for your kindly reminder :)

Thanks,
Gao Xiang

> 
> David
> 
