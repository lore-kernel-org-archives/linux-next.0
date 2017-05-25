From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Thu, 25 May 2017 11:49:42 +1000
Message-ID: <20170525114933.1e1dea04@canb.auug.org.au>
References: <20170519120729.597f5a9e@canb.auug.org.au>
        <87y3tsg2jx.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51787 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752682AbdEYBto (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 May 2017 21:49:44 -0400
In-Reply-To: <87y3tsg2jx.fsf@eliezer.anholt.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: Dave Airlie <airlied@linux.ie>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>

Hi Eric,

On Fri, 19 May 2017 10:49:06 -0700 Eric Anholt <eric@anholt.net> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > produced these warnings:
> >
> > drivers/gpu/drm/pl111/pl111_drv.c:81:12: warning: 'pl111_modeset_init' defined but not used [-Wunused-function]
> >  static int pl111_modeset_init(struct drm_device *dev)
> >             ^
> > drivers/gpu/drm/pl111/pl111_drv.c:149:26: warning: 'pl111_drm_driver' defined but not used [-Wunused-variable]
> >  static struct drm_driver pl111_drm_driver = {
> >                           ^  
> 
> Sorry about that -- I thought that kbuild test robot would give me
> notification of new warnings.
> 
> Patch incoming.

I saw the patch, but it doesn't seem to have been applied anywhere yet.

-- 
Cheers,
Stephen Rothwell
