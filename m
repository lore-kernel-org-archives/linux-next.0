From: Don Zickus <dzickus@redhat.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Mon, 13 Dec 2010 09:44:34 -0500
Message-ID: <20101213144434.GB18577@redhat.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
 <20101210092533.4f426650.randy.dunlap@oracle.com>
 <AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40245 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753280Ab0LMOpH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Dec 2010 09:45:07 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rakib Mullick <rakib.mullick@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Sun, Dec 12, 2010 at 11:27:02AM +0600, Rakib Mullick wrote:
> On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
> >
> >> Hi all,
> >>
> >> Changes since 20101209:
> >
> >
> > arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nmi_watchdog'
> > include/linux/nmi.h:22: note: previous definition of 'touch_nmi_watchdog' was here

I'll have to checkout that branch to see what got merged.  I thought I
fixed all these.  Is there a config I can use to duplicate these?

> diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_nmi.c
> index c558e11..2056569 100644
> --- a/arch/x86/kernel/apic/hw_nmi.c
> +++ b/arch/x86/kernel/apic/hw_nmi.c
> @@ -24,7 +24,7 @@ u64 hw_nmi_get_sample_period(void)
>  }
>  #endif
> 
> -#ifndef CONFIG_HARDLOCKUP_DETECTOR
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR
>  void touch_nmi_watchdog(void)
>  {
>  	touch_softlockup_watchdog();

NAK.  This isn't the right patch.  This chunk is in here because of
changes to nmi.h.  Something broke in that file.

Cheers,
Don
