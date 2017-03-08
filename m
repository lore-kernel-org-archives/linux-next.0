From: Amir Goldstein <amir73il@gmail.com>
Subject: Re: linux-next: build warnings after merge of the overlayfs tree
Date: Wed, 8 Mar 2017 10:44:01 +0200
Message-ID: <CAOQ4uxi4r+EEOgWGMZj7v32oxiNuOj1cMHu=y=ww86=4eoL6Mg@mail.gmail.com>
References: <20170308101643.0bc34e88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:32934 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751786AbdCHIoD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Mar 2017 03:44:03 -0500
In-Reply-To: <20170308101643.0bc34e88@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Mar 8, 2017 at 1:16 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> After merging the overlayfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
>
> fs/overlayfs/inode.c:322:30: warning: 'ovl_i_mutex_key' defined but not used [-Wunused-variable]
>  static struct lock_class_key ovl_i_mutex_key[FILESYSTEM_MAX_STACK_DEPTH];
>                               ^
> fs/overlayfs/inode.c:323:30: warning: 'ovl_i_mutex_dir_key' defined but not used [-Wunused-variable]
>  static struct lock_class_key ovl_i_mutex_dir_key[FILESYSTEM_MAX_STACK_DEPTH];
>                               ^
>
> Introduced by commit
>
>   a41471e8eff8 ("ovl: lockdep annotate of nested stacked overlayfs inode lock")
>
> CONFIG_LOCKDEP is not set for this build.
>

Thanks Stephen!

Miklos, I posted v5 of the patch with a fix.
