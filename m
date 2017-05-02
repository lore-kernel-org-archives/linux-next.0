From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 May 2017 10:55:10 +0200
Message-ID: <CAK8P3a0AqL1nZrmaBaHNJ0Nfji72Lm44DPPSoKzGFbd4FcQHFw@mail.gmail.com>
References: <20170421121014.3ee14a83@canb.auug.org.au> <20170424112512.582d04da@canb.auug.org.au>
 <20170502082518.jdk5tqjhvlsqntny@phenom.ffwll.local> <20170502184132.2c1b0299@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36479 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbdEBIzL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 04:55:11 -0400
In-Reply-To: <20170502184132.2c1b0299@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel@ffwll.ch>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>

On Tue, May 2, 2017 at 10:41 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Daniel,
>
> On Tue, 2 May 2017 10:25:18 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> Since this is an all-new driver it might be best to stagger the pull
>> requests and merge the new tee subsystem (or whatever it is) after drm?
>>
>> Not sure what to best do here ...
>
> This will merge via Dave, so Dave just needs to let Linus know that a
> fix up is needed when this merges with the arm-soc stuff in Linus' tree.

The TEE subsystem is currently on a separate branch by itself in arm-soc,
so we could easily delay that until DRM is in, and point out the resolution
here.

       Arnd
