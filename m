From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: linux-next: 20090925 - hvc driver build breaks with !HVC_CONSOLE
Date: Fri, 25 Sep 2009 19:01:43 +0530
Message-ID: <20090925133143.GD6831@linux.vnet.ibm.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:33433 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786AbZIYNbn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2009 09:31:43 -0400
Content-Disposition: inline
In-Reply-To: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org

Hi Stephen,

	next-20090925 randconfig build breaks on hvcs driver on powerpc,
with HVC_CONSOLE=n.

ERROR: ".hvc_put_chars" [drivers/char/hvcs.ko] undefined!
ERROR: ".hvc_get_chars" [drivers/char/hvcs.ko] undefined!

adding the dependency of HVC_CONSOLE helped

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
--
 drivers/char/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index a2a0e67..2583231 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -682,7 +682,7 @@ config VIRTIO_CONSOLE
 
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
-	depends on PPC_PSERIES
+	depends on PPC_PSERIES && HVC_CONSOLE
 	help
 	  Partitionable IBM Power5 ppc64 machines allow hosting of
 	  firmware virtual consoles from one Linux partition by
			
			Kamalesh
