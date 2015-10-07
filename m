From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Wed, 7 Oct 2015 08:40:59 +0200
Message-ID: <CAKohponuRX-XbGHk=T_B1+MXb8TeUwZOYc8NMLrNvZP_U_GSew@mail.gmail.com>
References: <20151007155146.41c4528f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34211 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbbJGGlB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2015 02:41:01 -0400
Received: by wicfx3 with SMTP id fx3so197265658wic.1
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2015 23:41:00 -0700 (PDT)
In-Reply-To: <20151007155146.41c4528f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On 7 October 2015 at 06:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> After merging the driver-core tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/base/power/opp/debugfs.c: In function 'opp_debug_create_one':
> drivers/base/power/opp/debugfs.c:48:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
>   if (!debugfs_create_bool("available", S_IRUGO, d,
>        ^
> In file included from drivers/base/power/opp/debugfs.c:13:0:
> include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
>  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
>                 ^
> drivers/base/power/opp/debugfs.c:52:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
>   if (!debugfs_create_bool("dynamic", S_IRUGO, d, (u32 *)&opp->dynamic))
>        ^
> In file included from drivers/base/power/opp/debugfs.c:13:0:
> include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
>  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
>                 ^
> drivers/base/power/opp/debugfs.c:55:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
>   if (!debugfs_create_bool("turbo", S_IRUGO, d, (u32 *)&opp->turbo))
>        ^
> In file included from drivers/base/power/opp/debugfs.c:13:0:
> include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
>  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
>                 ^
>
> Introduced by commit
>
>   621a5f7ad9cd ("debugfs: Pass bool pointer to debugfs_create_bool()")
>
> interacting with commit
>
>   5cb5fdbf3877 ("PM / OPP: Add debugfs support")
>
> from the pm tree.

That was expected and the PM tree needs to get updated to get it fixed.
And I will be doing that soon.

--
viresh
