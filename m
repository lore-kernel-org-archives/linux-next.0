From: Arend van Spriel <arend@broadcom.com>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next
 tree
Date: Wed, 27 May 2015 11:08:35 +0200
Message-ID: <55658993.8060709@broadcom.com>
References: <20150527120358.47b88a4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------020103000506020500040006"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:22364 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbbE0JIi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2015 05:08:38 -0400
In-Reply-To: <20150527120358.47b88a4b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Fu, Zhonghui" <zhonghui.fu@linux.intel.com>

--------------020103000506020500040006
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/15 04:03, Stephen Rothwell wrote:
> Hi Kalle,
>
> After merging the wireless-drivers-next tree, today's linux-next build
> (arm multi_v7_defconfig) failed like this:
>
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c: In function 'brcmf_ops_sdio_probe':
> drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:1139:7: error: dereferencing pointer to incomplete type
>     adev->flags.power_manageable = 0;
>         ^
>
> Caused by commit f0992ace680c ("brcmfmac: prohibit ACPI power
> management for brcmfmac driver").
>
> I have used the wireless-drivers-next from next-20150526 for today.

Crap. struct acpi_device details are only known when CONFIG_ACPI is set. 
The attached patch should fix the issue.

Regards,
Arend

--------------020103000506020500040006
Content-Type: text/plain;
	name="0001-brcmfmac-fix-invalid-access-to-struct-acpi_device-fi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-brcmfmac-fix-invalid-access-to-struct-acpi_device-fi.pa";
	filename*1="tch"

>From fd56b4446c613ceec15c11758ed817d13efb9bba Mon Sep 17 00:00:00 2001
From: Arend van Spriel <arend@broadcom.com>
Date: Wed, 27 May 2015 10:48:46 +0200
Subject: [PATCH] brcmfmac: fix invalid access to struct acpi_device fields

The fields of struct acpi_device are only known when CONFIG_ACPI is
defined. Fix this by using a helper function. This will resolve the
issue found in linux-next:

 ../brcmfmac/bcmsdh.c: In function 'brcmf_ops_sdio_probe':
 ../brcmfmac/bcmsdh.c:1139:7: error: dereferencing pointer to incomplete type
   adev->flags.power_manageable = 0;
       ^

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Arend van Spriel <arend@broadcom.com>
---
 drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
index b0d0ff5..71779b9 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
@@ -1117,6 +1117,18 @@ MODULE_DEVICE_TABLE(sdio, brcmf_sdmmc_ids);
 static struct brcmfmac_sdio_platform_data *brcmfmac_sdio_pdata;
 
 
+static void brcmf_sdiod_acpi_set_power_manageable(struct device *dev,
+						  int val)
+{
+#if IS_ENABLED(CONFIG_ACPI)
+	struct acpi_device *adev;
+
+	adev = ACPI_COMPANION(dev);
+	if (adev)
+		adev->flags.power_manageable = 0;
+#endif
+}
+
 static int brcmf_ops_sdio_probe(struct sdio_func *func,
 				const struct sdio_device_id *id)
 {
@@ -1124,7 +1136,6 @@ static int brcmf_ops_sdio_probe(struct sdio_func *func,
 	struct brcmf_sdio_dev *sdiodev;
 	struct brcmf_bus *bus_if;
 	struct device *dev;
-	struct acpi_device *adev;
 
 	brcmf_dbg(SDIO, "Enter\n");
 	brcmf_dbg(SDIO, "Class=%x\n", func->class);
@@ -1132,11 +1143,9 @@ static int brcmf_ops_sdio_probe(struct sdio_func *func,
 	brcmf_dbg(SDIO, "sdio device ID: 0x%04x\n", func->device);
 	brcmf_dbg(SDIO, "Function#: %d\n", func->num);
 
-	/* prohibit ACPI power management for this device */
 	dev = &func->dev;
-	adev = ACPI_COMPANION(dev);
-	if (adev)
-		adev->flags.power_manageable = 0;
+	/* prohibit ACPI power management for this device */
+	brcmf_sdiod_acpi_set_power_manageable(dev, 0);
 
 	/* Consume func num 1 but dont do anything with it. */
 	if (func->num == 1)
-- 
1.9.1


--------------020103000506020500040006--
