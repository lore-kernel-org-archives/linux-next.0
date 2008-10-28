From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Tue, 28 Oct 2008 09:15:54 +0100
Message-ID: <20081028081554.GE15734@elte.hu>
References: <20081028161424.ce67a349.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36797 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751865AbYJ1IQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 04:16:34 -0400
Content-Disposition: inline
In-Reply-To: <20081028161424.ce67a349.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in
> arch/x86/mm/Makefile between commit
> fd3fdf11d3c649769e02459c5f1b8081a15e9007 ("trace: add the MMIO-tracer to
> the tracer menu, cleanup") from the ftrace tree and commit
> 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
> core") from the kmemcheck tree.
> 
> Just context changes.  I fixed it (see below) and can carry the fix.

> +++ b/arch/x86/mm/Makefile
> @@@ -8,8 -8,11 +8,10 @@@ obj-$(CONFIG_X86_PTDUMP)	+= dump_pageta
>   
>   obj-$(CONFIG_HIGHMEM)		+= highmem_32.o
>   
> + obj-$(CONFIG_KMEMCHECK)		+= kmemcheck/
> + 
>  -obj-$(CONFIG_MMIOTRACE_HOOKS)	+= kmmio.o
>   obj-$(CONFIG_MMIOTRACE)		+= mmiotrace.o
>  -mmiotrace-y			:= pf_in.o mmio-mod.o
>  +mmiotrace-y			:= kmmio.o pf_in.o mmio-mod.o

thanks Stephen, that's the correct resolution i have as well.

	Ingo
