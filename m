From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs-miklos tree with the
 overlayfs tree and build failure
Date: Fri, 3 Feb 2017 09:35:09 +0100
Message-ID: <CAJfpegtAZkenPkE0NHUfeSFcCJmBygVqCh8_yaVRqLj-5hjKEQ@mail.gmail.com>
References: <20170131111656.3e77663b@canb.auug.org.au> <20170203093436.0c486463@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33095 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbdBCIfL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 03:35:11 -0500
Received: by mail-oi0-f66.google.com with SMTP id j15so920242oih.0
        for <linux-next@vger.kernel.org>; Fri, 03 Feb 2017 00:35:11 -0800 (PST)
In-Reply-To: <20170203093436.0c486463@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>

On Thu, Feb 2, 2017 at 11:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> On Tue, 31 Jan 2017 11:16:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the vfs-miklos tree got a conflict in:
>>
>>   fs/read_write.c
>>
>> between commit:
>>
>>   97e147358bea ("vfs: wrap write f_ops with file_{start,end}_write()")
>>
>> from the overlayfs tree and various duplicated patches between v4.10-rc1
>> and the vfs-miklos tree.
>>
>> Please clean up the vfs-miklos tree.
>>
>> I fixed it up (I just used the former) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>>
>> I then got this build failure from my arm multi_v7_defconfig build:
>>
>> In file included from /home/sfr/next/next/include/linux/seq_file.h:10:0,
>>                  from /home/sfr/next/next/include/linux/pinctrl/consumer.h:17,
>>                  from /home/sfr/next/next/include/linux/pinctrl/devinfo.h:21,
>>                  from /home/sfr/next/next/include/linux/device.h:24,
>>                  from /home/sfr/next/next/include/linux/dma-mapping.h:6,
>>                  from /home/sfr/next/next/arch/arm/kernel/asm-offsets.c:16:
>> /home/sfr/next/next/include/linux/fs.h:2566:19: error: redefinition of 'do_clone
>> _file_range'
>>  static inline int do_clone_file_range(struct file *file_in, loff_t pos_in,
>>                    ^
>> /home/sfr/next/next/include/linux/fs.h:1743:19: note: previous definition of 'do_clone_file_range' was here
>>  static inline int do_clone_file_range(struct file *file_in, loff_t pos_in,
>>                    ^
>>
>> so I decided to just drop the vfs-miklos tree for today.
>
> This mess is still there ...

Sorry, I removed the conflicting content from that tree.

Thanks,
Miklos
