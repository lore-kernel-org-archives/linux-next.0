From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Add PCI config dependency for PTI.
Date: Thu, 7 Jul 2011 14:17:01 -0700 (PDT)
Message-ID: <4E16224D.5040502@oracle.com>
References: <james_p_freyensee@linux.intel.com>
 <1310073145-18328-1-git-send-email-james_p_freyensee@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:60409 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958Ab1GGVS1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 17:18:27 -0400
In-Reply-To: <1310073145-18328-1-git-send-email-james_p_freyensee@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: james_p_freyensee@linux.intel.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, christophe.guerard@intel.com, pranav.k.sanghadia@intel.com

On 07/07/11 14:12, james_p_freyensee@linux.intel.com wrote:
> From: J Freyensee <james_p_freyensee@linux.intel.com>
> 
> Intel-Atom implementation of PTI will not work with PCI
> configured off, so the pti driver should not be compiled
> in the event someone does not enable PCI in the linux kernel.
> 
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Yes, that also.

Thanks.

> Signed-off-by: J Freyensee <james_p_freyensee@linux.intel.com>
> ---
>  drivers/misc/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4e349cd..7fd32a6 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -146,6 +146,7 @@ config PHANTOM
>  
>  config INTEL_MID_PTI
>  	tristate "Parallel Trace Interface for MIPI P1149.7 cJTAG standard"
> +	depends on PCI
>  	default n
>  	help
>  	  The PTI (Parallel Trace Interface) driver directs


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
