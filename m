From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the i.MX tree
Date: Wed, 10 Feb 2010 13:03:51 +1100
Message-ID: <20100210130351.4b56f192.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
arch/arm/plat-mxc/Makefile between commit
aae7019382896cf1075a93acc564e42601bc44a2 ("imx: only define deprecated
symbols conditionally") from the i.MX tree and commit
8380222ec9458d38a4e0cc3cb688ad7fff311df4 ("ASoC: Add a new imx-ssi sound
driver") from the sound tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/plat-mxc/Makefile
index 7322bca,6cee38d..0000000
--- a/arch/arm/plat-mxc/Makefile
+++ b/arch/arm/plat-mxc/Makefile
@@@ -14,6 -12,8 +14,10 @@@ obj-$(CONFIG_MXC_PWM)  += pwm.
  obj-$(CONFIG_USB_EHCI_MXC) += ehci.o
  obj-$(CONFIG_MXC_ULPI) += ulpi.o
  obj-$(CONFIG_ARCH_MXC_AUDMUX_V1) += audmux-v1.o
 +CFLAGS_audmux-v1.o = -DIMX_NEEDS_DEPRECATED_SYMBOLS
  obj-$(CONFIG_ARCH_MXC_AUDMUX_V2) += audmux-v2.o
 +CFLAGS_audmux-v2.o = -DIMX_NEEDS_DEPRECATED_SYMBOLS
+ ifdef CONFIG_SND_IMX_SOC
+ obj-y += ssi-fiq.o
+ obj-y += ssi-fiq-ksym.o
+ endif
