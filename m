From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Tue, 30 Dec 2008 07:31:40 +1030
Message-ID: <200812300731.40641.rusty@rustcorp.com.au>
References: <20081229191253.6c04bf3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:44871 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753861AbYL2VBr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 16:01:47 -0500
In-Reply-To: <20081229191253.6c04bf3e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Monday 29 December 2008 18:42:53 Stephen Rothwell wrote:
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

Oh, fun.  We added a config option to disable the deprecated cpus_* functions;
it's mainly for those interested in helping with the conversion.

Of course, allmodconfig turns it on.  I made it depend on CONFIG_BROKEN for now.

Thanks,
Rusty.
