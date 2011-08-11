From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the moduleh tree with the arm tree
Date: Thu, 11 Aug 2011 15:02:58 +1000
Message-ID: <20110811150258.a4aace08d3a6eedb8170b623@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59120 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752235Ab1HKFDC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Aug 2011 01:03:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Paul,

Today's linux-next merge of the moduleh tree got a conflict in
arch/arm/common/scoop.c between commit 2f8163baada3 ("ARM: gpio: convert
includes of mach/gpio.h and asm/gpio.h to linux/gpio.h") from the arm
tree and commit d8e58c821f3e ("arm: Add export.h to ARM specific files as
required") from the moduleh tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/common/scoop.c
index 1cde34a,98288e4..0000000
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@@ -17,6 -16,8 +17,7 @@@
  #include <linux/slab.h>
  #include <linux/platform_device.h>
  #include <linux/io.h>
+ #include <linux/export.h>
 -#include <asm/gpio.h>
  #include <asm/hardware/scoop.h>
  
  /* PCMCIA to Scoop linkage
