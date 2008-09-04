From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparc tree
Date: Thu, 4 Sep 2008 11:17:17 +1000
Message-ID: <20080904111717.8aec7545.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47726 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752133AbYIDBRZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 21:17:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

Hi Dave,

Today's linux-next merge of the sparc tree got a conflict in
arch/sparc/kernel/of_device.c between commit
e3c71a32915fabb095de7108c22672e457631a08 ("sparc: Fix resource flags for
PCI children in OF device tree") from Linus' tree and commit
5280267c1dddb8d413595b87dc406624bb497946 ("sparc: Fix handling of LANCE
and ESP parent nodes in of_device.c") from the sparc tree.

The former just changed the context of the latter.  I fixed it up (see
below).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/sparc/kernel/of_device.c
index c481d45,4ef1607..0000000
--- a/arch/sparc/kernel/of_device.c
+++ b/arch/sparc/kernel/of_device.c
@@@ -371,12 -409,8 +415,9 @@@ static void __init build_device_resourc
  
  		memcpy(addr, reg, na * 4);
  
 +		flags = bus->get_flags(reg, 0);
 +
- 		/* If the immediate parent has no ranges property to apply,
- 		 * just use a 1<->1 mapping.
- 		 */
- 		if (of_find_property(pp, "ranges", NULL) == NULL) {
+ 		if (use_1to1_mapping(pp)) {
  			result = of_read_addr(addr, na);
  			goto build_res;
  		}
