From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] lkdtm: include cacheflush.h
Date: Fri, 21 Mar 2014 14:31:54 -0400
Message-ID: <CAP=VYLpYhOR3xoX5AjvENR_FRLNsgGE4w275_SZEvBa_UwZrmw@mail.gmail.com>
References: <20140214235849.GA30703@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:57198 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745AbaCUSc0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Mar 2014 14:32:26 -0400
In-Reply-To: <20140214235849.GA30703@www.outflux.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, Feb 14, 2014 at 6:58 PM, Kees Cook <keescook@chromium.org> wrote:
> Some architectures need cacheflush.h explicitly included (mips) for
> use of flush_icache_range():
>
>     config: make ARCH=mips allmodconfig
>     All error/warnings:
>     >> ERROR: "flush_icache_range" undefined!

The linux-next builds still fail with a similar error:

http://kisskb.ellerman.id.au/kisskb/buildresult/10808358/

I'm not sure if it ever was a compile error, or if it was always
a missing export symbol type error as it is apparently now.

Paul.
--

>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/misc/lkdtm.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/lkdtm.c b/drivers/misc/lkdtm.c
> index 47ed2d321351..2ebd52e05773 100644
> --- a/drivers/misc/lkdtm.c
> +++ b/drivers/misc/lkdtm.c
> @@ -46,6 +46,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/mman.h>
> +#include <asm/cacheflush.h>
>
>  #ifdef CONFIG_IDE
>  #include <linux/ide.h>
> --
> 1.7.9.5
>
>
> --
> Kees Cook
> Chrome OS Security
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
