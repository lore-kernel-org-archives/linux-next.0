From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Tue, 20 Sep 2016 14:25:52 +0200
Message-ID: <1474374352.4030.49.camel@pengutronix.de>
References: <20160920124206.67755097@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:42728 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752560AbcITMZ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 08:25:56 -0400
In-Reply-To: <20160920124206.67755097@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Liu Ying <gnuiyl@gmail.com>

Hi Stephen,

Am Dienstag, den 20.09.2016, 12:42 +1000 schrieb Stephen Rothwell:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/drm/imx/ipuv3-crtc.c
> 
> between commit:
> 
>   a474478642d5 ("drm/imx: fix crtc vblank state regression")
> 
> from Linus' tree and commit:
> 
>   5f4df0c769a9 ("drm/imx: Use DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET flag")
> 
> from the drm tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thank you for the fix. It shouldn't be critical, but I'd put the
drm_crtc_vblank_off last, for symmetry reasons.

regards
Philipp
