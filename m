From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH -next] drm/radeon/dpm: Add missing #include
 <linux/seq_file.h>
Date: Fri, 5 Jul 2013 13:01:45 +0000
Message-ID: <A3397C8B8B789E45844E7EC5DEAD89D02E500B6B@sausexdag04.amd.com>
References: <1373023528-3361-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]:43680
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757340Ab3GENBx convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jul 2013 09:01:53 -0400
In-Reply-To: <1373023528-3361-1-git-send-email-geert@linux-m68k.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, David Airlie <airlied@linux.ie>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

> -----Original Message-----
> From: Geert Uytterhoeven [mailto:geert@linux-m68k.org]
> Sent: Friday, July 05, 2013 7:25 AM
> To: Deucher, Alexander; David Airlie
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-
> next@vger.kernel.org; Geert Uytterhoeven
> Subject: [PATCH -next] drm/radeon/dpm: Add missing #include
> <linux/seq_file.h>
> 
> ia64_defconfig:
> 
> drivers/gpu/drm/radeon/rv6xx_dpm.c: In function
> 'rv6xx_dpm_debugfs_print_current_performance_level':
> drivers/gpu/drm/radeon/rv6xx_dpm.c:2041:3: error: implicit declaration of
> function 'seq_printf' [-Werror=implicit-function-declaration]
> 

Already fixed in:
http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=bf0936e196ec21b604106578043d4c14831f99e7

Alex

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> http://kisskb.ellerman.id.au/kisskb/buildresult/9068726/
> 
>  drivers/gpu/drm/radeon/rv6xx_dpm.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.c
> b/drivers/gpu/drm/radeon/rv6xx_dpm.c
> index 33705c5..0d09677 100644
> --- a/drivers/gpu/drm/radeon/rv6xx_dpm.c
> +++ b/drivers/gpu/drm/radeon/rv6xx_dpm.c
> @@ -22,6 +22,7 @@
>   * Authors: Alex Deucher
>   */
> 
> +#include <linux/seq_file.h>
>  #include "drmP.h"
>  #include "radeon.h"
>  #include "rv6xxd.h"
> --
> 1.7.9.5
> 
