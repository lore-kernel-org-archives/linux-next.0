From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] pnpbios: add header file to fix build errors
Date: Thu, 28 Jul 2016 01:49:55 +0200
Message-ID: <2367158.Y693rAZPTH@vostro.rjw.lan>
References: <ae7a56b8-27a4-05c3-44f7-e1140bfd7acd@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:62400 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S932335AbcG0Xow (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 19:44:52 -0400
In-Reply-To: <ae7a56b8-27a4-05c3-44f7-e1140bfd7acd@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Luis R. Rodriguez" <mcgrof@suse.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tuesday, July 26, 2016 04:26:40 PM Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build errors due to missing header file:
> 
> ../drivers/pnp/pnpbios/core.c: In function 'pnp_dock_event':
> ../drivers/pnp/pnpbios/core.c:141:2: error: implicit declaration of function 'call_usermodehelper' [-Werror=implicit-function-declaration]
>   value = call_usermodehelper(argv [0], argv, envp, UMH_WAIT_EXEC);
>   ^
> ../drivers/pnp/pnpbios/core.c:141:52: error: 'UMH_WAIT_EXEC' undeclared (first use in this function)
>   value = call_usermodehelper(argv [0], argv, envp, UMH_WAIT_EXEC);
>                                                     ^
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> I should have copied Rafael on this the first time.
> Also applies to mainline.

OK, I'm going to apply it, thanks!

>  drivers/pnp/pnpbios/core.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20160711.orig/drivers/pnp/pnpbios/core.c
> +++ linux-next-20160711/drivers/pnp/pnpbios/core.c
> @@ -60,6 +60,7 @@
>  #include <linux/delay.h>
>  #include <linux/acpi.h>
>  #include <linux/freezer.h>
> +#include <linux/kmod.h>
>  #include <linux/kthread.h>
>  
>  #include <asm/page.h>

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
