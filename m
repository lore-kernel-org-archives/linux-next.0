From: Amir Goldstein <amir73il@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-miklos tree with the
 overlayfs tree and build failure
Date: Tue, 31 Jan 2017 08:47:43 +0200
Message-ID: <CAOQ4uxhUQxJs_3SW0Gtm-UAEbvWR7BsjudNH8LUX24OwYnvyZA@mail.gmail.com>
References: <20170131111656.3e77663b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170131111656.3e77663b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 31, 2017 at 2:16 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> Today's linux-next merge of the vfs-miklos tree got a conflict in:
>
>   fs/read_write.c
>
> between commit:
>
>   97e147358bea ("vfs: wrap write f_ops with file_{start,end}_write()")
>
> from the overlayfs tree and various duplicated patches between v4.10-rc1
> and the vfs-miklos tree.
>

That's strange.
overlayfs-next whose head is the for mentioned commit is based on
v4.10-rc6 and has no duplicated patches AFAICS

Perhaps you are referring to the similar named patch:

3616119 vfs: no mnt_want_write_file() in vfs_{copy,clone}_file_range()

Miklos has converted mnt_want_write_file() => sb_start_write() for v4.10-rc1
and my change converts it again sb_start_write() => file_start_write(),
which is mostly a semantic difference, but with some implications.


> Please clean up the vfs-miklos tree.
>
> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> I then got this build failure from my arm multi_v7_defconfig build:
>
> In file included from /home/sfr/next/next/include/linux/seq_file.h:10:0,
>                  from /home/sfr/next/next/include/linux/pinctrl/consumer.h:17,
>                  from /home/sfr/next/next/include/linux/pinctrl/devinfo.h:21,
>                  from /home/sfr/next/next/include/linux/device.h:24,
>                  from /home/sfr/next/next/include/linux/dma-mapping.h:6,
>                  from /home/sfr/next/next/arch/arm/kernel/asm-offsets.c:16:
> /home/sfr/next/next/include/linux/fs.h:2566:19: error: redefinition of 'do_clone
> _file_range'
>  static inline int do_clone_file_range(struct file *file_in, loff_t pos_in,
>                    ^
> /home/sfr/next/next/include/linux/fs.h:1743:19: note: previous definition of 'do_clone_file_range' was here
>  static inline int do_clone_file_range(struct file *file_in, loff_t pos_in,
>                    ^
>

Please note that my patch moves do_clone_file_range() from line 1743
to line 2566,
because it needs to use file_start_write(), which is defined in line 2533.
so perhaps the conflict was not resolved correctly?

> so I decided to just drop the vfs-miklos tree for today.
> --
> Cheers,
> Stephen Rothwell
