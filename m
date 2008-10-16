From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] tpm: don't export static functions
Date: Thu, 16 Oct 2008 20:36:09 +1100
Message-ID: <20081016203609.0ddd419d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50173 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753979AbYJPKe0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 06:34:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>, Rajiv Andrade <srajiv@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>

Today's linux-next build (powerpc_allyesconfig) failed like this:

drivers/char/tpm/tpm.c:1162: error: __ksymtab_tpm_dev_release causes a section type conflict

Caused by commit 253115b71fa06330bd58afbe01ccaf763a8a0cf1 ("The
tpm_dev_release function is only called for platform devices, not pnp")
which exported a static function.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/tpm/tpm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/tpm/tpm.c b/drivers/char/tpm/tpm.c
index 1fee703..f61c9fe 100644
--- a/drivers/char/tpm/tpm.c
+++ b/drivers/char/tpm/tpm.c
@@ -1150,7 +1150,7 @@ EXPORT_SYMBOL_GPL(tpm_dev_vendor_release);
  * Once all references to platform device are down to 0,
  * release all allocated structures.
  */
-static void tpm_dev_release(struct device *dev)
+void tpm_dev_release(struct device *dev)
 {
 	struct tpm_chip *chip = dev_get_drvdata(dev);
 
-- 
1.5.6.5

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
