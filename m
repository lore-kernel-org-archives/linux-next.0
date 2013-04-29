From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the xen-arm
 tree
Date: Mon, 29 Apr 2013 10:50:22 +0100
Message-ID: <alpine.DEB.2.02.1304291049060.5398@kaball.uk.xensource.com>
References: <20130429175426.9423279609437a2d746cbb7b@canb.auug.org.au> <20130429082511.GA539@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:29308 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753523Ab3D2JuZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Apr 2013 05:50:25 -0400
In-Reply-To: <20130429082511.GA539@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>

On Mon, 29 Apr 2013, Catalin Marinas wrote:
> Stephen,
> 
> On Mon, Apr 29, 2013 at 08:54:26AM +0100, Stephen Rothwell wrote:
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/mach-virt/platsmp.c between commit fe4bff02886b ("arm: introduce
> > psci_smp_ops") from the xen-arm tree and commit c0114709ed85 ("irqchip:
> > gic: Perform the gic_secondary_init() call via CPU notifier") from the
> > arm-soc tree.
> > 
> > The former renamed the file (and contents) so I applied the following
> > patch and can carry the fix as necessary (no action is required).
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 29 Apr 2013 17:52:27 +1000
> > Subject: [PATCH] arm: fix for Perform the gic_secondary_init() call via CPU
> >  notifier
> > 
> > due to code movement.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/arm/kernel/psci_smp.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
> > index 6ef139d..cd9acc7 100644
> > --- a/arch/arm/kernel/psci_smp.c
> > +++ b/arch/arm/kernel/psci_smp.c
> > @@ -14,7 +14,6 @@
> >   */
> >  
> >  #include <linux/init.h>
> > -#include <linux/irqchip/arm-gic.h>
> >  #include <linux/smp.h>
> >  #include <linux/of.h>
> >  
> > @@ -55,11 +54,6 @@ static int __cpuinit psci_boot_secondary(unsigned int cpu,
> >  	return -ENODEV;
> >  }
> >  
> > -static void __cpuinit psci_secondary_init(unsigned int cpu)
> > -{
> > -	gic_secondary_init(0);
> > -}
> > -
> >  #ifdef CONFIG_HOTPLUG_CPU
> >  void __ref psci_cpu_die(unsigned int cpu)
> >  {
> > @@ -84,7 +78,6 @@ bool __init psci_smp_available(void)
> >  }
> >  
> >  struct smp_operations __initdata psci_smp_ops = {
> > -	.smp_secondary_init	= psci_secondary_init,
> >  	.smp_boot_secondary	= psci_boot_secondary,
> >  	.cpu_die		= psci_cpu_die,
> >  };
> 
> The fix looks fine. Thanks.

Indeed, thanks! I'll add to it to the tree.
