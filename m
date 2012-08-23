From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the rr tree
Date: Thu, 23 Aug 2012 12:52:04 +0200
Message-ID: <20120823105200.GA18835@somewhere.redhat.com>
References: <20120823124348.831760a775f7bcb9c8e26219@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:60475 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933164Ab2HWKwJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Aug 2012 06:52:09 -0400
Content-Disposition: inline
In-Reply-To: <20120823124348.831760a775f7bcb9c8e26219@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>

On Thu, Aug 23, 2012 at 12:43:48PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in arch/Kconfig
> between commit bd029f48459a ("Make most arch asm/module.h files use
> asm-generic/module.h") from the rr tree and commit b952741c8079
> ("cputime: Generalize CONFIG_VIRT_CPU_ACCOUNTING") from the tip tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

Looks good, thanks!

> 
> diff --cc arch/Kconfig
> index 3450115,ea5feb6..0000000
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@@ -281,23 -294,7 +294,26 @@@ config SECCOMP_FILTE
>   
>   	  See Documentation/prctl/seccomp_filter.txt for details.
>   
>  +config HAVE_MOD_ARCH_SPECIFIC
>  +	bool
>  +	help
>  +	  The arch uses struct mod_arch_specific to store data.  Many arches
>  +	  just need a simple module loader without arch specific data - those
>  +	  should not enable this.
>  +
>  +config MODULES_USE_ELF_RELA
>  +	bool
>  +	help
>  +	  Modules only use ELF RELA relocations.  Modules with ELF REL
>  +	  relocations will give an error.
>  +
>  +config MODULES_USE_ELF_REL
>  +	bool
>  +	help
>  +	  Modules only use ELF REL relocations.  Modules with ELF RELA
>  +	  relocations will give an error.
>  +
> + config HAVE_VIRT_CPU_ACCOUNTING
> + 	bool
> + 
>   source "kernel/gcov/Kconfig"
