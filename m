From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: rr tree build failure
Date: Mon, 29 Dec 2008 07:23:34 -0800
Message-ID: <4958EB76.2040306@sgi.com>
References: <20081229191253.6c04bf3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:38459 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751368AbYL2PXi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 10:23:38 -0500
In-Reply-To: <20081229191253.6c04bf3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> In file included from include/linux/smp.h:33,
>                  from include/linux/topology.h:33,
>                  from include/linux/mmzone.h:763,
>                  from include/linux/gfp.h:4,
>                  from include/linux/kmod.h:22,
>                  from include/linux/module.h:13,
>                  from include/linux/crypto.h:21,
>                  from arch/x86/kernel/asm-offsets_64.c:7,
>                  from arch/x86/kernel/asm-offsets.c:4:
> arch/x86/include/asm/smp.h: In function 'num_booting_cpus':
> arch/x86/include/asm/smp.h:152: error: implicit declaration of function 'cpus_weight'
> 
> I have dropped the rr tree for today.
> 

Hi Stephen,

I have this fixed in:


commit 3b656ce6c3d7ea2a36c1ebe77d436d5550980baa
Author: Mike Travis <travis@sgi.com>
Date:   Sat Dec 27 01:45:56 2008 -0800

    x86: cleanup remaining cpumask_t ops in smpboot code

which was pushed via tip/cpus4096.  It includes many other
updates so I'm not exactly sure how this merges into
linux-next.

Thanks,
Mike
