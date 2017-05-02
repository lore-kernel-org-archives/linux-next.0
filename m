From: Dave Airlie <airlied@gmail.com>
Subject: Re: Large new drm driver
Date: Tue, 2 May 2017 12:36:35 +1000
Message-ID: <CAPM=9tw+v7+Ps_siHEdg9QHLEYLR81VGRMPL+7+p1ntFCnCOLQ@mail.gmail.com>
References: <20170502113119.106bd9db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:33525 "EHLO
        mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdEBCgg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 May 2017 22:36:36 -0400
In-Reply-To: <20170502113119.106bd9db@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>

On 2 May 2017 at 11:31, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> Just so you don't get a large suprise:
>
> $ git diff --dirstat v4.11..next-20170501
>    3.9% arch/
>   13.5% drivers/gpu/drm/amd/include/asic_reg/vega10/DC/
>    6.0% drivers/gpu/drm/amd/include/asic_reg/vega10/GC/
>   23.5% drivers/gpu/drm/amd/include/asic_reg/vega10/NBIO/
>    7.5% drivers/gpu/drm/amd/include/asic_reg/vega10/
>    4.9% drivers/gpu/drm/
>    4.6% drivers/net/
>    5.8% drivers/staging/media/atomisp/pci/atomisp2/css2400/
>    3.0% drivers/staging/media/
>    4.5% drivers/staging/rtl8723bs/
>   12.6% drivers/
>
> There are some very large include files in the new drm driver.
>
> wc -l over all the files in
> drivers/gpu/drm/amd/include/asic_reg/vega10/:

We've had register header files like this on a number of occasions
before, not sure why it warrants a mention now.

It's just the public header files for the new Vega AMD GPUs,
as opposed to a whole new driver.

AMD release the validated headers so open source developers
don't have to go hunting for registers.

Dave.
