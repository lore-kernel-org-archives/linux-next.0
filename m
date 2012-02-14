From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: fix powerpc linux-next break on zsmalloc
Date: Tue, 14 Feb 2012 12:22:20 +0100
Message-ID: <4F3A43EC.2030209@gmx.de>
References: <1329144469-8575-1-git-send-email-sjenning@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:37551 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755204Ab2BNLWY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2012 06:22:24 -0500
In-Reply-To: <1329144469-8575-1-git-send-email-sjenning@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Seth Jennings <sjenning@linux.vnet.ibm.com>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>

Am 13.02.2012 15:47, schrieb Seth Jennings:
> linux/vmalloc.h added to zsmalloc-main.c to resolve implicit
> declaration errors.
>
> X86 dependency added to zsmalloc and dependent drivers zcache and zram.
>
> This X86 only requirement is not ideal.  Working to find portable
> functions for __flush_tlb_one and set_pte.

sorry, zcache/zram works fine one ARM here. Why not depend on !POWERPC?

Marc

> Signed-off-by: Seth Jennings<sjenning@linux.vnet.ibm.com>
> ---
>   drivers/staging/zcache/Kconfig           |    4 +++-
>   drivers/staging/zram/Kconfig             |    4 +++-
>   drivers/staging/zsmalloc/Kconfig         |    5 ++++-
>   drivers/staging/zsmalloc/zsmalloc-main.c |    1 +
>   4 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/zcache/Kconfig b/drivers/staging/zcache/Kconfig
> index 94e48aa..5a36fcf 100644
> --- a/drivers/staging/zcache/Kconfig
> +++ b/drivers/staging/zcache/Kconfig
> @@ -1,6 +1,8 @@
>   config ZCACHE
>   	tristate "Dynamic compression of swap pages and clean pagecache pages"
> -	depends on (CLEANCACHE || FRONTSWAP)&&  CRYPTO
> +	# X86 dependency is because zsmalloc uses non-portable pte/tlb
> +	# functions
> +	depends on (CLEANCACHE || FRONTSWAP)&&  CRYPTO&&  X86
>   	select ZSMALLOC
>   	select CRYPTO_LZO
>   	default n
> diff --git a/drivers/staging/zram/Kconfig b/drivers/staging/zram/Kconfig
> index ee23a86..9d11a4c 100644
> --- a/drivers/staging/zram/Kconfig
> +++ b/drivers/staging/zram/Kconfig
> @@ -1,6 +1,8 @@
>   config ZRAM
>   	tristate "Compressed RAM block device support"
> -	depends on BLOCK&&  SYSFS
> +	# X86 dependency is because zsmalloc uses non-portable pte/tlb
> +	# functions
> +	depends on BLOCK&&  SYSFS&&  X86
>   	select ZSMALLOC
>   	select LZO_COMPRESS
>   	select LZO_DECOMPRESS
> diff --git a/drivers/staging/zsmalloc/Kconfig b/drivers/staging/zsmalloc/Kconfig
> index 3e7a8d4..8e2c6a0 100644
> --- a/drivers/staging/zsmalloc/Kconfig
> +++ b/drivers/staging/zsmalloc/Kconfig
> @@ -1,6 +1,9 @@
>   config ZSMALLOC
>   	tristate "Memory allocator for compressed pages"
> -	depends on SPARSEMEM
> +	# X86 dependency is because of the use of __flush_tlb_one and set_pte
> +	# in zsmalloc-main.c.
> +	# TODO: convert these to portable functions
> +	depends on SPARSEMEM&&  X86
>   	default n
>   	help
>   	  zsmalloc is a slab-based memory allocator designed to store
> diff --git a/drivers/staging/zsmalloc/zsmalloc-main.c b/drivers/staging/zsmalloc/zsmalloc-main.c
> index 189fb42..455fc2f 100644
> --- a/drivers/staging/zsmalloc/zsmalloc-main.c
> +++ b/drivers/staging/zsmalloc/zsmalloc-main.c
> @@ -26,6 +26,7 @@
>   #include<asm/pgtable.h>
>   #include<linux/cpumask.h>
>   #include<linux/cpu.h>
> +#include<linux/vmalloc.h>
>
>   #include "zsmalloc.h"
>   #include "zsmalloc_int.h"
