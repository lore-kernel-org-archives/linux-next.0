From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings in Linus' tree
Date: Tue, 14 Nov 2017 08:52:35 +1100
Message-ID: <20171114085235.70e99fb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

WARNING: modpost: missing MODULE_LICENSE() in net/9p/9pnet_xen.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/media/platform/mtk-vcodec/mtk-vcodec-common.o
WARNING: modpost: missing MODULE_LICENSE() in sound/soc/codecs/snd-soc-pcm512x-spi.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/auxdisplay/img-ascii-lcd.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-iop.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/accel/kxsd9-i2c.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/iio/adc/qcom-vadc-common.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/media/platform/mtk-vcodec/mtk-vcodec-common.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/media/platform/soc_camera/soc_scale_crop.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/net/phy/cortina.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pxa/pinctrl-pxa2xx.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/power/reset/zx-reboot.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/rpmsg/qcom_glink_native.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/comedi/drivers/ni_atmio.o
WARNING: modpost: missing MODULE_LICENSE() in net/9p/9pnet_xen.o
WARNING: modpost: missing MODULE_LICENSE() in sound/soc/codecs/snd-soc-pcm512x-spi.o

Introduced by commit

  ba1029c9cbc5 ("modpost: detect modules without a MODULE_LICENSE")

-- 
Cheers,
Stephen Rothwell
