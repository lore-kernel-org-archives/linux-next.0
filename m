From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: Removal of GENERIC_GPIO breaks -next
Date: Wed, 17 Apr 2013 17:37:31 +0530
Message-ID: <516E9083.6050808@synopsys.com>
References: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kiruna.synopsys.com ([198.182.44.80]:37409 "EHLO
	kiruna.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966017Ab3DQMHr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 08:07:47 -0400
In-Reply-To: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shaveta Leekha <shaveta@freescale.com>, Christian Ruppert <christian.ruppert@abilis.com>, linux-next <linux-next@vger.kernel.org>

On 04/17/2013 04:07 PM, Alexandre Courbot wrote:
> 
> Also arch/arc/plat-tb10x/Kconfig now defines GENERIC_GPIO, this will
> not cause breakage but should not be here anymore (ideally removed by
> the "Remove GENERIC_GPIO config option" patch)
> 
> Apart from these two issues, things seem to have gone fine, but I'm
> not sure how they should be addressed and by who?

For the arc issue - I thought we'd come to consensus already. Quoting your earlier
email:

"If the only reference to GENERIC_GPIO in your architecture or drivers is the
declaration of this config option, then it is perfectly fine - I will take care of
removing it when the time is right."

Anyhow it's a minor issue - since your code is in -next, maybe you can add the
following patch to your branch - rather than routing via my tree - better for
bisectablity. I compile tested here !

------------------->
From: Vineet Gupta <vgupta@synopsys.com>
Date: Wed, 17 Apr 2013 17:33:02 +0530
Subject: [PATCH] ARC: [TB10x] Remove GENERIC_GPIO

This tracks Alexandre Courbot's mainline GPIO rework

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/plat-tb10x/Kconfig |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arc/plat-tb10x/Kconfig b/arch/arc/plat-tb10x/Kconfig
index 4e12127..1d34521 100644
--- a/arch/arc/plat-tb10x/Kconfig
+++ b/arch/arc/plat-tb10x/Kconfig
@@ -27,10 +27,3 @@ menuconfig ARC_PLAT_TB10X
 	  Abilis Systems. TB10x is based on the ARC700 CPU architecture.
 	  Say Y if you are building a kernel for one of the SOCs in this
 	  series (e.g. TB100 or TB101). If in doubt say N.
-
-if ARC_PLAT_TB10X
-
-config GENERIC_GPIO
-	def_bool y
-
-endif
-- 
1.7.10.4
