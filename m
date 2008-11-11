From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Tue, 11 Nov 2008 19:10:42 +1100
Message-ID: <20081111191042.ad5eab44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50953 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbYKKIK4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 03:10:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Sujith <Sujith.Manoharan@atheros.com>, "David S. Miller" <davem@davemloft.net>

Hi John, Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/net/wireless/ath9k/main.c: At top level:
drivers/net/wireless/ath9k/main.c:827: warning: conflicting types for 'ath_detach'
drivers/net/wireless/ath9k/main.c:827: error: static declaration of 'ath_detach' follows non-static declaration
drivers/net/wireless/ath9k/main.c:812: error: previous implicit declaration of 'ath_detach' was here

Caused by commit 9c84b7978f1b99048bf31be5a0218cd509e74148 ("ath9k:
Streamline attach/detach") (from the wireless/net tree) which added a
call to the static function before it was defined.

I added the patch below, which then lead to:

drivers/net/wireless/ath9k/main.c: In function 'ath_start_rfkill_poll':
drivers/net/wireless/ath9k/main.c:818: error: 'hw' undeclared (first use in this function)

So I gave up and reverted the wireless tree for today (I actually
reverted the merge of the wireless tree into the net tree).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/net/wireless/ath9k/main.c b/drivers/net/wireless/ath9k/main.c
index fb50aa0..dc66fb7 100644
--- a/drivers/net/wireless/ath9k/main.c
+++ b/drivers/net/wireless/ath9k/main.c
@@ -28,6 +28,8 @@ MODULE_DESCRIPTION("Support for Atheros 802.11n wireless LAN cards.");
 MODULE_SUPPORTED_DEVICE("Atheros 802.11n WLAN cards");
 MODULE_LICENSE("Dual BSD/GPL");
 
+static void ath_detach(struct ath_softc *sc);
+
 static struct pci_device_id ath_pci_id_table[] __devinitdata = {
 	{ PCI_VDEVICE(ATHEROS, 0x0023) }, /* PCI   */
 	{ PCI_VDEVICE(ATHEROS, 0x0024) }, /* PCI-E */
-- 
1.5.6.5
