From: Sinclair Yeh <syeh@vmware.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the drm tree
Date: Mon, 28 Aug 2017 18:51:04 -0700
Message-ID: <20170829015104.GA8994@syeh-m02.local>
References: <20170829114413.43692976@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-co1nam03on0073.outbound.protection.outlook.com ([104.47.40.73]:21901
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751209AbdH2BvQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 21:51:16 -0400
Content-Disposition: inline
In-Reply-To: <20170829114413.43692976@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Thomas Hellstrom <thellstrom@vmware.com>

On Tue, Aug 29, 2017 at 11:44:13AM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Commits
> 
>   461e60ea1119 ("drm/exynos/decon5433: use mode info stored in CRTC to detect i80 mode")
>   ac60944ccf23 ("drm/exynos: consistent use of cpp")
>   e300173f0616 ("drm/vmwgfx: Don't use drm_irq_[un]install")

This one is Reviewed-by: Sinclair Yeh <syeh@vmware.com>

>   ef369904aaf7 ("drm/vmwgfx: Move irq bottom half processing to threads")
>   65b97a2bec2f ("drm/vmwgfx: Restart command buffers after errors")
>   5f55be5f306a ("drm/vmwgfx: Support the NOP_ERROR command")
>   1f1a36cc4d49 ("drm/vmwgfx: Fix incorrect command header offset at restart")a

For these 4, I thought SOB the author is enough, but if not, I can add SOB.

Is it easier for you to add those, or would you like me to rebase and send out another
pull request?

thanks,

Sinclair
