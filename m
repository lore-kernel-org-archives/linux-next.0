From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Fri, 4 Mar 2011 16:39:05 +1100
Message-ID: <20110304163905.ed6dd630.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60472 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751253Ab1CDFjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Mar 2011 00:39:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, "Igor M. Liplianin" <liplianin@me.by>, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/Kconfig between commit
a1256092a1e87511c977a3d0ef96151cda77e5c9 ("[media] Altera FPGA firmware
download module") from the v4l-dvb tree and commit
0867b42113ec4eb8646eb361b15cbcfb741ddf5b ("staging: gma500: Intel GMA500
staging driver") from the staging tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/Kconfig
index 1ae0c1b,5295d85..0000000
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@@ -179,7 -177,7 +177,9 @@@ source "drivers/staging/cptm1217/Kconfi
  
  source "drivers/staging/ste_rmi4/Kconfig"
  
 +source "drivers/staging/altera-stapl/Kconfig"
 +
+ source "drivers/staging/gma500/Kconfig"
+ 
  endif # !STAGING_EXCLUDE_BUILD
  endif # STAGING
