From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: Build break due to 28ec711 "drm/agp: move AGP cleanup paths to drm_agpsupport.c"
Date: Thu, 8 Aug 2013 20:13:05 +0200
Message-ID: <CANq1E4SZ+pz3V1UspUYC4sWJKBZim_4Eyp4OTU04cfVozTrfXg@mail.gmail.com>
References: <5203DCB0.9060409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:56679 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758081Ab3HHSNG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 14:13:06 -0400
Received: by mail-ie0-f176.google.com with SMTP id 9so2419084iec.21
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2013 11:13:05 -0700 (PDT)
In-Reply-To: <5203DCB0.9060409@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>

Hi

On Thu, Aug 8, 2013 at 8:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> In next-20130808, building tegra_defconfig for ARM yields:
>
>> drivers/built-in.o: In function `drm_lastclose':
>> /home/swarren/shared/git_wa/kernel/kernel.git/drivers/gpu/drm/drm_drv.c:198: undefined reference to `drm_agp_clear'
>
> That's because drm_agp_clear() is called unconditionally, yet is only
> conditionally built into drm_agpsupport.c (#if __OS_HAS_AGP).
>
> Should the call from drm_drv.c be conditional, or should there be a
> dummy static inline replacement in include/drm/drmP.h for when AGP
> support isn't available?

Sorry, I missed testing with AGP=n and the code I fixed depended on
dead-code-elimination to link correctly. I overlooked that. There is a
patch pending on dri-devel:
http://lists.freedesktop.org/archives/dri-devel/2013-August/043077.html

Regards
David
