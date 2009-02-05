From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/2] CPUFREQ: powernow-k8: Forgot to use printk instead
	of WARN_ONCE in last patch
Date: Thu, 5 Feb 2009 13:02:03 +0100
Message-ID: <20090205120203.GA8799@elte.hu>
References: <1233829109-23358-1-git-send-email-trenn@suse.de> <1233829109-23358-2-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55690 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752730AbZBEMC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 07:02:27 -0500
Content-Disposition: inline
In-Reply-To: <1233829109-23358-2-git-send-email-trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org


* Thomas Renninger <trenn@suse.de> wrote:

> Signed-off-by: Thomas Renninger <trenn@suse.de>
> ---
>  arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> index 83515f1..5aa832f 100644
> --- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> +++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> @@ -1247,12 +1247,12 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
>  			 * thing gets introduced
>  			 */
>  			if (!print_once) {
> -				WARN_ONCE(1, KERN_ERR FW_BUG PFX "Your BIOS "
> -					  "does not provide ACPI _PSS objects "
> -					  "in a way that Linux understands. "
> -					  "Please report this to the Linux ACPI"
> -					  " maintainers and complain to your "
> -					  "BIOS vendor.\n");
> +				printk(KERN_ERR FW_BUG PFX "Your BIOS "
> +				       "does not provide ACPI _PSS objects "
> +				       "in a way that Linux understands. "
> +				       "Please report this to the Linux ACPI"
> +				       " maintainers and complain to your "
> +				       "BIOS vendor.\n");
>  				print_once++;

hm, why the open-coded WARN_ONCE? (which print_once flag + the printk in 
essence is)

So please use WARN_ONCE(), and indent it all one tab to the left which will 
solve at least part of that ugly 6-line split up thing. And if it's a 
WARN_ONCE() then kerneloops.org will pick it up too.

	Ingo
