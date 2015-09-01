From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the slave-dma tree with the pm, mfd
 and rtc trees
Date: Tue, 1 Sep 2015 09:17:25 +0200
Message-ID: <CAMuHMdWoJFrG+bKJrY+Hm5+5fS9aiRiAdEegoT0wYvk2m4fjHg@mail.gmail.com>
References: <20150827112645.6c30e106@canb.auug.org.au>
	<20150827032405.GS13546@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35388 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866AbbIAHR0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2015 03:17:26 -0400
In-Reply-To: <20150827032405.GS13546@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Thu, Aug 27, 2015 at 5:24 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Thu, Aug 27, 2015 at 11:26:45AM +1000, Stephen Rothwell wrote:
>> Hi Vinod,
>>
>> Today's linux-next merge of the slave-dma tree got conflicts in:
>>
>>   drivers/dma/Kconfig
>>   drivers/dma/Makefile
>>
>> between commit:
>>
>>   667dfed98615 ("dmaengine: add a driver for Intel integrated DMA 64-bit")
>>
>> from the pm, mfd and rtc trees and commits:
>>
>>   3c21619077be ("dmaengine: sort the Kconfig")
>>   7e97229b3920 ("dmaengine: sort the makefile")
>>
>> from the slave-dma tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>
> Thanks Stephen,
>
> I looked at this and merge is sorted, so looks good to me

Sorted by Kconfig symbol or by name?

IDMA64 sorts before IMG_MDC_DMA,
but "Intel integrated DMA 64-bit support" doesn't.

Most other Intel DMA drivers have an INTEL_ prefix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
