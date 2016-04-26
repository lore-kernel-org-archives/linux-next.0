From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the renesas tree
Date: Tue, 26 Apr 2016 11:52:39 +1000
Message-ID: <20160426115239.548d1e95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47472 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750817AbcDZBwm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Apr 2016 21:52:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <viresh.kumar@linaro.org>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  arch/arm/mach-shmobile/Makefile

between commit:

  be32bcbbd182 ("soc: renesas: Move pm-rcar to drivers/soc/renesas/rcar-sysc")

from the renesas tree and commit:

  a399dc9fc500 ("cpufreq: shmobile: Use generic platdev driver")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-shmobile/Makefile
index ebb909c55b85,c9ea0e6ff4f9..000000000000
--- a/arch/arm/mach-shmobile/Makefile
+++ b/arch/arm/mach-shmobile/Makefile
@@@ -38,7 -38,7 +38,6 @@@ smp-$(CONFIG_ARCH_EMEV2)	+= smp-emev2.
  
  # PM objects
  obj-$(CONFIG_SUSPEND)		+= suspend.o
- obj-$(CONFIG_CPU_FREQ)		+= cpufreq.o
 -obj-$(CONFIG_PM_RCAR)		+= pm-rcar.o
  obj-$(CONFIG_PM_RMOBILE)	+= pm-rmobile.o
  obj-$(CONFIG_ARCH_RCAR_GEN2)	+= pm-rcar-gen2.o
  
