From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3] watchdog: Fix a watchdog crash in some
 configurations
Date: Tue, 5 May 2015 13:42:43 -0700
Message-ID: <alpine.LNX.2.03.1505051336470.17679@nvidia.com>
References: <55491ef8.oLKEdMAPkQJVpO38%akpm@linux-foundation.org> <1430857245-16927-1-git-send-email-jhubbard@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7000 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbbEEUmo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 16:42:44 -0400
In-Reply-To: <1430857245-16927-1-git-send-email-jhubbard@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: john.hubbard@gmail.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, mm-commits@vger.kernel.org

> +	if (tick_nohz_full_enabled()) {
> +		if (!cpumask_empty(tick_nohz_full_mask))
> +			pr_info("Disabling watchdog on nohz_full cores by default\n");
> +		cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
> +			       tick_nohz_full_mask);
> +	} else
> +		cpumask_copy(&watchdog_cpumask, cpu_possible_mask);

In case it's not clear, the only difference between v3 and v2 of this 
patch, is that v3 corrects the checkpatch.pl violations. (I apologize for 
the multiple emails required to get such a small patch perfected. I'll 
have the workflow going much smoother next time, I promise.)

>  
>  	if (watchdog_enabled)
>  		watchdog_enable_all_cpus();
> -- 
> 2.3.7
> 
> 

thanks,
John H.
