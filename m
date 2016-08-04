From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 - next-20160729 build failures
Date: Thu, 04 Aug 2016 12:37:41 +0200
Message-ID: <1880505.MpH3ISbtMJ@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <20160804101051.39ca1e26@canb.auug.org.au> <10480058.bD2uPUOBSy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49601 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750753AbcHDKlR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2016 06:41:17 -0400
In-Reply-To: <10480058.bD2uPUOBSy@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>

On Thursday, August 4, 2016 11:00:49 AM CEST Arnd Bergmann wrote:
> I tried this
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index b5e40ed86e60..89bca1a25916 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -44,7 +44,7 @@ modpost_link()
>         local objects
>  
>         if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
> -               objects="--whole-archive ${KBUILD_VMLINUX_INIT} ${KBUILD_VMLINUX_MAIN} --no-whole-archive"
> +               objects="${KBUILD_VMLINUX_INIT} ${KBUILD_VMLINUX_MAIN}"
>         else
>                 objects="${KBUILD_VMLINUX_INIT} --start-group ${KBUILD_VMLINUX_MAIN} --end-group"
>         fi
> 
> but that did not seem to change anything, the extra symbols are
> still there. I have not tried to understand what that actually
> does, so maybe I misunderstood your suggestion.
> 

On a second attempt, I did the same change for vmlinux instead of the
module (d'oh), and got a link failure instead:


arch/arm/mm/proc-xscale.o: In function `cpu_xscale_do_resume':
(.text+0x3d4): undefined reference to `cpu_resume_mmu'
arch/arm/kernel/setup.o: In function `setup_arch':
setup.c:(.init.text+0x910): undefined reference to `init_uts_ns'
kernel/nsproxy.o:(.data+0x4): undefined reference to `init_uts_ns'
kernel/sched/core.o: In function `update_rq_clock':
core.c:(.text+0x6d8): undefined reference to `paravirt_steal_rq_enabled'
core.c:(.text+0x6dc): undefined reference to `pv_time_ops'
kernel/sched/cputime.o: In function `account_process_tick':
cputime.c:(.text+0x794): undefined reference to `paravirt_steal_enabled'
cputime.c:(.text+0x7a0): undefined reference to `pv_time_ops'
kernel/locking/lockdep.o: In function `save_trace':
lockdep.c:(.text+0xfe8): undefined reference to `save_stack_trace'
kernel/module.o: In function `load_module':
module.c:(.text+0x1b54): undefined reference to `elf_check_arch'
module.c:(.text+0x2024): undefined reference to `apply_relocate'
kernel/debug/debug_core.o: In function `kgdb_unregister_io_module':
debug_core.c:(.text+0x2e4): undefined reference to `kgdb_arch_exit'
kernel/debug/debug_core.o: In function `kgdb_arch_set_breakpoint':
debug_core.c:(.text+0x3bc): undefined reference to `arch_kgdb_ops'
kernel/debug/debug_core.o: In function `dbg_remove_all_break':
debug_core.c:(.text+0x6d0): undefined reference to `arch_kgdb_ops'
...

However, I also see a link failure in some rare configurations
with just your patch:

arch/arm/lib/lib.a(io-acorn.o): In function `outsl':
(.text+0x38): undefined reference to `printk'

The problem being a file in a library object that is not referenced,
but that references another symbol that is not defined
(CONFIG_PRINTK=n).

	Arnd
