From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Wed, 10 Feb 2016 07:31:19 +0100
Message-ID: <20160210063119.GC11240@phenom.ffwll.local>
References: <20160210122451.55391e43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37950 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058AbcBJGa5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2016 01:30:57 -0500
Received: by mail-wm0-f48.google.com with SMTP id p63so12606189wmp.1
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2016 22:30:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160210122451.55391e43@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Darren Hart <dvhart@linux.intel.com>

On Wed, Feb 10, 2016 at 12:24:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:25:0:
> include/linux/apple-gmux.h: In function 'apple_gmux_present':
> include/linux/apple-gmux.h:36:42: error: implicit declaration of function 'acpi_dev_present' [-Werror=implicit-function-declaration]
>   return IS_ENABLED(CONFIG_APPLE_GMUX) && acpi_dev_present(GMUX_ACPI_HID);
>                                           ^
> 
> Caused by commit
> 
>   2413306c2566 ("apple-gmux: Add helper for presence detect")
> 
> I have used the drm-misc tree from next-20160209 for today.

Can you pls attach your .config? The function is there, I suspect we're
just missing some depends in Kconfig.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
