From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (uprobes tree related)
Date: Wed, 23 Nov 2011 15:24:43 +0530
Message-ID: <20111123095443.GA22971@linux.vnet.ibm.com>
References: <20111123152854.98c60a7c859f28c2efa30717@canb.auug.org.au>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e2.ny.us.ibm.com ([32.97.182.142]:50769 "EHLO e2.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753673Ab1KWJzd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Nov 2011 04:55:33 -0500
Received: from /spool/local
	by e2.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srikar@linux.vnet.ibm.com>;
	Wed, 23 Nov 2011 04:55:32 -0500
Content-Disposition: inline
In-Reply-To: <20111123152854.98c60a7c859f28c2efa30717@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Hey Stephen, 

> After merging the uprobes tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> In file included from include/linux/mm_types.h:15:0,
>                  from include/linux/kmemcheck.h:4,
>                  from include/linux/skbuff.h:18,
>                  from net/8021q/vlan_core.c:1:
> include/linux/uprobes.h: In function 'register_uprobe':
> include/linux/uprobes.h:148:10: error: 'ENOSYS' undeclared (first use in this function)
> 

Oh sorry for missing this.

> And several more.
> 
> Caused by commit fb16338b69cd ("register_unregister_uprobe" - "Uprobes:
> register/unregister probes").
> 
> I have added this patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 23 Nov 2011 15:11:20 +1100
> Subject: [PATCH] uprobes: using ENOSYS requires errno.h
> 
> Fixes this build problem:
> 
> In file included from include/linux/mm_types.h:15:0,
>                  from include/linux/kmemcheck.h:4,
>                  from include/linux/skbuff.h:18,
>                  from net/8021q/vlan_core.c:1:
> include/linux/uprobes.h: In function 'register_uprobe':
> include/linux/uprobes.h:148:10: error: 'ENOSYS' undeclared (first use in this function)
> 
> when CONFIG_UPROBES is not defined.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/uprobes.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
> index 091dfb8..e2e0674 100644
> --- a/include/linux/uprobes.h
> +++ b/include/linux/uprobes.h
> @@ -23,6 +23,7 @@
>   *	Jim Keniston
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/rbtree.h>
>  
>  struct vm_area_struct;

Yes, this is the right fix. So I will fold this into my patch.

-- 
Thanks and Regards
Srikar
