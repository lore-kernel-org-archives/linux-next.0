From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] instmem/gk20a: do not use non-portable dma_to_phys()
Date: Wed, 11 Nov 2015 16:18:42 +0900
Message-ID: <CAAVeFuJSSMexsJWnd_EGUF7ou5Kn5yKYy4TtpdH9oxMu2Jz0WA@mail.gmail.com>
References: <1447132247-9767-1-git-send-email-acourbot@nvidia.com>
 <20151110144144.39c2a4109c26e91f4f3fb47b@linux-foundation.org>
 <CAAVeFuK6MCQ7+6jUemQ83Jh4XbFmERe6uofmh_Y810wcSddbkQ@mail.gmail.com> <5642E593.1030102@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:34778 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbbKKHTD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2015 02:19:03 -0500
In-Reply-To: <5642E593.1030102@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 11, 2015 at 3:52 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 11/10/2015 10:27 PM, Alexandre Courbot wrote:
>>
>> On Wed, Nov 11, 2015 at 7:41 AM, Andrew Morton
>> <akpm@linux-foundation.org> wrote:
>>>
>>> On Tue, 10 Nov 2015 14:10:47 +0900 Alexandre Courbot
>>> <acourbot@nvidia.com> wrote:
>>>
>>>> dma_to_phys() is not guaranteed to be available on all platforms and
>>>> should not be used outside of arch/. Replace it with what it is expected
>>>> to do in our case: simply cast the DMA handle to a physical address.
>>>
>>>
>>> mainline i386 allmodconfig is now busted.
>>
>>
>> How? I just managed to build it both with and without this patch (note
>> that this is not to dispute the uglyness of this patch).
>>
>
> Good for you. For me, it is
>
> ERROR: "dma_to_phys" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
>
> as recorded in
>
> http://server.roeck-us.net:8010/builders/hwmon-i386-master/builds/338/steps/buildcommand/logs/stdio
> http://server.roeck-us.net:8010/builders/hwmon-i386-master/builds/339/steps/buildcommand/logs/stdio

Not sure what I did to avoid this - anyway, the call to this function
is going away.
