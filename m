From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the  tree
Date: Tue, 2 Mar 2010 14:36:12 +1100
Message-ID: <20100302143612.75b72e22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48766 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753250Ab0CBDgO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Mar 2010 22:36:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/vga/Kconfig between commit
36028f3383872eefb558a4aae4c12ec2b5fa640f ("vgaarb: Add user selectability
of the number of GPUS in a system") from Linus' tree and commit
6a9ee8af344e3bd7dbd61e67037096cdf7f83289 ("vga_switcheroo: initial
implementation (v15)") from the drm tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/vga/Kconfig
index 0920492,6116a01..0000000
--- a/drivers/gpu/vga/Kconfig
+++ b/drivers/gpu/vga/Kconfig
@@@ -9,10 -9,15 +9,23 @@@ config VGA_AR
  	  see Documentation/vgaarbiter.txt for more details. Select this to
  	  enable VGA arbiter.
  
 +config VGA_ARB_MAX_GPUS
 +	int "Maximum number of GPUs"
 +	default 16
 +	depends on VGA_ARB
 +	help
 +	  Reserves space in the kernel to maintain resource locking for
 +	  multiple GPUS.  The overhead for each GPU is very small.
++
+ config VGA_SWITCHEROO
+ 	bool "Laptop Hybrid Grapics - GPU switching support"
+ 	default y
+ 	depends on X86
+ 	depends on ACPI
+ 	help
+ 	  Many laptops released in 2008/9/10 have two gpus with a multiplxer
+ 	  to switch between them. This adds support for dynamic switching when
+           X isn't running and delayed switching until the next logoff. This
+ 	  features is called hybrid graphics, ATI PowerXpress, and Nvidia
+ 	  HybridPower.
+ 
