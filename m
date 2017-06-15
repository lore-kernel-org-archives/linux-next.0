From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the reset tree
Date: Fri, 16 Jun 2017 09:15:32 +1000
Message-ID: <20170616091532.6cf9127a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751639AbdFOXPg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 19:15:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  MAINTAINERS

between commits:

  18a006203b88 ("dt-bindings: reset: Add TI SCI reset binding")
  28df169b9afa ("reset: Add the TI SCI reset driver")

from the reset tree and commits:

  8f306cfe4383 ("Documentation: dt: Add TI SCI clock driver")
  b745c0794e2f ("clk: keystone: Add sci-clk driver support")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 003e0e302d46,1ba72e6d8254..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12638,8 -12630,8 +12638,10 @@@ F:	include/linux/soc/ti/ti_sci_protocol
  F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
  F:	include/dt-bindings/genpd/k2g.h
  F:	drivers/soc/ti/ti_sci_pm_domains.c
 +F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 +F:	drivers/reset/reset-ti-sci.c
+ F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
+ F:	drivers/clk/keystone/sci-clk.c
  
  THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
  M:	Hans Verkuil <hverkuil@xs4all.nl>
