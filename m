From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 4 Sep 2017 11:34:46 -0700
Message-ID: <CAPcyv4i7itXFzwWm0192oGU0buW_sGLqC7-9Vjht+0Q_y+1apg@mail.gmail.com>
References: <20170904173425.5cc0e08d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34508 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753932AbdIDSer (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Sep 2017 14:34:47 -0400
Received: by mail-oi0-f53.google.com with SMTP id h70so9434608oic.1
        for <linux-next@vger.kernel.org>; Mon, 04 Sep 2017 11:34:46 -0700 (PDT)
In-Reply-To: <20170904173425.5cc0e08d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Sep 4, 2017 at 12:34 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the nvdimm tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> drivers/dax/super.c:64:20: error: redefinition of 'fs_dax_get_by_bdev'
>  struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
>                     ^
> In file included from drivers/dax/super.c:22:0:
> include/linux/dax.h:76:34: note: previous definition of 'fs_dax_get_by_bdev' was here
>  static inline struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
>                                   ^
>
> Caused by commit
>
>   78f354735081 ("dax: introduce a fs_dax_get_by_bdev() helper")
>
> The protection in drivers/dax/super.c is CONFIG_BLOCK, while in
> include/linux/dax.h it is IS_ENABLED(CONFIG_FS_DAX) and the Makefile
> uses CONFIG_DAX.
>
> I have reverted that commit and the following 3 for today.

Thanks Stephen, I have appended a fix to that branch.

https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git/commit/?h=libnvdimm-for-next&id=26f2f4de0bd93
