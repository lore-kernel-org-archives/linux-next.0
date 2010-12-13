From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Mon, 13 Dec 2010 07:55:09 -0800
Message-ID: <4D0641DD.2060303@oracle.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au> <20101210092533.4f426650.randy.dunlap@oracle.com> <AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com> <20101213153719.GD18577@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40438 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917Ab0LMPz4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Dec 2010 10:55:56 -0500
In-Reply-To: <20101213153719.GD18577@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Rakib Mullick <rakib.mullick@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On 12/13/10 07:37, Don Zickus wrote:
> On Sun, Dec 12, 2010 at 11:27:02AM +0600, Rakib Mullick wrote:
>> On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.=
com> wrote:
>>> On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20101209:
>>>
>>>
>>> arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nmi=
_watchdog'
>>> include/linux/nmi.h:22: note: previous definition of 'touch_nmi_wat=
chdog' was here
>>>
>> Hello Randy,
>>
>> Please checkout the following patch. Does it work?
>=20
> This fixes the problem.  Sorry about that.  I need to remember to try=
 more
> random config options to catch these things.
> ----8<---
>=20
> From: Don Zickus <dzickus@redhat.com>
> Date: Mon, 13 Dec 2010 10:31:58 -0500
> Subject: [PATCH] x86, watchdog: Compile fix when CONFIG_LOCAL_APIC no=
t enabled
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> When adjusting the code to handle removing the old nmi watchdog,
> I forgot to consider the compile case when the local apic is not
> enabled.  This small change fixes the compile warning:
>=20
> arch/x86/kernel/apic/hw_nmi.c:28:6: error: redefinition of =E2=80=98t=
ouch_nmi_watchdog=E2=80=99
>=20
> Signed-off-by: Don Zickus <dzickus@redhat.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  arch/x86/kernel/apic/hw_nmi.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_=
nmi.c
> index c558e11..93da91d 100644
> --- a/arch/x86/kernel/apic/hw_nmi.c
> +++ b/arch/x86/kernel/apic/hw_nmi.c
> @@ -17,6 +17,7 @@
>  #include <linux/nmi.h>
>  #include <linux/module.h>
> =20
> +#ifdef ARCH_HAS_NMI_WATCHDOG
>  #ifdef CONFIG_HARDLOCKUP_DETECTOR
>  u64 hw_nmi_get_sample_period(void)
>  {
> @@ -31,6 +32,8 @@ void touch_nmi_watchdog(void)
>  }
>  EXPORT_SYMBOL(touch_nmi_watchdog);
>  #endif
> +#endif
> +
>  #ifdef arch_trigger_all_cpu_backtrace
>  /* For reliability, we're prepared to waste bits here. */
>  static DECLARE_BITMAP(backtrace_mask, NR_CPUS) __read_mostly;


--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
