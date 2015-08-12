From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bluetooth tree
Date: Wed, 12 Aug 2015 18:01:07 +1000
Message-ID: <20150812180107.312be11d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40224 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933457AbbHLIBJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2015 04:01:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Danis <frederic.danis@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>

Hi Gustavo,

After merging the bluetooth tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/bluetooth/hci_bcm.c: In function 'bcm_acpi_probe':
drivers/bluetooth/hci_bcm.c:458:2: error: implicit declaration of function 'acpi_dev_get_resources' [-Werror=implicit-function-declaration]
  acpi_dev_get_resources(adev, &resources, bcm_resource, dev);
  ^

Caused by commit

  ae056908862b ("Bluetooth: hci_bcm: Retrieve UART speed from ACPI")

This build does not have ACPI enabled.

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Aug 2015 17:58:00 +1000
Subject: [PATCH] Bluetooth: hci_bcm: need to depend on CONFIG_ACPI

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/bluetooth/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 0bd88c942a52..affaecab4fa6 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -147,6 +147,7 @@ config BT_HCIUART_INTEL
 config BT_HCIUART_BCM
 	bool "Broadcom protocol support"
 	depends on BT_HCIUART
+	depends on ACPI
 	select BT_HCIUART_H4
 	select BT_BCM
 	help
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
