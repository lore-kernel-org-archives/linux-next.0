From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: manual merge of the h8300-remove tree
Date: Fri, 25 Oct 2013 08:09:01 -0700
Message-ID: <20131025150901.GA6012@roeck-us.net>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
 <1382706224-8859-1-git-send-email-treding@nvidia.com>
 <1382706224-8859-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:59961 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab3JYPJK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2013 11:09:10 -0400
Content-Disposition: inline
In-Reply-To: <1382706224-8859-2-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Salter <msalter@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 25, 2013 at 03:03:40PM +0200, Thierry Reding wrote:
> Today's linux-next tree of the h8300-remove tree got a conflict in
> 
> 	drivers/parport/Kconfig
> 
> caused by commits e9783b0 (Revert "drivers: parport: Kconfig: exclude h8300
> for PARPORT_PC") and d90c3eb (Kconfig cleanup (PARPORT_PC dependencies)).
> 
> I fixed it up (see below). Please verify that the resolution looks good.
> 
> Thanks,
> Thierry
> ---
> diff --cc drivers/parport/Kconfig
> index f536685,dc82ef0..2225237
> --- a/drivers/parport/Kconfig
> +++ b/drivers/parport/Kconfig
> @@@ -41,8 -35,10 +41,7 @@@ if PARPOR
>   
>   config PARPORT_PC
>   	tristate "PC-style hardware"
>  -	depends on (!SPARC64 || PCI) && !SPARC32 && !M32R && !FRV && !S390 && \
>  -		(!M68K || ISA) && !MN10300 && !AVR32 && !BLACKFIN && \
>  -		!XTENSA && !CRIS
>  -
>  +	depends on ARCH_MIGHT_HAVE_PC_PARPORT
> - 
>   	---help---
>   	  You should say Y here if you have a PC-style parallel port. All
>   	  IBM PC compatible computers and some Alphas have PC-style
> 
I dropped the patch (revert) causing the conflict.

Guenter
