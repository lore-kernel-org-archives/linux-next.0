From: Jesse Barnes <jesse.barnes@intel.com>
Subject: Re: linux-next: Tree for December 12 (drm)
Date: Sun, 14 Dec 2008 11:21:13 -0800
Message-ID: <200812141121.14400.jesse.barnes@intel.com>
References: <20081212185654.0af8b4a1.sfr@canb.auug.org.au> <4943405A.4080009@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:23425 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750945AbYLNTVT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2008 14:21:19 -0500
In-Reply-To: <4943405A.4080009@xenotime.net>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>

On Friday, December 12, 2008 8:55 pm Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20081211:
> >
> > Undropped tree:
> > 	drm
>
> oops    ^^^
>
>
> When I2C=n, and drm is built-in or modular, this build error
> happens:
>
> (drm built-in:)
>
> build-r7079.out:(.text+0x47e5f): undefined reference to `i2c_transfer'
> 7080	same
> 7086	same
> 7089	same
> (from gpu/drm/drm_edid.c)
>
>
> (drm modular:)
>
> build-r7103.out:ERROR: "i2c_transfer" [drivers/gpu/drm/drm.ko] undefined!
> (from gpu/drm/drm_edid.c)

Looks like Dave pushed a fix for this by making DRM select the required I2C 
bits.  Dunno that or depends is preferred these days though...

-- 
Jesse Barnes, Intel Open Source Technology Center
