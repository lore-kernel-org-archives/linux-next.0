From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: Re: [PATCH -next] optprobes: fix kconfig depends/selects
Date: Sun, 12 Sep 2010 13:49:06 +0300
Message-ID: <AANLkTimu4zHZrpGkLVQkxsqax1DDefjZXwTn2cxy4WsL@mail.gmail.com>
References: <20100812122641.fe88e846.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:39909 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751563Ab0ILKtH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 12 Sep 2010 06:49:07 -0400
In-Reply-To: <20100812122641.fe88e846.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, akpm <akpm@linux-foundation.org>

On Thu, Aug 12, 2010 at 10:26 PM, Randy Dunlap <randy.dunlap@oracle.com=
> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> KALLSYMS and KALLSYMS_ALL depend on DEBUG_KERNEL, so add that depende=
ncy.
> KALLSYMS_ALL depends on KALLSYMS, so select both of them, not just KA=
LLSYMS_ALL.
>
> warning: (OPTPROBES && KPROBES && HAVE_OPTPROBES && !PREEMPT || MTD_U=
BI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILESYSTE=
MS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && =
STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCYTOP_=
SUPPORT) selects KALLSYMS_ALL which has unmet direct dependencies (DEBU=
G_KERNEL && KALLSYMS)
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: =C2=A0 =C2=A0 Ananth N Mavinakayanahalli <ananth@in.ibm.com>
> Cc: =C2=A0 =C2=A0 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.co=
m>
> Cc: =C2=A0 =C2=A0 "David S. Miller" <davem@davemloft.net>
> Cc: =C2=A0 =C2=A0 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
> ---
> =C2=A0arch/Kconfig | =C2=A0 =C2=A02 ++
> =C2=A01 file changed, 2 insertions(+)
>
> --- linux-next-20100810.orig/arch/Kconfig
> +++ linux-next-20100810/arch/Kconfig
> @@ -45,6 +45,8 @@ config OPTPROBES
> =C2=A0 =C2=A0 =C2=A0 =C2=A0def_bool y
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on KPROBES && HAVE_OPTPROBES
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !PREEMPT
> + =C2=A0 =C2=A0 =C2=A0 depends on DEBUG_KERNEL
> + =C2=A0 =C2=A0 =C2=A0 select KALLSYMS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select KALLSYMS_ALL
>
> =C2=A0config HAVE_EFFICIENT_UNALIGNED_ACCESS
> --

This causes another problem:

arch/Kconfig:33:error: recursive dependency detected!
arch/Kconfig:33:	symbol KPROBES depends on KALLSYMS
init/Kconfig:825:	symbol KALLSYMS is selected by OPTPROBES
arch/Kconfig:44:	symbol OPTPROBES depends on KPROBES

The 'select KALLSYMS' is redundant.

Otherwise: Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>

--=20
=46elipe Contreras
