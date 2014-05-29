From: Trond Myklebust <trond.myklebust@primarydata.com>
Subject: Re: linux-next build failure on m68k in nfs code
Date: Thu, 29 May 2014 16:32:27 -0400
Message-ID: <CAHQdGtSAirYa=iWxkaP_0z6=7GVx9uLj7NnP42Zd85+OGkpBOw@mail.gmail.com>
References: <53878D33.80107@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ve0-f176.google.com ([209.85.128.176]:34828 "EHLO
	mail-ve0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751206AbaE2Uc2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 16:32:28 -0400
Received: by mail-ve0-f176.google.com with SMTP id jz11so1037231veb.21
        for <linux-next@vger.kernel.org>; Thu, 29 May 2014 13:32:27 -0700 (PDT)
In-Reply-To: <53878D33.80107@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Weston Andros Adamson <dros@primarydata.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Paul

On Thu, May 29, 2014 at 3:40 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Trond,
>
> I'm seeing this on today's linux-next with m68k allmodconfig:
>
> ERROR: "__umoddi3" [fs/nfs/nfs_layout_nfsv41_files.ko] undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
>
> Making this obviously incorrect change makes it go away:
>
>
>         /* calculate remaining bytes in the current stripe */
> -       stripe_offset = ((u64)req_offset(req) - segment_offset) % stripe_unit;
> +       stripe_offset = 0; // ((u64)req_offset(req) - segment_offset) % stripe_unit;
>
>
> The line above comes from:
>
> commit fa1165eda0eeaee57c292df3af1c98e10223f0f5
> Author: Weston Andros Adamson <dros@primarydata.com>
> Date:   Thu May 15 11:56:56 2014 -0400
>
>     pnfs: filelayout: support non page aligned layouts
>
> Looks like it needs to use the proper 64bit math wrappers.

Yes. I already fixed up patch this morning in my linux-next branch, so
I'm hoping it will be OK the next time you pull from Stephen's tree.

For the record, the correct fix should be to replace the above line with

div_u64_rem((u64)req_offset(req) - segment_offset, stripe_unit, &stripe_offset);

Thanks
  Trond

-- 
Trond Myklebust

Linux NFS client maintainer, PrimaryData

trond.myklebust@primarydata.com
