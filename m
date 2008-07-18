From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: pci tree build failure
Date: Fri, 18 Jul 2008 09:53:22 +0200
Message-ID: <20080718075322.GF6875@elte.hu>
References: <20080717130924.edd5a501.sfr@canb.auug.org.au> <200807180057.07192.rjw@sisk.pl> <20080718160904.64541954.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53014 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753211AbYGRHxs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 03:53:48 -0400
Content-Disposition: inline
In-Reply-To: <20080718160904.64541954.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Rafael,
> 
> On Fri, 18 Jul 2008 00:57:06 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >
> > The patch is correct.
> 
> Thanks.

heh, i've done the exactly same change yesterday night, independently, 
in tip/xen-64bit - where this interaction originates from. (see below)

but i zapped it and took yours instead because yours came 19 hours 
earlier - i should have checked my mbox sooner ;)

Jeremy, is this change fine with you too?

( btw., could you please Cc: lkml to all patches? It's not like 
  linux-next is irrelevant to lkml - it's highly on topic in fact - and 
  what seems like future stuff today is an actuality tomorrow that 
  people might want to grep for. )

	Ingo

---------------------------->
commit dc860d89be3e640b98e9e202611466cc22575166
Author: Ingo Molnar <mingo@elte.hu>
Date:   Thu Jul 17 23:58:52 2008 +0200

    x86, xen: adopt suspend/resume API use
    
    the device_power_up()/device_resume() APIs got changed by:
    1eede070a5 "Introduce new top level suspend and hibernation callbacks".
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 drivers/xen/manage.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index 2bb268e..a5bc91a 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -63,7 +63,7 @@ static int xen_suspend(void *data)
 	gnttab_resume();
 	xen_mm_unpin_all();
 
-	device_power_up();
+	device_power_up(PMSG_RESUME);
 
 	if (!*cancelled) {
 		xen_irq_resume();
@@ -114,7 +114,7 @@ static void do_suspend(void)
 	} else
 		xenbus_suspend_cancel();
 
-	device_resume();
+	device_resume(PMSG_RESUME);
 
 	/* Make sure timer events get retriggered on all CPUs */
 	clock_was_set();
