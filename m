From: Amir Goldstein <amir73il@gmail.com>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
Date: Wed, 17 May 2017 08:00:14 +0300
Message-ID: <CAOQ4uxi0-WCYq3FHOAHVSRGdhzz_BY-+0+dVcS7ftGVuM=F-vg@mail.gmail.com>
References: <20170517101956.69c03d78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34634 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750924AbdEQFAP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2017 01:00:15 -0400
In-Reply-To: <20170517101956.69c03d78@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 17, 2017 at 3:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> After merging the overlayfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> fs/overlayfs/dir.c: In function 'ovl_rename':
> fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   dput(newdentry);
>   ^
> fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   dput(olddentry);
>   ^
>
> Introduced by commit
>
>   02cac3227a28 ("ovl: mark upper dir with type origin entries "impure"")
>

Posted a fix for that ("ovl: fix wrong error handling of ovl_set_impure()")

Thanks!
