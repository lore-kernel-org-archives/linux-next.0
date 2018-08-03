From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: [PATCH] mt76x0: build driver only as module
Date: Fri, 3 Aug 2018 11:14:01 +0200
Message-ID: <20180803091401.GB10284@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

There are various symbols that conflicts with mt7601u.
Due to that kernel will not build with allyesconfig.
For now limit the driver to be build only as module.

Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
---
 drivers/net/wireless/mediatek/mt76/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 850611ad347a..2f25af9a08df 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -11,7 +11,7 @@ config MT76x2_COMMON
 
 config MT76x0U
 	tristate "MediaTek MT76x0U (USB) support"
-	depends on MAC80211
+	depends on MAC80211 && m
 	depends on USB
 	help
 	  This adds support for MT7610U-based wireless USB dongles.
-- 
2.7.5
