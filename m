From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs-miklos tree with the
 overlayfs tree and build failure
Date: Fri, 3 Feb 2017 09:34:36 +1100
Message-ID: <20170203093436.0c486463@canb.auug.org.au>
References: <20170131111656.3e77663b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46499 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751496AbdBBWei (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Feb 2017 17:34:38 -0500
In-Reply-To: <20170131111656.3e77663b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>

Hi Miklos,

On Tue, 31 Jan 2017 11:16:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
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
> so I decided to just drop the vfs-miklos tree for today.

This mess is still there ...

-- 
Cheers,
Stephen Rothwell
