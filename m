From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Tue, 10 Nov 2015 13:55:37 +0900
Message-ID: <CAAVeFuKGscJfX8jw9ERqgxZhzo0AkrW4WO+OTg64voEQiDrJKg@mail.gmail.com>
References: <20151104202226.28468a03@canb.auug.org.au> <20151109164510.GA26721@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38460 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbbKJEz5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2015 23:55:57 -0500
In-Reply-To: <20151109164510.GA26721@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>

On Tue, Nov 10, 2015 at 1:45 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Nov 04, 2015 at 08:22:26PM +1100, Stephen Rothwell wrote:
>> Hi Dave,
>>
>> After merging the drm tree, today's linux-next build (s390 allmodconfig)
>> failed like this:
>>
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:143:2: error: implicit declaration of function 'dma_to_phys' [-Werror=implicit-function-declaration]
>>
>> Caused by commit
>>
>>   69c4938249fb ("drm/nouveau/instmem/gk20a: use direct CPU access")
>>
>> Discovered after the release.
>>
> Still seen in next-20151109, affecting at least alpha, i386, parisc, s390,
> and xtensa, but probably other architectures as well.
>
> dma_to_phys() was until now not used from driver code, and is only declared
> for an architecture if it is used/needed there.

Mmm there doesn't seem to be a portable way of getting a physical
address from a DMA handle, which is what we are trying to do in this
code.

In that particular case a cast is enough though, so we should probably
just do that. I will send a patch for Ben/David to include in order to
fix this issue at least.
