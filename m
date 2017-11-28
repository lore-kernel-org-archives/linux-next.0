From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the etnaviv tree
Date: Tue, 28 Nov 2017 11:44:46 +1100
Message-ID: <20171128114446.005eff98@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752331AbdK1Aos (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Nov 2017 19:44:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Lucas,

After merging the etnaviv tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/tve200/Kconfig:1:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/tve200/Kconfig:1:       symbol DRM_TVE200 depends on CMA
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
mm/Kconfig:489: symbol CMA is selected by DRM_ETNAVIV
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/etnaviv/Kconfig:2:      symbol DRM_ETNAVIV depends on THERMAL
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/thermal/Kconfig:5:      symbol THERMAL is selected by ACPI_VIDEO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/acpi/Kconfig:189:       symbol ACPI_VIDEO is selected by BACKLIGHT_CLASS_DEVICE
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/backlight/Kconfig:158:    symbol BACKLIGHT_CLASS_DEVICE is selected by DRM_PARADE_PS8622
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/bridge/Kconfig:62:      symbol DRM_PARADE_PS8622 depends on DRM_BRIDGE
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/bridge/Kconfig:1:       symbol DRM_BRIDGE is selected by DRM_TVE200
warning: (PMAC_BACKLIGHT && DRM_NOUVEAU && HT16K33 && FB_TFT) selects FB_BACKLIGHT which has unmet direct dependencies (HAS_IOMEM && FB)
*
* Restart config...
*
*
* Multiplexer I2C Chip support
*
GPIO-based I2C arbitration (I2C_ARB_GPIO_CHALLENGE) [M/n/?] m
GPIO-based I2C multiplexer (I2C_MUX_GPIO) [M/n/?] m
General Purpose I2C multiplexer (I2C_MUX_GPMUX) [M/n/?] m
LTC LTC4306/5 I2C multiplexer (I2C_MUX_LTC4306) [N/m/?] (NEW) aborted!

Console input/output is redirected. Run 'make oldconfig' to update configuration.

scripts/kconfig/Makefile:38: recipe for target 'silentoldconfig' failed

Caused by commit

  dba536cd9538 ("drm/etnaviv: add THERMAL dependency")

I got the abobe warnings while doing "make allmodconfig" and then the
error when doing the actual build.

I have used the etnaviv tree from next-20171127 for today.

-- 
Cheers,
Stephen Rothwell
