From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 16 Nov 2011 10:16:23 +0000
Message-ID: <20111116101623.7a59b686@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:44144 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755736Ab1KPKPd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Nov 2011 05:15:33 -0500
In-Reply-To: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Rob Clark <rob.clark@linaro.org>

> drivers/staging/gma500/framebuffer.c: In function 'psb_framebuffer_init':
> drivers/staging/gma500/framebuffer.c:297:2: warning: passing argument 2 of 'drm_helper_mode_fill_fb_struct' from incompatible pointer type [enabled by default]
> include/drm/drm_crtc_helper.h:121:12: note: expected 'struct drm_mode_fb_cmd2 *' but argument is of type 'struct drm_mode_fb_cmd *'
> drivers/staging/gma500/framebuffer.c:564:2: warning: passing argument 2 of 'psb_framebuffer_create' from incompatible pointer type [enabled by default]
> drivers/staging/gma500/framebuffer.c:314:32: note: expected 'struct drm_mode_fb_cmd *' but argument is of type 'struct drm_mode_fb_cmd2 *'

gma500 is frozen pending Dave Airlie's applying the patches moving it out
of staging.

<Prod, prod>

Alan
