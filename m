From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Thu, 1 Oct 2015 08:41:38 +0200
Message-ID: <20151001064138.GO3383@phenom.ffwll.local>
References: <20151001124717.3e695a86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35074 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990AbbJAGio (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2015 02:38:44 -0400
Received: by wicge5 with SMTP id ge5so14036812wic.0
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2015 23:38:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151001124717.3e695a86@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 01, 2015 at 12:47:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "drm_agp_release" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "drm_agp_acquire" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "drm_agp_enable" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "drm_agp_info" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "drm_agp_release" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_acquire" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_free" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_bind" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_unbind" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_alloc" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_enable" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_info" [drivers/gpu/drm/mga/mga.ko] undefined!
> ERROR: "drm_agp_unbind_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_init" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_alloc_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_clear" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_info_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_enable_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_release_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_bind_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_acquire_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> ERROR: "drm_agp_free_ioctl" [drivers/gpu/drm/drm.ko] undefined!
> 
> Not quite sure which commit caused this, but I have used the drm-misc
> tree from next-20150930 for today.

Build fail for CONFIG_AGP=m (bot not y or n). I'm wrestling kbuild atm.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
