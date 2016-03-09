From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the tip tree
Date: Wed, 9 Mar 2016 13:35:15 +1100
Message-ID: <20160309133515.4e7e4e95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37597 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932AbcCICfR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 21:35:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I <kishon@ti.com>

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  Documentation/kernel-parameters.txt

between commit:

  d2aa1acad22f ("mm/init: Add 'rodata=off' boot cmdline parameter to disable read-only kernel mappings")

from the tip tree and commit:

  605df8af33a7 ("phy: rockchip-usb: add handler for usb-uart functionality")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/kernel-parameters.txt
index 1bf357083cef,8a6c6c02f916..000000000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -3517,10 -3491,12 +3517,16 @@@ bytes respectively. Such letter suffixe
  
  	ro		[KNL] Mount root device read-only on boot
  
+ 	rockchip.usb_uart
+ 			Enable the uart passthrough on the designated usb port
+ 			on Rockchip SoCs. When active, the signals of the
+ 			debug-uart get routed to the D+ and D- pins of the usb
+ 			port and the regular usb controller gets disabled.
+ 
 +	rodata=		[KNL]
 +		on	Mark read-only kernel memory as read-only (default).
 +		off	Leave read-only kernel memory writable for debugging.
 +
  	root=		[KNL] Root filesystem
  			See name_to_dev_t comment in init/do_mounts.c.
  
