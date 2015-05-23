From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for May 22 (build failure in i915_gem_gtt.c)
Date: Fri, 22 May 2015 21:36:41 -0700
Message-ID: <20150523043641.GA10715@roeck-us.net>
References: <20150522180940.1cbeec74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51022 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757196AbbEWEgp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 May 2015 00:36:45 -0400
Content-Disposition: inline
In-Reply-To: <20150522180940.1cbeec74@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>

On Fri, May 22, 2015 at 06:09:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150521:
> 
> The device-mapper tree gained a build failure so I used the version
> from next-20150521.
> 
> The driver-core tree still had its build failure for which I applied a fix
> patch.
> 
> Non-merge commits (relative to Linus' tree): 5332
>  4735 files changed, 245341 insertions(+), 114211 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
i386 builds:

drivers/gpu/drm/i915/i915_gem_gtt.c: In function 'gen8_ppgtt_init':
drivers/gpu/drm/i915/i915_gem_gtt.c:954:2: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
cc1: all warnings being treated as errors
make[4]: *** [drivers/gpu/drm/i915/i915_gem_gtt.o] Error 1

Caused by commit 5c5f645773b6d ("drm/i915: Unify aliasing ppgtt handling").

Guenter
