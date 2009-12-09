From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Wed, 9 Dec 2009 16:34:35 +1100
Message-ID: <20091209163435.244f7f1f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46971 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752128AbZLIFea (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 00:34:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>, "John W. Linville" <linville@tuxdriver.com>

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in
drivers/staging/vt6655/Kconfig and drivers/staging/vt6656/Kconfig between
commit 125b181aec7a67c71234284ecf6d9c729d05deda ("staging: Add proper
selection of WIRELESS_EXT and WEXT_PRIV") from Linus' tree and commit
a0d2ec259009d9378343697af84636f1e16c2421 ("Staging: vt6x depends on
WLAN") from the staging tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/vt6655/Kconfig
index 825bbc4,ed51d7c..0000000
--- a/drivers/staging/vt6655/Kconfig
+++ b/drivers/staging/vt6655/Kconfig
@@@ -1,8 -1,6 +1,8 @@@
  config VT6655
     tristate "VIA Technologies VT6655 support"
-    depends on PCI
 -   depends on WIRELESS_EXT && PCI && WLAN
++   depends on PCI && WLAN
 +   select WIRELESS_EXT
 +   select WEXT_PRIV
     ---help---
     This is a vendor-written driver for VIA VT6655.
  
diff --cc drivers/staging/vt6656/Kconfig
index 87bcd26,fcde661..0000000
--- a/drivers/staging/vt6656/Kconfig
+++ b/drivers/staging/vt6656/Kconfig
@@@ -1,8 -1,6 +1,8 @@@
  config VT6656
  	tristate "VIA Technologies VT6656 support"
- 	depends on USB
 -	depends on WIRELESS_EXT && USB && WLAN
++	depends on USB && WLAN
 +	select WIRELESS_EXT
 +	select WEXT_PRIV
  	---help---
  	This is a vendor-written driver for VIA VT6656.
  
