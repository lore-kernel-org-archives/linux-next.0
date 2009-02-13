From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] Staging: pohmelfs should depend on CRYPTO
Date: Fri, 13 Feb 2009 18:06:54 +0300
Message-ID: <20090213150654.GA7390@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.184]:1807 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661AbZBMPHE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 10:07:04 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/pohmelfs/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/pohmelfs/Kconfig b/drivers/staging/pohmelfs/Kconfig
index f150ecb..4c6276b 100644
--- a/drivers/staging/pohmelfs/Kconfig
+++ b/drivers/staging/pohmelfs/Kconfig
@@ -1,6 +1,7 @@
 config POHMELFS
 	tristate "POHMELFS filesystem support"
 	select CONNECTOR
+	select CRYPTO
 	select CRYPTO_BLKCIPHER
 	select CRYPTO_HMAC
 	help
