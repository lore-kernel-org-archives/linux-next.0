From: Rakib Mullick <rakib.mullick@gmail.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Sun, 12 Dec 2010 12:26:02 +0600
Message-ID: <AANLkTinRaGcEzGaRZSvGzRAubNtRUnHstru_0E0aCdrd@mail.gmail.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
	<20101210092533.4f426650.randy.dunlap@oracle.com>
	<AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51496 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840Ab0LLG0D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 12 Dec 2010 01:26:03 -0500
In-Reply-To: <AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Sun, Dec 12, 2010 at 11:27 AM, Rakib Mullick <rakib.mullick@gmail.co=
m> wrote:
> On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.c=
om> wrote:
>> On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20101209:
>>
>>
>> arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nmi_=
watchdog'
>> include/linux/nmi.h:22: note: previous definition of 'touch_nmi_watc=
hdog' was here
>>
> Hello Randy,
>
> Please checkout the following patch. Does it work?
> ----
>
> x86: Fix kernel build in hw_nmi.c when CONFIG_HARDLOCKUP_DETECTOR=3Dn=
=2E
>
> This patch fixes kernel build introduced by commit
> 96a84c20d635fb1e98ab92f9fc517c4441f5c424. That commit supposed to
> define touch_nmi_watchdog when CONFIG_HARDLOCKUP_DETECTOR=3Dy in
> hw_nmi.c. But mistakenly defines touch_nmi_watchdog when
> CONFIG_HARDLOCKUP_DETECTOR=3Dn in hw_nmi.c.
>
> arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of =91touch_nmi=
_watchdog=92
> include/linux/nmi.h:23: error: previous definition of
> =91touch_nmi_watchdog=92 was here
>

NO. I don't think this is the correct one. Cause we don't want
touch_softlockup_watchdog() to be called if
CONFIG_HARDLOCKUP_DETECTOR=3Dy.

> Signed-off-by: Rakib Mullick <rakib.mullick@gmail.com>
> ---
>
> diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_=
nmi.c
> index c558e11..2056569 100644
> --- a/arch/x86/kernel/apic/hw_nmi.c
> +++ b/arch/x86/kernel/apic/hw_nmi.c
> @@ -24,7 +24,7 @@ u64 hw_nmi_get_sample_period(void)
> =A0}
> =A0#endif
>
> -#ifndef CONFIG_HARDLOCKUP_DETECTOR
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR
> =A0void touch_nmi_watchdog(void)
> =A0{
> =A0 =A0 =A0 =A0touch_softlockup_watchdog();
>
