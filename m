From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Fri, 16 Sep 2016 13:18:34 +1000
Message-ID: <20160916131834.1ecb0eeb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753170AbcIPDSg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Sep 2016 23:18:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig build) failed like this:

drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:5:  symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:42:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:36:     symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
drivers/gpu/drm/virtio/Kconfig:1:       symbol DRM_VIRTIO_GPU depends on VIRTIO
drivers/virtio/Kconfig:1:       symbol VIRTIO is selected by REMOTEPROC
drivers/remoteproc/Kconfig:4:   symbol REMOTEPROC is selected by ST_SLIM_REMOTEPROC
drivers/remoteproc/Kconfig:103: symbol ST_SLIM_REMOTEPROC is selected by ST_FDMA
drivers/dma/Kconfig:440:        symbol ST_FDMA depends on DMADEVICES
drivers/dma/Kconfig:5:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
sound/soc/sh/Kconfig:29:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
sound/soc/sh/Kconfig:58:        symbol SND_SIU_MIGOR depends on I2C
drivers/i2c/Kconfig:7:  symbol I2C is selected by FB_DDC
drivers/video/fbdev/Kconfig:63: symbol FB_DDC is selected by FB_CYBER2000_DDC
drivers/video/fbdev/Kconfig:382:        symbol FB_CYBER2000_DDC depends on FB_CYBER2000
drivers/video/fbdev/Kconfig:370:        symbol FB_CYBER2000 depends on FB
*
* Restart config...
*
*
* USB HID Boot Protocol drivers
*
USB HIDBP Keyboard (simple Boot) support (USB_KBD) [N/m/y/?] (NEW) aborted!

Console input/output is redirected. Run 'make oldconfig' to update configuration.

/home/sfr/next/next/scripts/kconfig/Makefile:37: recipe for target 'silentoldconfig' failed

Probably caused by commits

  73f19dcade3d ("remoteproc: st_slim_rproc: add a slimcore rproc driver")
  e0cbdfc766bf ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
  a490790f8df3 ("ARM: multi_v7_defconfig: Enable STi and simple-card drivers.")

I have used the slave-dma tree from next-20160915 for today.

-- 
Cheers,
Stephen Rothwell
