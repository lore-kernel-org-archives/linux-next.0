From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
Date: Tue, 22 Nov 2016 09:41:44 +0100
Message-ID: <CAJfpegsb5Qg0Y0SRpDC32tq1w2CBzdwMNip5DN-=QoEsfoqTAA@mail.gmail.com>
References: <20161122111939.0c0ea92a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35626 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755558AbcKVIlq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 03:41:46 -0500
Received: by mail-oi0-f65.google.com with SMTP id v84so1529314oie.2
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2016 00:41:46 -0800 (PST)
In-Reply-To: <20161122111939.0c0ea92a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2016 at 1:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> After merging the overlayfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> In file included from fs/overlayfs/dir.c:20:0:
> fs/overlayfs/dir.c: In function 'ovl_set_redirect':
> fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   int err = vfs_setxattr(dentry, name, value, size, flags);
>       ^
> fs/overlayfs/dir.c:788:14: note: 'ret' was declared here
>   char *buf, *ret;
>               ^
>
> Introduced by commit
>
>   496654b0792e ("ovl: redirect on rename-dir")
>
> This is not necessarily a false positive (although is is a confusing
> message): if the kmalloc of "buf" fails and samedir was not set in
> ovl_get_redirect(), then "return ret" will be executed but "ret" has
> not been set.

Fixed. Thanks for reporting.

Miklos
