From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tpmdd tree
Date: Thu, 28 Apr 2016 15:32:32 +1000
Message-ID: <20160428153232.0d6eb076@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57824 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbcD1Fcg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Apr 2016 01:32:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Ricard <christophe.ricard@gmail.com>

Hi Jarkko,

After merging the tpmdd tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from /home/sfr/next/next/include/linux/rcupdate.h:38:0,
                 from /home/sfr/next/next/include/linux/idr.h:18,
                 from /home/sfr/next/next/include/linux/kernfs.h:14,
                 from /home/sfr/next/next/include/linux/sysfs.h:15,
                 from /home/sfr/next/next/include/linux/kobject.h:21,
                 from /home/sfr/next/next/include/linux/device.h:17,
                 from /home/sfr/next/next/include/linux/dma-mapping.h:6,
                 from /home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c:18:
/home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c: In function 'tpm_ibmvtpm_probe':
/home/sfr/next/next/include/linux/spinlock.h:295:1: error: expected ';' before 'do'
 do {       \
 ^
/home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c:632:2: note: in expansion of macro 'spin_lock_init'
  spin_lock_init(&ibmvtpm->rtce_lock);
  ^

Caused by commit

  28157164b056 ("tpm: Remove useless priv field in struct tpm_vendor_specific")

A ';' was missed.

I added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 Apr 2016 15:27:17 +1000
Subject: [PATCH] tpm: fix for typo in tpm/tpm_ibmvtpm.c

Fixes: 28157164b056 ("tpm: Remove useless priv field in struct tpm_vendor_specific")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 6b22826f0e11..946025a7413b 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -627,7 +627,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 
 	crq_q->index = 0;
 
-	dev_set_drvdata(&chip->dev, ibmvtpm)
+	dev_set_drvdata(&chip->dev, ibmvtpm);
 
 	spin_lock_init(&ibmvtpm->rtce_lock);
 
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
