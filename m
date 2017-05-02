From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 May 2017 11:34:54 +0200
Message-ID: <CAKMK7uF8LYhxqsEGR1WT3e6VYeTiXMTa3jCvmFKc0gNtm-ojhw@mail.gmail.com>
References: <20170421121014.3ee14a83@canb.auug.org.au> <20170424112512.582d04da@canb.auug.org.au>
 <20170502082518.jdk5tqjhvlsqntny@phenom.ffwll.local> <20170502184132.2c1b0299@canb.auug.org.au>
 <CAK8P3a0AqL1nZrmaBaHNJ0Nfji72Lm44DPPSoKzGFbd4FcQHFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35520 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbdEBJe4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 05:34:56 -0400
Received: by mail-it0-f46.google.com with SMTP id c15so32393691ith.0
        for <linux-next@vger.kernel.org>; Tue, 02 May 2017 02:34:55 -0700 (PDT)
In-Reply-To: <CAK8P3a0AqL1nZrmaBaHNJ0Nfji72Lm44DPPSoKzGFbd4FcQHFw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Dave Airlie <airlied@linux.ie>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>

On Tue, May 2, 2017 at 10:55 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, May 2, 2017 at 10:41 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Daniel,
>>
>> On Tue, 2 May 2017 10:25:18 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>> Since this is an all-new driver it might be best to stagger the pull
>>> requests and merge the new tee subsystem (or whatever it is) after drm?
>>>
>>> Not sure what to best do here ...
>>
>> This will merge via Dave, so Dave just needs to let Linus know that a
>> fix up is needed when this merges with the arm-soc stuff in Linus' tree.
>
> The TEE subsystem is currently on a separate branch by itself in arm-soc,
> so we could easily delay that until DRM is in, and point out the resolution
> here.

Dave is somewhere without mail, but I chatted with him quickly and he
agrees this seems simplest. drm-next main pull should go out somewhere
tomorrow he said.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
