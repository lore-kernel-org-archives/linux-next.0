From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the input tree
Date: Sat, 17 Oct 2015 09:39:30 -0700
Message-ID: <20151017163930.GC13470@dtor-ws>
References: <20151016131948.0a87d480@canb.auug.org.au>
 <5620A93E.40508@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34334 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753172AbbJQQje (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 Oct 2015 12:39:34 -0400
Content-Disposition: inline
In-Reply-To: <5620A93E.40508@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 16, 2015 at 09:37:34AM +0200, Hans de Goede wrote:
> Hio,
> 
> On 16-10-15 04:19, Stephen Rothwell wrote:
> >Hi Dmitry,
> >
> >After merging the input tree, today's linux-next build (x86_64
> >allmodconfig) failed like this:
> >
> >In file included from samples/hidraw/hid-example.c:14:0:
> >./usr/include/linux/input.h:17:31: fatal error: input-event-codes.h: No such file or directory
> >
> >Caused by commit
> >
> >   d794709c3916 ("Input: Add input-event-codes header file")
> >
> >I have used the input tree from next-20151015 for today.
> 
> Sorry, my bad, I assumed anything under include/uapi would
> automatically get installed as a usr header, but it turns out
> any files added need to also be added to the Kbuild file, the
> attached patch should fix this.
> 
> Dmitry, feel free to squash this into the original patch.

Thanks Hans, I folded it into the original patch.

> 
> Regards,
> 
> Hans

> From 0dd5544b6ca0cddfe25976b46ef9ba5c4adbc791 Mon Sep 17 00:00:00 2001
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Fri, 16 Oct 2015 09:33:45 +0200
> Subject: [PATCH] input: Add input-event-codes.h to usr headers to install
> 
> Add input-event-codes.h to the list of uapi headers to install, this fixes
> build-failures of any userspace tools including linux/input.h .
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/uapi/linux/Kbuild | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> index f7b2db4..0f26309 100644
> --- a/include/uapi/linux/Kbuild
> +++ b/include/uapi/linux/Kbuild
> @@ -191,6 +191,7 @@ header-y += inet_diag.h
>  header-y += in.h
>  header-y += inotify.h
>  header-y += input.h
> +header-y += input-event-codes.h
>  header-y += in_route.h
>  header-y += ioctl.h
>  header-y += ip6_tunnel.h
> -- 
> 2.5.0
> 


-- 
Dmitry
