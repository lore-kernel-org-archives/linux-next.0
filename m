From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: next-20160707 build: 1 failures 6 warnings (next-20160707)
Date: Tue, 12 Jul 2016 15:59:04 +0200
Message-ID: <20160712135904.GJ23520@phenom.ffwll.local>
References: <E1bL5XI-0004Z9-EP@optimist>
 <20160707122219.GO6247@sirena.org.uk>
 <CAAFQd5DacKar+T1Fj62NvAZOT_QWBhahftZJXGq40Z19n-Z4Hg@mail.gmail.com>
 <20160707153237.GF11467@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38644 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751366AbcGLN7I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jul 2016 09:59:08 -0400
Received: by mail-wm0-f51.google.com with SMTP id o80so26575351wme.1
        for <linux-next@vger.kernel.org>; Tue, 12 Jul 2016 06:59:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160707153237.GF11467@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <jroedel@suse.de>
Cc: Tomasz Figa <tfiga@chromium.org>, linaro-kernel@lists.linaro.org, Simon Xue <xxm@rock-chips.com>, kernel-build-reports@lists.linaro.org, dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, Shunqian Zheng <zhengsq@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Jul 07, 2016 at 05:32:37PM +0200, Joerg Roedel wrote:
> On Thu, Jul 07, 2016 at 10:18:02PM +0900, Tomasz Figa wrote:
> > This is probably because we missed this hidden dependency and decided
> > to push the IOMMU part separately through the IOMMU tree. I guess we
> > can remove the offending patch from the IOMMU tree and let the DRM
> > tree include it based on a topic branch from Joerg.
> > 
> > Joerg, David, Mark Yao, what do you think?
> 
> Will the DRM patches go upstream soon, or is there still discussion
> around them? For now I am going to remove/revert that patch in my tree.

drm is pretty much done for 4.8, but as usual there's some driver
maintainers who are rather late. I'd say unlikely it lands in 4.8,
postpone to 4.9 seems more reasonable given the trouble it just caused.
-Daniel

> 
> 
> 	Joerg
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
