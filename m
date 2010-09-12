From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] optprobes: fix kconfig depends/selects
Date: Sun, 12 Sep 2010 11:46:13 -0700
Message-ID: <20100912114613.47bc76fc.randy.dunlap@oracle.com>
References: <20100812122641.fe88e846.randy.dunlap@oracle.com>
	<AANLkTimu4zHZrpGkLVQkxsqax1DDefjZXwTn2cxy4WsL@mail.gmail.com>
	<4C8D1D50.600@oracle.com>
	<AANLkTikL0JEiWjms9DPYK=jfNmOP78HC7qu+deO5+dP6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:18718 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805Ab0ILSrz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 12 Sep 2010 14:47:55 -0400
In-Reply-To: <AANLkTikL0JEiWjms9DPYK=jfNmOP78HC7qu+deO5+dP6@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, akpm <akpm@linux-foundation.org>

On Sun, 12 Sep 2010 21:41:07 +0300 Felipe Contreras wrote:

> On Sun, Sep 12, 2010 at 9:34 PM, Randy Dunlap <randy.dunlap@oracle.co=
m> wrote:
> > On 09/12/10 03:49, Felipe Contreras wrote:
> >> On Thu, Aug 12, 2010 at 10:26 PM, Randy Dunlap <randy.dunlap@oracl=
e.com> wrote:
> >>> From: Randy Dunlap <randy.dunlap@oracle.com>
> >>>
> >>> KALLSYMS and KALLSYMS_ALL depend on DEBUG_KERNEL, so add that dep=
endency.
> >>> KALLSYMS_ALL depends on KALLSYMS, so select both of them, not jus=
t KALLSYMS_ALL.
> >>>
> >>> warning: (OPTPROBES && KPROBES && HAVE_OPTPROBES && !PREEMPT || M=
TD_UBI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILES=
YSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT=
 && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCY=
TOP_SUPPORT) selects KALLSYMS_ALL which has unmet direct dependencies (=
DEBUG_KERNEL && KALLSYMS)
> >>>
> >>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> >>> Cc: =A0 =A0 Ananth N Mavinakayanahalli <ananth@in.ibm.com>
> >>> Cc: =A0 =A0 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
> >>> Cc: =A0 =A0 "David S. Miller" <davem@davemloft.net>
> >>> Cc: =A0 =A0 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
> >>> ---
> >>> =A0arch/Kconfig | =A0 =A02 ++
> >>> =A01 file changed, 2 insertions(+)
> >>>
> >>> --- linux-next-20100810.orig/arch/Kconfig
> >>> +++ linux-next-20100810/arch/Kconfig
> >>> @@ -45,6 +45,8 @@ config OPTPROBES
> >>> =A0 =A0 =A0 =A0def_bool y
> >>> =A0 =A0 =A0 =A0depends on KPROBES && HAVE_OPTPROBES
> >>> =A0 =A0 =A0 =A0depends on !PREEMPT
> >>> + =A0 =A0 =A0 depends on DEBUG_KERNEL
> >>> + =A0 =A0 =A0 select KALLSYMS
> >>> =A0 =A0 =A0 =A0select KALLSYMS_ALL
> >>>
> >>> =A0config HAVE_EFFICIENT_UNALIGNED_ACCESS
> >>> --
> >>
> >> This causes another problem:
> >>
> >> arch/Kconfig:33:error: recursive dependency detected!
> >> arch/Kconfig:33: =A0 =A0 =A0symbol KPROBES depends on KALLSYMS
> >> init/Kconfig:825: =A0 =A0 symbol KALLSYMS is selected by OPTPROBES
> >> arch/Kconfig:44: =A0 =A0 =A0symbol OPTPROBES depends on KPROBES
> >>
> >> The 'select KALLSYMS' is redundant.
> >>
> >> Otherwise: Signed-off-by: Felipe Contreras <felipe.contreras@gmail=
=2Ecom>
> >
> > Thanks for checking. =A0I saw this problem just a day or two ago my=
self.
> >
> > Dropping the select does not eliminate the kconfig warning.
> > I'll try something else.
>=20
> Huh? The original warning is gone by just adding 'depends on DEBUG_KE=
RNEL'.

not so in my testing.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
