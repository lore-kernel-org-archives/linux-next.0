From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH 1/2 RESEND] staging: usb: gadget: Configurable Composite Gadget
 depends on BLOCK
Date: Mon, 11 Jun 2012 11:11:59 +0200
Message-ID: <1339405919-5845-1-git-send-email-andrzej.p@samsung.com>
References: <Pine.LNX.4.44L0.1206071646360.1185-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-reply-to: <Pine.LNX.4.44L0.1206071646360.1185-100000@iolanthe.rowland.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-usb@vger.kernel.org, Michal Nazarewicz <mnazarewicz@gmail.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Benoit Goby <benoit@android.com>, Mike Lockwood <lockwood@android.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-next.vger.kernel.org

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/staging/ccg/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/ccg/Kconfig b/drivers/staging/ccg/Kconfig
index ff05e52..1f00d70 100644
--- a/drivers/staging/ccg/Kconfig
+++ b/drivers/staging/ccg/Kconfig
@@ -2,7 +2,7 @@ if USB_GADGET
 
 config USB_G_CCG
 	tristate "Configurable Composite Gadget (STAGING)"
-	depends on STAGING && !USB_ZERO && !USB_ZERO_HNPTEST && !USB_AUDIO && !GADGET_UAC1 && !USB_ETH && !USB_ETH_RNDIS && !USB_ETH_EEM && !USB_G_NCM && !USB_GADGETFS && !USB_FUNCTIONFS && !USB_FUNCTIONFS_ETH && !USB_FUNCTIONFS_RNDIS && !USB_FUNCTIONFS_GENERIC && !USB_FILE_STORAGE && !USB_FILE_STORAGE_TEST && !USB_MASS_STORAGE && !USB_G_SERIAL && !USB_MIDI_GADGET && !USB_G_PRINTER && !USB_CDC_COMPOSITE && !USB_G_NOKIA && !USB_G_ACM_MS && !USB_G_MULTI && !USB_G_MULTI_RNDIS && !USB_G_MULTI_CDC && !USB_G_HID && !USB_G_DBGP && !USB_G_WEBCAM
+	depends on STAGING && BLOCK && !USB_ZERO && !USB_ZERO_HNPTEST && !USB_AUDIO && !GADGET_UAC1 && !USB_ETH && !USB_ETH_RNDIS && !USB_ETH_EEM && !USB_G_NCM && !USB_GADGETFS && !USB_FUNCTIONFS && !USB_FUNCTIONFS_ETH && !USB_FUNCTIONFS_RNDIS && !USB_FUNCTIONFS_GENERIC && !USB_FILE_STORAGE && !USB_FILE_STORAGE_TEST && !USB_MASS_STORAGE && !USB_G_SERIAL && !USB_MIDI_GADGET && !USB_G_PRINTER && !USB_CDC_COMPOSITE && !USB_G_NOKIA && !USB_G_ACM_MS && !USB_G_MULTI && !USB_G_MULTI_RNDIS && !USB_G_MULTI_CDC && !USB_G_HID && !USB_G_DBGP && !USB_G_WEBCAM
 	help
 	  The Configurable Composite Gadget supports multiple USB
 	  functions: acm, mass storage, rndis and FunctionFS.
-- 
1.7.0.4
