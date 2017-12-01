From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the etnaviv tree
Date: Fri, 01 Dec 2017 15:33:53 +0100
Message-ID: <1512138833.5918.19.camel@pengutronix.de>
References: <20171128114446.005eff98@canb.auug.org.au>
         <20171130105329.6af10e07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:37081 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751677AbdLAOdz (ORCPT
        <rfc822;linux-next@vger.kernel.ORG>); Fri, 1 Dec 2017 09:33:55 -0500
In-Reply-To: <20171130105329.6af10e07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>

Hi Stephen, Lucas,

On Thu, 2017-11-30 at 10:53 +1100, Stephen Rothwell wrote:
> Hi Lucas,
> 
> On Tue, 28 Nov 2017 11:44:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the etnaviv tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/gpu/drm/tve200/Kconfig:1:error: recursive dependency detected!
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/gpu/drm/tve200/Kconfig:1:       symbol DRM_TVE200 depends on CMA
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > mm/Kconfig:489: symbol CMA is selected by DRM_ETNAVIV
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/gpu/drm/etnaviv/Kconfig:2:      symbol DRM_ETNAVIV depends on THERMAL
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/thermal/Kconfig:5:      symbol THERMAL is selected by ACPI_VIDEO
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/acpi/Kconfig:189:       symbol ACPI_VIDEO is selected by BACKLIGHT_CLASS_DEVICE
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/video/backlight/Kconfig:158:    symbol BACKLIGHT_CLASS_DEVICE is selected by DRM_PARADE_PS8622
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/gpu/drm/bridge/Kconfig:62:      symbol DRM_PARADE_PS8622 depends on DRM_BRIDGE
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > drivers/gpu/drm/bridge/Kconfig:1:       symbol DRM_BRIDGE is selected by DRM_TVE200
> > warning: (PMAC_BACKLIGHT && DRM_NOUVEAU && HT16K33 && FB_TFT) selects FB_BACKLIGHT which has unmet direct dependencies (HAS_IOMEM && FB)

I have reproduced this and first tried to break the loop at the top by
selecting CMA from DRM_TVE200 instead of depending on it:

drivers/dma/Kconfig:5:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:5:	symbol DMADEVICES is selected by CRYPTO_DEV_SP_CCP
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/crypto/ccp/Kconfig:8:	symbol CRYPTO_DEV_SP_CCP depends on CRYPTO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
crypto/Kconfig:16:	symbol CRYPTO is selected by BIG_KEYS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
security/keys/Kconfig:44:	symbol BIG_KEYS depends on TMPFS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
fs/Kconfig:139:	symbol TMPFS is selected by DRM_ETNAVIV
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/etnaviv/Kconfig:2:	symbol DRM_ETNAVIV depends on THERMAL
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/thermal/Kconfig:5:	symbol THERMAL is selected by ACPI_VIDEO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/acpi/Kconfig:189:	symbol ACPI_VIDEO is selected by BACKLIGHT_CLASS_DEVICE
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/backlight/Kconfig:158:	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_MX3
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:2327:	symbol FB_MX3 depends on MX3_IPU
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:387:	symbol MX3_IPU depends on DMADEVICES

I've sent a patch [1] instead to make THERMAL selectable via a Kconfig
option.

[1] https://patchwork.kernel.org/patch/10087265/

regards
Philipp
