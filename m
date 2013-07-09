From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] edma: select arch common code to fix link
Date: Tue, 9 Jul 2013 18:49:20 +0200
Message-ID: <1373388560-5129-1-git-send-email-vincent.stehle@freescale.com>
Reply-To: <vstehle@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2outboundsmtppool2.messaging.microsoft.com ([65.55.83.132]:40464
	"EHLO TX2EHSNDR002.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751650Ab3GIR0r convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jul 2013 13:26:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Matt Porter <mporter@ti.com>, Sekhar Nori <nsekhar@ti.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>

EDMA code has been moved to a common folder with a new CONFIG_TI_PRIV_E=
DMA
switch. Select it when the edma driver is enabled.

This fixes the following link error:

  drivers/built-in.o: In function `edma_remove':
  of_iommu.c:(.text+0x4ef20): undefined reference to `edma_free_slot'
  drivers/built-in.o: In function `edma_control':
  of_iommu.c:(.text+0x4ef70): undefined reference to `edma_stop'
  drivers/built-in.o: In function `edma_execute':
  of_iommu.c:(.text+0x4f11c): undefined reference to `edma_write_slot'
  of_iommu.c:(.text+0x4f150): undefined reference to `edma_link'
  of_iommu.c:(.text+0x4f168): undefined reference to `edma_start'
  drivers/built-in.o: In function `edma_free_chan_resources':
  of_iommu.c:(.text+0x4f220): undefined reference to `edma_stop'
  of_iommu.c:(.text+0x4f304): undefined reference to `edma_free_slot'
  of_iommu.c:(.text+0x4f328): undefined reference to `edma_free_channel=
'
  drivers/built-in.o: In function `edma_alloc_chan_resources':
  of_iommu.c:(.text+0x4f37c): undefined reference to `edma_alloc_channe=
l'
  of_iommu.c:(.text+0x4f3d8): undefined reference to `edma_free_channel=
'
  drivers/built-in.o: In function `edma_prep_slave_sg':
  of_iommu.c:(.text+0x4f67c): undefined reference to `edma_alloc_slot'
  drivers/built-in.o: In function `edma_probe':
  of_iommu.c:(.text+0x4f794): undefined reference to `edma_alloc_slot'
  of_iommu.c:(.text+0x4f8b8): undefined reference to `edma_free_slot'
  drivers/built-in.o: In function `edma_callback':
  of_iommu.c:(.text+0x4fae4): undefined reference to `edma_stop'
  make: *** [vmlinux] Error 1

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Matt Porter <mporter@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <djbw@fb.com>
Cc: Russell King <linux@arm.linux.org.uk>
---


Hi,

Build of linux next-20130709 is broken for ARM multi_v7_defconfig. This=
 patch
fixes it.

(Note: the error messages mentioning of_iommu.c are misleading.)

Best regards,

V.


 drivers/dma/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 6825957..8b3fca9 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -198,6 +198,7 @@ config TI_EDMA
 	depends on ARCH_DAVINCI || ARCH_OMAP
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
+	select TI_PRIV_EDMA
 	default n
 	help
 	  Enable support for the TI EDMA controller. This DMA
--=20
1.7.10.4
