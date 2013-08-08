From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: Build break due to 28ec711 "drm/agp: move AGP cleanup paths to drm_agpsupport.c"
Date: Thu, 8 Aug 2013 22:00:27 +0200
Message-ID: <CANq1E4ThEZJUNkweJa9h+Kz+ACj3NJ19EEWvBJS0O1G+WNO_cA@mail.gmail.com>
References: <5203DCB0.9060409@wwwdotorg.org>
	<CANq1E4SZ+pz3V1UspUYC4sWJKBZim_4Eyp4OTU04cfVozTrfXg@mail.gmail.com>
	<5203EF9C.8080000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:58066 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966063Ab3HHUA2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 16:00:28 -0400
Received: by mail-ie0-f180.google.com with SMTP id aq17so2550927iec.25
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2013 13:00:27 -0700 (PDT)
In-Reply-To: <5203EF9C.8080000@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>

Hi

On Thu, Aug 8, 2013 at 9:21 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/08/2013 12:13 PM, David Herrmann wrote:
>> Hi
>>
>> On Thu, Aug 8, 2013 at 8:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>> In next-20130808, building tegra_defconfig for ARM yields:
>>>
>>>> drivers/built-in.o: In function `drm_lastclose':
>>>> /home/swarren/shared/git_wa/kernel/kernel.git/drivers/gpu/drm/drm_drv.c:198: undefined reference to `drm_agp_clear'
>>>
>>> That's because drm_agp_clear() is called unconditionally, yet is only
>>> conditionally built into drm_agpsupport.c (#if __OS_HAS_AGP).
>>>
>>> Should the call from drm_drv.c be conditional, or should there be a
>>> dummy static inline replacement in include/drm/drmP.h for when AGP
>>> support isn't available?
>>
>> Sorry, I missed testing with AGP=n and the code I fixed depended on
>> dead-code-elimination to link correctly. I overlooked that. There is a
>> patch pending on dri-devel:
>> http://lists.freedesktop.org/archives/dri-devel/2013-August/043077.html
>
> That makes it worse! To solve it, you need:

Argh! I need some proper build environments to test all the non-x86
stuff. Thanks for the hint, I will resend the patch. Hopefully it'll
work this time. Sorry for that..

Thanks
David

> diff --git a/include/drm/drm_agpsupport.h b/include/drm/drm_agpsupport.h
> index f926542..a184eee 100644
> --- a/include/drm/drm_agpsupport.h
> +++ b/include/drm/drm_agpsupport.h
> @@ -8,7 +8,7 @@
>  #include <linux/agp_backend.h>
>  #include <drm/drmP.h>
>
> -#ifdef __OS_HAS_AGP
> +#if __OS_HAS_AGP
>
>  void drm_free_agp(DRM_AGP_MEM * handle, int pages);
>  int drm_bind_agp(DRM_AGP_MEM * handle, unsigned int start);
>
