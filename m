From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with Linus' tree
Date: Tue, 7 Jun 2016 13:03:25 +1000
Message-ID: <20160607130325.5d38931f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39001 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751802AbcFGDD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2016 23:03:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julien Grall <julien.grall@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  drivers/clocksource/arm_arch_timer.c

between commit:

  d9b5e41591ca ("clocksource: arm_arch_timer: Extend arch_timer_kvm_info to get the virtual IRQ")

from Linus' tree and commit:

  e6f3cf51efde ("clocksource/drivers/arm_arch_timer: Convert init function to return error")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clocksource/arm_arch_timer.c
index 4814446a0024,51042ed0d9ab..000000000000
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@@ -743,13 -743,14 +744,18 @@@ static int __init arch_timer_init(void
  		}
  	}
  
- 	arch_timer_register();
- 	arch_timer_common_init();
+ 	ret = arch_timer_register();
+ 	if (ret)
+ 		return ret;
+ 
 -	return arch_timer_common_init();
++	ret = arch_timer_common_init();
 +
 +	arch_timer_kvm_info.virtual_irq = arch_timer_ppi[VIRT_PPI];
++
++	return ret;
  }
  
- static void __init arch_timer_of_init(struct device_node *np)
+ static int __init arch_timer_of_init(struct device_node *np)
  {
  	int i;
  
