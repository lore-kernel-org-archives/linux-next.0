From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the drm-misc  tree
Date: Thu, 05 Jan 2017 12:24:13 +0200
Message-ID: <874m1dhkj6.fsf@intel.com>
References: <20170105115329.117649e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:19385 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1161282AbdAEKYR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Jan 2017 05:24:17 -0500
In-Reply-To: <20170105115329.117649e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

On Thu, 05 Jan 2017, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/usb/Kconfig:39:error: recursive dependency detected!
> drivers/usb/Kconfig:39: symbol USB is selected by MOUSE_APPLETOUCH
> drivers/input/mouse/Kconfig:187:        symbol MOUSE_APPLETOUCH depends on INPUT
> drivers/input/Kconfig:8:        symbol INPUT is selected by VT
> drivers/tty/Kconfig:12: symbol VT is selected by FB_STI
> drivers/video/fbdev/Kconfig:678:        symbol FB_STI depends on FB
> drivers/video/fbdev/Kconfig:5:  symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:72:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> drivers/gpu/drm/Kconfig:66:     symbol DRM_KMS_HELPER is selected by DRM_NOUVEAU
> drivers/gpu/drm/nouveau/Kconfig:1:      symbol DRM_NOUVEAU depends on LEDS_CLASS
> drivers/leds/Kconfig:16:        symbol LEDS_CLASS is selected by OMAP_DEBUG_LEDS
> arch/arm/plat-omap/Kconfig:19:  symbol OMAP_DEBUG_LEDS depends on NEW_LEDS
> drivers/leds/Kconfig:8: symbol NEW_LEDS is selected by ATH9K_HTC
> drivers/net/wireless/ath/ath9k/Kconfig:158:     symbol ATH9K_HTC depends on USB
>
> Caused by commit
>
>   a5ad0fd8524e ("drm: nouveau: fix build when LEDS_CLASS=m")
>
> I have reverted that commit for today (just because I had to to make
> sure that was the problem).

Daniel reverted it in drm-misc.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
