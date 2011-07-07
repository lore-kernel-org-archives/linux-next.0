From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Add PCI config dependency for PTI.
Date: Thu, 7 Jul 2011 12:31:54 -0700
Message-ID: <20110707123154.d6fb4a99.randy.dunlap@oracle.com>
References: <james_p_freyensee@linux.intel.com>
	<1310066653-26879-1-git-send-email-james_p_freyensee@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:46429 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292Ab1GGTcL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 15:32:11 -0400
In-Reply-To: <1310066653-26879-1-git-send-email-james_p_freyensee@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: james_p_freyensee@linux.intel.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, randy.dunlap@oracle.com, sfr@canb.auug.org.au, christophe.guerard@intel.com, pranav.k.sanghadia@intel.com

On Thu,  7 Jul 2011 12:24:13 -0700 james_p_freyensee@linux.intel.com wrote:

> From: J Freyensee <james_p_freyensee@linux.intel.com>
> 
> Intel-Atom implementation of PTI will not work with PCI
> configured off, so the pti driver should not be compiled
> in the event someone does not enable PCI in the linux kernel.
> 
> Signed-off-by: J Freyensee <james_p_freyensee@linux.intel.com>
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

now you can say that above. ^^^

Also
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
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
> -- 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
