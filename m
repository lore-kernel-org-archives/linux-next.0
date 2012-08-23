From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Wed, 22 Aug 2012 20:22:49 -0700
Message-ID: <20120823032249.GB31059@linux.vnet.ibm.com>
References: <20120823130143.86cb19b5c9799d138cdb0b07@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:37582 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757207Ab2HWDXI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Aug 2012 23:23:08 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 22 Aug 2012 21:23:07 -0600
Content-Disposition: inline
In-Reply-To: <20120823130143.86cb19b5c9799d138cdb0b07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Thu, Aug 23, 2012 at 01:01:43PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in arch/Kconfig
> between commit b952741c8079 ("cputime: Generalize
> CONFIG_VIRT_CPU_ACCOUNTING") from the tip tree and commit 3dbdfc26e27f
> ("rcu: Settle config for userspace extended quiescent state") from the
> rcu tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good, thank you!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/Kconfig
> index 07db929,1c7c9be..0000000
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@@ -294,26 -274,14 +294,36 @@@ config SECCOMP_FILTE
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
>  +config HAVE_VIRT_CPU_ACCOUNTING
>  +	bool
>  +
> + config HAVE_RCU_USER_QS
> + 	bool
> + 	help
> + 	  Provide kernel entry/exit hooks necessary for userspace
> + 	  RCU extended quiescent state. Syscalls need to be wrapped inside
> + 	  rcu_user_exit()-rcu_user_enter() through the slow path using
> + 	  TIF_NOHZ flag. Exceptions handlers must be wrapped as well. Irqs
> + 	  are already protected inside rcu_irq_enter/rcu_irq_exit() but
> + 	  preemption or signal handling on irq exit still need to be protected.
> + 
>   source "kernel/gcov/Kconfig"
