From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] kernel/cpu.c: Add right qualifiers for alloc_frozen_cpus()
 and cpu_hotplug_pm_sync_init()
Date: Tue, 15 Nov 2011 11:34:04 +0530
Message-ID: <4EC200D4.9040505@linux.vnet.ibm.com>
References: <1321315040-4644-1-git-send-email-fenghua.yu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:59948 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752501Ab1KOGZx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2011 01:25:53 -0500
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srivatsa.bhat@linux.vnet.ibm.com>;
	Tue, 15 Nov 2011 11:36:13 +0530
In-Reply-To: <1321315040-4644-1-git-send-email-fenghua.yu@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>

On 11/15/2011 05:27 AM, Fenghua Yu wrote:
> From: Fenghua Yu <fenghua.yu@intel.com>
> 
> Add __init for functions alloc_frozen_cpus() and cpu_hotplug_pm_sync_init()
> because they are only called during boot time.
> 
> Add static for function cpu_hotplug_pm_sync_init() because its scope is limited
> in this file only.
> 
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>

Acked-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>

Thanks,
Srivatsa S. Bhat

> ---
> v2: Change a function name typo in the title.
> 
>  kernel/cpu.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 563f136..cf915b8 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -470,7 +470,7 @@ out:
>  	cpu_maps_update_done();
>  }
> 
> -static int alloc_frozen_cpus(void)
> +static int __init alloc_frozen_cpus(void)
>  {
>  	if (!alloc_cpumask_var(&frozen_cpus, GFP_KERNEL|__GFP_ZERO))
>  		return -ENOMEM;
> @@ -543,7 +543,7 @@ cpu_hotplug_pm_callback(struct notifier_block *nb,
>  }
> 
> 
> -int cpu_hotplug_pm_sync_init(void)
> +static int __init cpu_hotplug_pm_sync_init(void)
>  {
>  	pm_notifier(cpu_hotplug_pm_callback, 0);
>  	return 0;
