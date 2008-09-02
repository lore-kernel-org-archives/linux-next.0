From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc build warnings
Date: Tue, 02 Sep 2008 03:16:27 -0700 (PDT)
Message-ID: <20080902.031627.11160210.davem@davemloft.net>
References: <20080902185334.05f5a132.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:35171
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751000AbYIBKQd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 06:16:33 -0400
In-Reply-To: <20080902185334.05f5a132.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Sep 2008 18:53:34 +1000

> Today's linux-next build (sparc defconfig) got these warnings:
> 
> arch/sparc/mm/sun4c.c:1111: warning: "struct sbus_bus" declared inside parameter list
> arch/sparc/mm/sun4c.c:1111: warning: its scope is only this definition or declaration, which is probably not what you want
> arch/sparc/mm/sun4c.c:1123: warning: "struct sbus_bus" declared inside parameter list
> arch/sparc/mm/sun4c.c:1133: warning: "struct sbus_bus" declared inside parameter list
> arch/sparc/mm/sun4c.c:1140: warning: "struct sbus_bus" declared inside parameter list

Thankfully these were harmless :)

I've just pushed the following fix for this, thanks.

sparc32: Fix sun4c build warnings.

Reported by Stephen Rothwell.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 arch/sparc/mm/sun4c.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/mm/sun4c.c b/arch/sparc/mm/sun4c.c
index 95070a1..fe65aee 100644
--- a/arch/sparc/mm/sun4c.c
+++ b/arch/sparc/mm/sun4c.c
@@ -1108,7 +1108,7 @@ static void sun4c_unlockarea(char *vaddr, unsigned long size)
  * by implication and fool the page locking code above
  * if passed to by mistake.
  */
-static __u32 sun4c_get_scsi_one(char *bufptr, unsigned long len, struct sbus_bus *sbus)
+static __u32 sun4c_get_scsi_one(struct device *dev, char *bufptr, unsigned long len)
 {
 	unsigned long page;
 
@@ -1120,7 +1120,7 @@ static __u32 sun4c_get_scsi_one(char *bufptr, unsigned long len, struct sbus_bus
 	return (__u32)sun4c_lockarea(bufptr, len);
 }
 
-static void sun4c_get_scsi_sgl(struct scatterlist *sg, int sz, struct sbus_bus *sbus)
+static void sun4c_get_scsi_sgl(struct device *dev, struct scatterlist *sg, int sz)
 {
 	while (sz != 0) {
 		--sz;
@@ -1130,14 +1130,14 @@ static void sun4c_get_scsi_sgl(struct scatterlist *sg, int sz, struct sbus_bus *
 	}
 }
 
-static void sun4c_release_scsi_one(__u32 bufptr, unsigned long len, struct sbus_bus *sbus)
+static void sun4c_release_scsi_one(struct device *dev, __u32 bufptr, unsigned long len)
 {
 	if (bufptr < sun4c_iobuffer_start)
 		return; /* On kernel stack or similar, see above */
 	sun4c_unlockarea((char *)bufptr, len);
 }
 
-static void sun4c_release_scsi_sgl(struct scatterlist *sg, int sz, struct sbus_bus *sbus)
+static void sun4c_release_scsi_sgl(struct device *dev, struct scatterlist *sg, int sz)
 {
 	while (sz != 0) {
 		--sz;
-- 
1.5.6.5.GIT
