From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: next-20081029: arch/ia64/include/asm/smp.h:60: error: expected
	')' before '*' token
Date: Thu, 30 Oct 2008 21:05:48 +0300
Message-ID: <20081030180548.GB13399@x200.localdomain>
References: <20081029145150.GA8668@x200.localdomain> <200810301656.m9UGuQUQ007129@agluck-lia64.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.185]:35218 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756706AbYJ3SIk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 14:08:40 -0400
Received: by nf-out-0910.google.com with SMTP id d3so341737nfc.21
        for <linux-next@vger.kernel.org>; Thu, 30 Oct 2008 11:08:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <200810301656.m9UGuQUQ007129@agluck-lia64.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Oct 30, 2008 at 09:56:27AM -0700, Luck, Tony wrote:
> > On ia64-bigsur (and other ia64 defconfigs):
> > 
> >   CC      arch/ia64/kernel/asm-offsets.s
> > In file included from include/linux/smp.h:30,
> >                  from include/linux/sched.h:68,
> >                  from arch/ia64/kernel/asm-offsets.c:9:
> > arch/ia64/include/asm/smp.h:60: error: expected ')' before '*' token
> > arch/ia64/include/asm/smp.h:60: error: expected ')' before 'cpu_online_mask'

> --- a/arch/ia64/include/asm/smp.h
> +++ b/arch/ia64/include/asm/smp.h
> @@ -57,7 +57,6 @@ extern struct smp_boot_data {
>  
>  extern char no_int_routing __devinitdata;
>  
> -extern cpumask_t cpu_online_map;

This definitely helps.
