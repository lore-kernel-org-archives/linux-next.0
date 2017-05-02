From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Large new drm driver
Date: Tue, 2 May 2017 12:57:43 +1000
Message-ID: <20170502125743.1d79c007@canb.auug.org.au>
References: <20170502113119.106bd9db@canb.auug.org.au>
        <CAPM=9tw+v7+Ps_siHEdg9QHLEYLR81VGRMPL+7+p1ntFCnCOLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57427 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750902AbdEBC5q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 22:57:46 -0400
In-Reply-To: <CAPM=9tw+v7+Ps_siHEdg9QHLEYLR81VGRMPL+7+p1ntFCnCOLQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus <torvalds@linux-foundation.org>, Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>

Hi Dave,

On Tue, 2 May 2017 12:36:35 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> We've had register header files like this on a number of occasions
> before, not sure why it warrants a mention now.

Linus expressed suprise once before when we had a large number of new
lines appear in another subsystem ...

> It's just the public header files for the new Vega AMD GPUs,
> as opposed to a whole new driver.
> 
> AMD release the validated headers so open source developers
> don't have to go hunting for registers.

It's all fine, just noting.
-- 
Cheers,
Stephen Rothwell
